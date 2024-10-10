pipeline {
    agent any
    environment {
        agent = ""
        wp_db_host = ""
        prometheus_server = ""
    }
    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/moeid404/test.git', branch: 'master' // Replace with your actual repo URL
            }
        }
        stage('Infrastructure Setup') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws_access_key_id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws_secret_access_key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir('ansible/roles/4.terraform') {
                        // Initialize Terraform with AWS credentials from Jenkins
                        sh 'terraform init'

                        // Export AWS environment variables for Terraform to use
                        withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}"]) {
                            sh 'terraform apply -auto-approve'
                            
                            // Capture the public and private IPs from Terraform output
                            script {
                                agent = sh(script: "terraform output -raw agent_public_ip", returnStdout: true).trim()
                                wp_db_host = sh(script: "terraform output -raw agent_private_ip", returnStdout: true).trim()  // Corrected to agent_private_ip
                                prometheus_server = sh(script: "terraform output -raw prometheus_public_ip", returnStdout: true).trim()
                            }

                            // Output the captured IPs for debugging
                            echo "Agent Public IP: ${agent}"
                            echo "Agent Private IP (WP DB Host): ${wp_db_host}"
                            echo "Prometheus Server IP: ${prometheus_server}"
                        }
                    }
                }
            }
        }
        stage('Update Ansible Hosts and Vars') {
            steps {
                script {
                    // Dynamically add agent and prometheus_server to hosts.ini without duplicates and ensure proper newlines
                    sh """
                    # Ensure newline before adding new sections
                    if ! grep -q '\\[agent\\]' ansible/hosts.ini; then
                      echo '\n[agent]' >> ansible/hosts.ini
                      echo '${agent}' >> ansible/hosts.ini
                    fi

                    if ! grep -q '\\[prometheus_server\\]' ansible/hosts.ini; then
                      echo '\n[prometheus_server]' >> ansible/hosts.ini
                      echo '${prometheus_server}' >> ansible/hosts.ini
                    fi
                    """

                    // Dynamically update the first 3 lines in vars.yml
                    sh """
                    sed -i '1s/.*/agent: ${agent}/' ansible/vars.yml
                    sed -i '2s/.*/wp_db_host: ${wp_db_host}/' ansible/vars.yml
                    sed -i '3s/.*/prometheus_server: ${prometheus_server}/' ansible/vars.yml
                    """
                }
            }
        }

        stage('Wait Before Deployment') {  // Added delay before deployment
            steps {
                echo 'Waiting for 30 seconds before deployment...'
                sleep(time: 30, unit: 'SECONDS')  // Delay for 30 seconds
            }
        }

        stage('Deployment') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'ssh_key', keyFileVariable: 'SSH_KEY', usernameVariable: 'SSH_USER')]) {
                    withEnv(["ANSIBLE_HOST_KEY_CHECKING=False"]) {
                        dir('ansible') {
                            sh """
                            ansible-playbook -i hosts.ini agent_play.yml --user ${SSH_USER} --private-key ${SSH_KEY}
                            """
                        }
                    }
                }
            }
        }
        stage('Monitoring Setup') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'ssh_key', keyFileVariable: 'SSH_KEY', usernameVariable: 'SSH_USER')]) {
                    withEnv(["ANSIBLE_HOST_KEY_CHECKING=False"]) {
                        dir('ansible') {
                            sh """
                            ansible-playbook -i hosts.ini prometheus_play.yml --user ${SSH_USER} --private-key ${SSH_KEY}
                            """
                        }
                    }
                }
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
