apt-get update

# This is a shell variable that contains the mysql root password
# If for some reason you need to poke around in the mysql process on the dbserver VM,
# run: "vagrant ssh dbserver"   to ssh onto the VM
# run: "export MYSQL_PWD='admin_pw'" to create a shell variable called $MYSQL_PWD which will
# be used when logging into the mysql process, then finally run:
# "mysql -u root"     to log into the mysql process.
# (Assuming you want to acess the database concerned with this system,
# you should then run "use examanswers;" to use the correct database)
export MYSQL_PWD='admin_pw'

# These linues automatically answers set-up questions from installing the 
# mysql package, which means our startup script isn't interrupted.
echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections 
echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections

# Installing the mysql server
apt-get -y install mysql-server

# This creates a new database called examanswers
echo "CREATE DATABASE examanswers;" | mysql

# This creates a db user called webuser with the password db_pw
echo "CREATE USER 'webuser'@'%' IDENTIFIED BY 'db_pw';" | mysql

# This grants all the permissions to the newly created webuser on the examanswers db
echo "GRANT ALL PRIVILEGES ON examanswers.* TO 'webuser'@'%'" | mysql

# Sets the shell variable from the start of the script to the non-admin password
export MYSQL_PWD='db_pw'

# Here we are copying our schema into mysql so that our tables
# and data are created
cat /vagrant/dbsetup.sql | mysql -u webuser examanswers
echo Executing setup schema script for mysql now

# This line makes it so mysql will listen to any network requests
# (by default it will only listen for local network requests)
sed -i'' -e '/bind-address/s/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Now we restart mysql to affect our changes
service mysql restart
