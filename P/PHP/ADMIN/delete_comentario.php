<?php

require 'database.php';

$id_questao = $_POST['id'];

//print_r($id_questao);


//DELETE
$sql = "DELETE FROM questao_contacto WHERE id_questao = $id_questao";

if ($delete_count = $connection->exec($sql)) {
    header('Location: db_admin.php');
} else {
    echo 'Nenhuma row afectada!';
}
  




?>
