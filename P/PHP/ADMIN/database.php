<?php



$dsn = 'mysql:host=localhost;dbname=flag_projecto_cursos_inscricao';

$username = 'root';
$passwd = 'root';

try {

    $connection = new PDO($dsn, $username, $passwd);

} catch (PDOException $e) {
    $error_message = $e->getMessage();
    echo '<strong>Houve um erro ao tentar conectar! </strong>' . $error_message;
    die();
}


?>
