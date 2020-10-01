echo hello, world


# Installing the apache2, mysql, and php pakcages
apt-get install -y apache2 php libapache2-mod-php php-mysql


# Here we change the VM's web server config
# to use the one from the shared folder
cp /vagrant/display.conf /etc/apache2/sites-available/

chmod 755 /vagrant
chmod 755 /vagrant/www
chmod 755 /vagrant/www/display
chmod 755 /vagrant/www/display/index.css
chmod 755 /vagrant/www/display/index.php
chmod 755 /vagrant/www/display/favicon.ico

# Activating our website config
a2ensite display

# Disabling the default website apache2 gives
a2dissite 000-default

# Reloading the webserver config to affect our changes
service apache2 reload

