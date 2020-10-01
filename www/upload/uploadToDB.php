    <?php
      $db_host = 'examanswersdb.craafeyaeyxp.us-east-1.rds.amazonaws.com';
      $db_name = 'examanswers';
      $db_user = 'examadmin';
      $db_passwd = 'examanswers123';

      $pdo_dsn = "mysql:host=$db_host;dbname=$db_name";

      $pdo = new PDO($pdo_dsn, $db_user, $db_passwd);
      
      /*
        This code uses prepared statements to prevent against sql injections
        It definitely is overkill to use prepared statements for a task like
        this where any data uploaded is displayed publicly. However, I believe 
        it's good practice to protect against sql injections no matter what.
      */
        
      $sql = "INSERT INTO answers VALUES(?,?,?,?,?)";
      
      $stmt = $pdo->prepare($sql);
      
      /*
        This code is where we pull the data the user entered from the form on upload.php
        and send it to the database by executing our prepared statement.
      */
      $code = $_POST['code'];
      $year = $_POST['year'];
      $question = $_POST['question'];
      $answer = $_POST['answer'];
      $username = $_POST['username'];
      $code = strtoupper($code);
      $username = strtoupper($username);
		
      $result = $stmt->execute([$code, $year, $question, $answer, $username]);
     
      // This line of code redirects the user to the home page, as leaving
      // the user on a blank page made for php code is a bit ugly!
      // Feel free to comment it out if you're about that though.
      header("Location: http://ec2-34-204-188-157.compute-1.amazonaws.com");
    ?>
