# Leafiny sample data

## Installation

### Database

Import the database backup for your Leafiny version:

```bash
mysql -u {user} -h {host} -p {database} < 1.11.0/database/leafiny_cms.sql
```

Admin user credentials:

- **Username:** leafiny
- **Password:** Leafiny123

### Media

Copy the media directory into your Leafiny website root directory:

```bash
cp -R -f 1.11.0/media {leafinyRoot}
```

## Script

You can use the `install.sh` script:

```bash
sh install.sh

Leafiny version (1.11.0): 

[Import sample database]

Database host (localhost): 
Database port (3306): 
Database user (root): 
Database name (leafiny_cms): 
Enter password: 

[Import sample media]

Leafiny root path directory (/var/www/leafiny): 

Media files was copied.

Done!
```
