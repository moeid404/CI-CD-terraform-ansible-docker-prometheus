# Nginx and WordPress Setup Role

This role sets up the Nginx web server and configures WordPress on the target server.

## Tasks Overview

### 1. Create Nginx Directory
- Creates the `/var/www/html/` directory with the appropriate permissions.

### 2. Copy WordPress Directory
- Uses `rsync` to copy the WordPress files from the local machine to the remote server's Nginx directory.
- Sets permissions and ownership for the copied files to ensure they are accessible by the web server.

### 3. Set File Permissions
- Changes the permissions of all files in the WordPress directory to `644` for security.

### 4. Delete Sample Configuration
- Removes the `wp-config-sample.php` file from the WordPress directory to prevent confusion.

### 5. Copy Configuration Template
- Copies a templated `wp-config.php` file to the WordPress directory, allowing for customization based on the environment.

## Usage

1. Set the following variables in your playbook:
   - `app_name`: The name of the application (used in the directory path).
   
2. Ensure the `wp-config.php.j2` template file is available in the specified location.
3. Include this role in your playbook.
4. Run the playbook with the appropriate command to set up Nginx and WordPress.
