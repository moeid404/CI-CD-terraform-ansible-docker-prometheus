# Ansible Playbook for Jenkins, Ansible, and Terraform Installation

This role automates the installation of Jenkins, Ansible, and Terraform on a Debian-based system.

## Prerequisites

- **Ansible**: Make sure Ansible is installed on your control machine.
- **Target Machine**: A Debian-based system with sudo access.

## What This Playbook Does

### 1. Install Jenkins
- Updates the package index.
- Installs necessary packages (like Java).
- Adds the Jenkins GPG key and repository.
- Installs Jenkins and starts the service.
- Retrieves the initial admin password for Jenkins.

### 2. Install Ansible
- Updates the package index.
- Installs required tools.
- Adds the Ansible PPA (Personal Package Archive).
- Installs Ansible.

### 3. Install Terraform
- Updates the package index.
- Installs tools for managing repositories.
- Downloads the HashiCorp GPG key and adds the repository.
- Installs Terraform.

## How to Run the Playbook

1. Clone this repository to your local machine.
2. Open a terminal and navigate to the playbook directory.
3. Run the playbook with the following command:

   ```bash
   ansible-playbook jenkins_play.yml -i inventory_file
