<?php

require 'PHP/ADMIN/database.php';
#################################################################

@$user = $_POST['user'];
@$password = $_POST['password'];

$password = hash('sha512',$password);


// DB - username e a hash_pass

$sql = "SELECT user_name, password
        FROM login
        WHERE user_name = '". $user ."' ";

// Query
$result_set = $connection->query($sql); //$result_set fica um PDOStatment Object

$row = $result_set->fetch();   // $row fica um array da primeira linha da condiçao

$pass_db = $row['password'];


//comparar valores
if (isset($user) && isset($password)) {
    
    if(!($password == $pass_db) ? true : false)
    {
     $error = "Dados inválidos...por favor tente de novo!";
    }
    else
    {
        $sql = "UPDATE login SET in_out = 1 
                WHERE user_name = '" . $user . "' ";
        
        $connection->exec($sql);
        
        header('Location: PHP/ADMIN/db_admin.php');
    }
}

//


?>


<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>

    </style>
</head>
<body>

    <div>
        <p>
            <label>User:</label>  admin<br>

            <label>Pass:</label>  paredeverde
        </p>
    <br>
    <br>
        <form action="admin.php" method="post">
	        <label for="user">Username:</label>
	        <input type="text" name="user" id="user" />

	        <label for="password">Password:</label>
	        <input type="text" name="password" id="password" />

                <input type="submit" value="Login" />
                <p style="color:red;">
                    <?php if (isset($error)) {
                        echo $error;
                    }  ?>
                </p>
        </form>

    </div>

</body>
</html>
