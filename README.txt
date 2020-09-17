# cosc349Assignment1
A vagrant system where VM's interact to provide a localhost webservice

@Author Leon Hoogenraad, University of Otago 2538994


For the user:


University of Otago past exams aren't provided with answers, so when practicing for actual
exams with these, students aren't able to be totally confident that their answers are correct.

This webservice allows students to view answers other students have uploaded to past exam questions.
To upload an answer the following data must be given: paper code, exam year, exam question, and the answer to the question.
The uploader also has the option to give their university username, but this is not required.

To run this system run: vagrant up   (This will probably take 2-3 minutes)
Once all the Virtual Machines have booted, navigate to: 127.0.0.1:8080 in a browser
to use the webservice. 

You can check that all the Virtual Machines are running by using: vagrant status
If this gives the following output, all the machines should be running correctly:






For the developer:

There are 3 VM's in this set up: dbserver, display and upload. 

The names are pretty self explanatory, the dbserver is responsible for hosting a mysql database
that the other 2 VM's can connect to. The display VM provides a webpage on 127.0.0.1:8080/index.php that
displays all the data entered by the users, and some dummy data that can be removed by commenting or
deleting the insert statement block at the bottom of the dbsetup.sql file in the home directory.
The upload server provides a webpage on 127.0.0.1:8090/upload.php which allows users to upload their exam
answers to the db. It should be noted there is no validation/parsing what so over on the stuff users enter.

You are able to vagrant up designated machines, e.g. vagrant up dbserver display   would ignore booting up
the upload VM.

If you make changes to a running VM's webpage or schema, you can run vagrant reload machine_name to avoid recreating
the entire machine. However if you make changes to the shell script you need to run vagrant destroy machine_name
in order to affect those changes

-----      Network     -----
All 3 VM's are connected to a private network (named private_network) on 192.168.2.x (x is of course based
on which machine we're talking about). The addresses of the machines on this network are:

dbserver: 192.168.2.12
display: 192.168.2.11
upload: 192.168.2.10


The two webserver VM's, display and upload, also port forward on 127.0.0.1 to provide their webservice:

display operates on the port 8080
upload operates on the port 8090

On each web page there is a link to the other web page, be aware that the href attribute of the <a> tag
must be something like href="http://127.0.0.1:8080/index.php" and not href="127.0.0.1:8080/index.php", because
the latter will not work correctly.


-----     VM Configuration      -----
The VM's are configured by the VagrantFile. In this file you should find comprehensive documentation on
what each line of code is doing. The shell scripts define what the VM will do once it has been created and
is running. These shell scripts should also have some documentation explaining what each line is doing, and
will also echo out information about the VM once it is done being set up.

the two website config files display.conf and upload.conf define the directories to find the 
php pages to display to the user. The sql file dbsetup.sql defines the database schema and inserts some
data into said database

-----     Webpage layout      -----
The webserver VM's serve webpages found in the www/ subdirectories. The display VM serves the index.php
webpage in www/display/ directory.
The upload VM serves the upload.php page in the www/upload/ directory.
The CSS files in both directories define the look of their respective .php pages.

In the www/upload directory there is also a php script called uploadToDB.php which is required
due to how submitting HTML forms works. Essentially when the user correctly fills out the form info
on upload.php, the user is redirected to http://127.0.0.1:8090/uploadToDB.php where the data is pulled from
the form, put into a prepared statement and then is executed and the data is uploaded to the mysql server.

At the very bottom of uploadToDB.php, there is a function call to redirect the user to the index page, as
it's pretty awful practice to leave the user on the empty page meant for handling a form submission.


