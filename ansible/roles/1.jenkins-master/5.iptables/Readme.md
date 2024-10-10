# iptables Configuration Role

This role installs the `iptables-persistent` package and applies firewall rules.

## Tasks Overview

### 1. Install iptables-persistent
- Installs the `iptables-persistent` package to enable persistent firewall rules.
- Updates the package index before installation.

### 2. Apply iptables Rules
- Executes the `firewall-rules.sh` script to apply the specified iptables rules.

## Usage

1. Ensure the `firewall-rules.sh` script is available and contains the desired iptables rules.
2. Include this role in your playbook.
3. Run the playbook with the appropriate command to set up iptables.
