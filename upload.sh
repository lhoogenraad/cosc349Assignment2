echo hello, world

apt-get update

# Installing the apache2, mysql, and php pakcages
apt-get install -y apache2 php libapache2-mod-php php-mysql


# Here we change the VM's web server config
# to use the one from the shared folder
cp /vagrant/upload.conf /etc/apache2/sites-available/

# Activating our website config
a2ensite upload

# Disabling the default website apache2 gives
a2dissite 000-default

# Reloading the webserver config to affect our changes
service apache2 reload

echo This machine is responsible for allowing a user to upload their past exam answers.
echo It runs an apache2 webserver which serves a webpage on 127.0.0.1:8090/upload.php that provides
echo a form to enter answer data into.

echo This machine should now be running. If you also have the display VM running, there should be a
echo link to navigate to the upload page from 127.0.0.1:8080/index.php
echo If not, and you just want to enter some data, head to 127.0.0.1:8090/upload.php
