echo hello, world

apt-get update

# Installing the apache2, mysql, and php pakcages
apt-get install -y apache2 php libapache2-mod-php php-mysql

chmod 755 /vagrant
chmod 755 /vagrant/www
chmod 755 /vagrant/www/upload
chmod 755 /vagrant/www/upload/upload.css
chmod 755 /vagrant/www/upload/upload.php
chmod 755 /vagrant/www/upload/uploadToDB.php
chmod 755 /vagrant/www/upload/favicon.ico

# Here we change the VM's web server config
# to use the one from the shared folder
cp /vagrant/upload.conf /etc/apache2/sites-available/

# Activating our website config
a2ensite upload

# Disabling the default website apache2 gives
a2dissite 000-default

# Reloading the webserver config to affect our changes
service apache2 reload
