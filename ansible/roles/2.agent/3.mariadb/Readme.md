# MariaDB Installation Role

This role installs MariaDB and configures it for use with WordPress.

## Tasks Overview

### 1. Install MariaDB Server and Dependencies
- Installs the latest version of MariaDB server and the `python3-mysqldb` package.

### 2. Ensure MariaDB Service is Running
- Starts the MariaDB service and enables it to run at boot.

### 3. Create WordPress Database
- Creates a database for WordPress using the specified root credentials.

### 4. Create WordPress User
- Creates a new MySQL user with privileges to the WordPress database.

### 5. Set Bind Address for MariaDB
- Configures the `bind-address` in the MariaDB configuration file to the specified IP address.

### 6. Restart MariaDB
- Restarts the MariaDB service to apply the configuration changes.

## Usage

1. Set the following variables in your playbook:
   - `mariadb_root_password`: The password for the MariaDB root user.
   - `wp_db_name`: The name of the WordPress database.
   - `wp_db_user`: The username for the WordPress database.
   - `wp_db_password`: The password for the WordPress database user.
   - `wp_db_host`: The desired bind address for MariaDB.
   
2. Include this role in your playbook.
3. Run the playbook with the appropriate command to install and configure MariaDB.
