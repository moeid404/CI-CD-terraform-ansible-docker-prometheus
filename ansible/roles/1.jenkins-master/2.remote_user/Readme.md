# User Management and SSH Setup Playbook

This role is responsible for creating users, setting up SSH access, and configuring sudo privileges.

## Tasks Overview

### 1. Create a User
- Creates a user with the specified username.
- Sets the default shell to `/bin/bash`.
- Adds the user to the `sudo` group.

### 2. Set Up SSH Directory
- Creates an `.ssh` directory in the user's home folder.

### 3. Copy SSH Public Key
- Copies your local SSH public key (`id_rsa.pub`) to the remote user's `authorized_keys`, allowing SSH access without a password.

### 4. Configure Sudo Privileges
- Adds the user and `jenkins` to the `/etc/sudoers` file, allowing them to run any command without a password.

### 5. Generate SSH Key (if needed)
- Checks if an SSH key exists. If not, generates a new RSA SSH key with 4096 bits.

## Optional: Add Teammates
If you want to add teammates, you can uncomment the following tasks:

- **Create Teammate User**: Similar to the main user creation.
- **Set Up Teammate's SSH**: Creates an SSH directory and copies their public key.
- **Configure Teammate's Sudo Privileges**: Adds them to the sudoers file.

## Usage

1. Adjust the variables (`user_name_jankins`, `teammate`) as needed.
2. Uncomment the teammate section if you want to add additional users.
3. Include this part in your playbook and run it with the appropriate command.
