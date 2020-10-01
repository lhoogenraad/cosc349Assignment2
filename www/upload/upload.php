  <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
 <html>
    <head>
      <link rel='icon' type='image/x-icon' href='/favicon.ico' />
      <link rel='stylesheet' href='upload.css'>
      <title>Upload an Answer</title>
    </head>

    <body>
    <h1>Upload an Answer</h1>
      <form action="uploadToDB.php" method="post">
        <input type="text" name="code" id="code" placeholder="Paper code" required>
        <input type="text" name="year" id="year" placeholder="Exam year" required>
        <input type="text" name="question" id="question" placeholder="Question" required>
        <input type="text" name="answer" id="answer" placeholder="Your answer" required>
        <input type="text" name="username" id="username" placeholder="Username (optional)">
        <input type="submit" id="submit" value="Submit">
      </form>
      <a href="ec2-34-204-188-157.compute-1.amazonaws.com">Back to Home</a>
   </body>
</html>



