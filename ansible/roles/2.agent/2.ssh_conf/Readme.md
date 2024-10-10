# SSH Configuration Role

This role enhances SSH security by modifying the SSH daemon configuration.

## Tasks Overview

### 1. Change SSH Port
- Modifies the SSH port in the configuration file to a custom port specified by the variable `port`.

### 2. Disable Root Login
- Sets `PermitRootLogin` to `no` to prevent root login via SSH.

### 3. Enable Public Key Authentication
- Ensures `PubKeyAuthentication` is enabled by setting it to `yes`.

### 4. Disable Password Authentication
- Disables password authentication by setting `PasswordAuthentication` to `no`.

### 5. Restart SSH Service
- Restarts the SSH service to apply the changes made to the configuration.

## Usage

1. Set the desired SSH port in the variable `port`.
2. Include this role in your playbook.
3. Run the playbook with the appropriate command to apply the SSH configuration.
