# SSH Configuration Role

This role configures the SSH service to enhance security.

## Tasks Overview

### 1. Change SSH Port
- Modifies the default SSH port from `22` to a custom port specified by the variable `port`.

### 2. Disable Root Login
- Sets `PermitRootLogin` to `no` to prevent root login via SSH.

### 3. Enable Public Key Authentication
- Ensures that public key authentication is enabled by setting `PubKeyAuthentication` to `yes`.

### 4. Disable Password Authentication
- Disables password authentication by setting `PasswordAuthentication` to `no`.

### 5. Restart SSH Service
- Restarts the SSH service to apply the changes made in the configuration file.

## Usage

1. Set the desired SSH port in the variable `port`.
2. Include this role in your playbook.
3. Run the playbook with the appropriate command to apply the SSH configuration.
