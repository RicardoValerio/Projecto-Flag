
<?php


$email=$_POST['email'];
$nome=$_POST['nome'];
$morada=$_POST['morada'];
$telefone=$_POST['telefone'];
$curso=$_POST['curso'];
$plataforma=$_POST['plataforma'];
$horario=$_POST['horario'];
$comentario=$_POST['comentario'];
$feedback=$_POST['feedback'];



$mysqli = new mysqli("localhost", "root", "root", "flag_projecto_cursos_inscricao");
if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
}

$sql = "SELECT id_curso_do_aluno
		FROM curso_horario
		WHERE id_curso_fk"."=". $curso . " AND id_horario_fk"."=". $horario;


$result=$mysqli->query($sql);

while($row = $result->fetch_array()){
    $escolha = $row['id_curso_do_aluno'];
  // 	echo $escolha;
  // echo "<br />";
 }


$sql = "INSERT INTO aluno_inscrito
	(email, nome, morada, contacto_telf, id_curso_fk, id_plataforma_fk, comentario)
	 VALUES
	('{$email}', '{$nome}','{$morada}', '{$telefone}', {$escolha}, {$plataforma}, '{$comentario}')";

$mysqli->query($sql);


switch ($feedback) {
	case '1':
			$coluna="contador_internet";
		break;
	case '2':
			$coluna="contador_amigo";
		break;
	case '3':
			$coluna="contador_evento";
		break;
	case '4':
			$coluna="contador_outro";
		break;

}

$sql="update marketing_feedback SET ". $coluna . "=" . $coluna . "+1";

$mysqli->query($sql);

header("Location: ../inscrito.html");

$mysqli->close();






?>
