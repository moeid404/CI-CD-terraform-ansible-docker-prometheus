# Docker and Nginx Containers Role

This role sets up the necessary directories and configuration files for Nginx, PHP-FPM, and Docker.

## Tasks Overview

### 1. Create Multiple Directories
- Creates the following directories:
  - `/etc/nginx/conf.d` for Nginx configuration files.
  - `/srv/docker` for Docker working files.
  - `/usr/local/etc/php-fpm.d` for PHP-FPM configuration files.

### 2. Copy Nginx Configuration Template
- Copies the `nginx.conf.j2` template to `/etc/nginx/conf.d/nginx.conf`.

### 3. Copy PHP-FPM Configuration
- Copies the `www.conf` file to the PHP-FPM configuration directory.

### 4. Copy Docker Compose Template
- Copies the `docker-compose.yml.j2` template to the specified Docker Compose path.

### 5. Copy Dockerfile
- Copies the `Dockerfile` to the specified Dockerfile path.

### 6. Start Containers Using Docker Compose
- Uses Docker Compose to start the containers defined in the `docker-compose.yml` file in detached mode.

## Usage

1. Ensure the following variables are set in your playbook:
   - `docker_compose_path`: The destination path for the Docker Compose file.
   - `dockerfile_path`: The destination path for the Dockerfile.
   
2. Ensure the relevant template and configuration files are available.
3. Include this role in your playbook.
4. Run the playbook with the appropriate command to set up Docker and Nginx configurations.
