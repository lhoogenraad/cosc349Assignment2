echo hello, world

apt-get update

# Installing the apache2, mysql, and php pakcages
apt-get install -y apache2 php libapache2-mod-php php-mysql


# Here we change the VM's web server config
# to use the one from the shared folder
cp /vagrant/display.conf /etc/apache2/sites-available/

# Activating our website config
a2ensite display

# Disabling the default website apache2 gives
a2dissite 000-default

# Reloading the webserver config to affect our changes
service apache2 reload

echo This machine runs a forwaded port on 127.0.0.1:8080, which accepts http requests using apache2 webserver
echo This machine is also running an interface on 192.168.11, which
echo allows it to access the mysql database server which runs on 192.168.2.12


echo This machine should now be accepting http requests.
echo navigate to: 127.0.0.1:8080/index.php to access the exam answers home page.

