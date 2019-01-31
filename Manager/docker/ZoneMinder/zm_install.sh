BASEDIR=/mnt/nas/docker/zoneminder

# (MySQL Data, drwxr-xr-x 6   27 27)
mkdir -p $BASEDIR/mysql
chmod -R 755 $BASEDIR/mysql

# (directory for images, drwxrwx--- 5 root 33)
mkdir -p $BASEDIR/zoneminder
chmod -R 750 $BASEDIR/zoneminder

# (directory for backups, drwxr-xr-x 2 root root)
mkdir -p $BASEDIR/backup
chmod -R 755 $BASEDIR/backup

# (configuration files, drwxrwxr-x  7 1000 1000, only conf/mysql/my.cnf is required)
mkdir -p $BASEDIR/conf/mysql
chmod -R 775 $BASEDIR/conf

cat >> $BASEDIR/conf/mysql/my.cnf << EOF
# For advice on how to change settings please see
# http://dev.mysql.com/doc/refman/5.7/en/server-configuration-defaults.html

[mysqld]
#
# Remove leading # and set to the amount of RAM for the most important data
# cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%.
# innodb_buffer_pool_size = 128M
#
# Remove leading # to turn on a very important data integrity option: logging
# changes to the binary log between backups.
# log_bin
#
# Remove leading # to set options mainly useful for reporting servers.
# The server defaults are faster for transactions and fast SELECTs.
# Adjust sizes as needed, experiment to find the optimal values.
# join_buffer_size = 128M
# sort_buffer_size = 2M
# read_rnd_buffer_size = 2M
skip-host-cache
skip-name-resolve
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
secure-file-priv=/var/lib/mysql-files
user=mysql

# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
sql_mode = NO_ENGINE_SUBSTITUTION
max_connections = 500
EOF
