# Node Exporter Installation Role

This role installs Node Exporter on the target server for system metrics collection.

## Tasks Overview

### 1. Copy Installation Script
- Copies the `install_node_exporter.sh` script from the local machine to the target server at `/tmp/install_node_exporter.sh`.
- Sets the script's permissions to make it executable.

### 2. Run Installation Script
- Executes the Node Exporter installation script to set up Node Exporter on the server.

## Usage

1. Ensure the `install_node_exporter.sh` script is present in the correct location.
2. Include this role in your playbook.
3. Run the playbook with the appropriate command to install Node Exporter.
