<?php


require 'database.php';

$id_aluno = $_POST['id'];

print_r($id_aluno);

//DELETE
$sql = "DELETE FROM aluno_inscrito WHERE id_aluno_inscrito = $id_aluno ";

if ($delete_count = $connection->exec($sql)) {
    header('Location: db_admin.php');
} else {
    echo 'Nenhuma row afectada!';
}
  

        
?>
