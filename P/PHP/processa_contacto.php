
<?php

@$email=$_POST['email'];
@$nome=$_POST['nome'];
@$questao=$_POST['questao'];


$mysqli = new mysqli("localhost","root", "root", "flag_projecto_cursos_inscricao");
if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
}


$sql="INSERT INTO questao_contacto
  		VALUES(NULL,'". $email ."','". $nome ."','". $questao ."')";


$mysqli->query($sql);


header("Location: ../comentario.html");


$mysqli->close();


?>
