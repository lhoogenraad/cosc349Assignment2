<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<html>
<head>
  <link rel='stylesheet' href='index.css'>
  <title>Past Otago exam answers</title>
</head>

<body>

<h1>Past Exam Answers</h1>

<table border="1">
<tr><th>Paper Code</th><th>Exam Year</th><th>Exam Question</th><th>Answer</th><th>University Username (optional)</th></tr>
<?php

  // These vars are used to connect to the mysql db automatically (basically makes code cleaner)
$db_host = '192.168.2.12';
$db_name = 'examanswers';
$db_user = 'webuser';
$db_passwd = 'db_pw';

$pdo_dsn = "mysql:host=$db_host;dbname=$db_name";

$pdo = new PDO($pdo_dsn, $db_user, $db_passwd);


$q = $pdo->query("SELECT * FROM answers");

// While we have data left from our select query, output that data to the table
while($row = $q->fetch()){
  echo "<tr><td>".$row["code"]."</td><td>".$row["year"]."</td><td>".$row["question"]."</td><td>".$row["answer"]."</td><td>".$row["username"]."</td></tr>\n";
}
?>
</table>
<a href="http://127.0.0.1:8090/upload.php">Upload an Answer</a>
</body>
</html>
