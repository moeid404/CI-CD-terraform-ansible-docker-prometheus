# Docker Installation Role

This role installs Docker and Docker Compose on the target server and configures the necessary permissions.

## Tasks Overview

### 1. Update APT Package Index
- Updates the APT package index to ensure the latest package information is available.

### 2. Ensure Curl is Installed
- Installs the `curl` package, which is required for fetching the Docker GPG key.

### 3. Install Required Packages for Docker
- Installs necessary packages for Docker installation, including:
  - `apt-transport-https`
  - `ca-certificates`
  - `software-properties-common`

### 4. Add Docker GPG Key
- Adds the Docker GPG key to verify the packages.

### 5. Add Docker APT Repository
- Adds the Docker APT repository for installing Docker.

### 6. Install Docker CE
- Installs the latest version of Docker Community Edition (CE).

### 7. Download Docker Compose Binary
- Downloads the Docker Compose binary and places it in `/usr/local/bin` with the appropriate permissions.

### 8. Verify Docker Compose Installation
- Checks the installed version of Docker Compose and displays it.

### 9. Configure Docker to Run Without Sudo
- Ensures the `DOCKER_HOST` variable is set in the user's `.bashrc`.
- Sources the `.bashrc` to apply changes.

### 10. Ensure Docker Group Exists
- Creates the `docker` group if it does not already exist.

### 11. Add User to Docker Group
- Adds the `ubuntu` user to the `docker` group to allow running Docker commands without sudo.

## Usage

1. Ensure the playbook is run as a user with sudo privileges.
2. Include this role in your playbook.
3. Run the playbook with the appropriate command to install Docker and Docker Compose.
