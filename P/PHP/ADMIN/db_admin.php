

<?php

require 'database.php';


if (isset($_GET['action']) && $_GET['action'] == 'logout')
{
    $connection->exec("UPDATE login SET in_out = 0 WHERE user_name = 'admin'");
    header('Location: ../../index.html');
    die();
}

$in_out = $connection->query("SELECT in_out FROM login");
$in_out = $in_out->fetch();

$valor_bool = $in_out[0];
//print_r($valor_bool);

    if ($valor_bool != 1)
    {   // =P
        header('Location: http://www.youtube.com/watch?v=4Z9WVZddH9w');
    }



$sql = 'SELECT  aluno_inscrito.id_aluno_inscrito,
                aluno_inscrito.nome,
                aluno_inscrito.email,
                aluno_inscrito.morada,
                aluno_inscrito.contacto_telf,
                curso.nome_curso,
                horario.descricao as horario,
                plataforma.descricao as plataforma,
                aluno_inscrito.comentario
        FROM curso,
             curso_horario,
             horario,
             aluno_inscrito,
             plataforma
        WHERE aluno_inscrito.id_curso_fk = curso_horario.id_curso_do_aluno
         AND   plataforma.id_plataforma = aluno_inscrito.id_plataforma_fk
         AND   horario.id_horario = curso_horario.id_horario_fk
         AND   curso.id_curso = curso_horario.id_curso_fk';


$result_set = $connection->query($sql);

$numeroLinhas = $result_set->rowCount();



//////////////////////////////////////////////////////////////////


$sql2 = "SELECT * FROM marketing_feedback";
$result_marketing = $connection->query($sql2);


$sql3 = "SELECT * FROM questao_contacto";
$result_questao = $connection->query($sql3);



?>



<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Bd Flag</title>

        <link rel="stylesheet" type="text/css" href="estilos.css" media="all" />

</head>

<body>

	<h1 class="titulo">SQL + PHP</h1>
  <a id = "logout" href="?action=logout">Logout</a>



<div class="cabecalho">
	<h3 class="subtitulo">Inscriçoes-online</h3>
</div>

<table id="paredeverde">

<tr>
  <th>Nome</th>
  <th>Email</th>
  <th>Morada</th>
  <th>Telefone</th>
  <th>Curso</th>
  <th>horario</th>
  <th>Plataforma</th>
  <th>Comentario</th>
</tr>


<?php foreach ($result_set as $coluna): ?>

<tr>
                <td>  <?php echo $coluna['nome']; ?> </td>
		<td>  <?php echo $coluna['email']; ?> </td>
		<td>  <?php echo $coluna['morada']; ?> </td>
		<td>  <?php echo $coluna['contacto_telf']; ?> </td>
		<td>  <?php echo $coluna['nome_curso']; ?> </td>
		<td>  <?php echo $coluna['horario']; ?> </td>
		<td>  <?php echo $coluna['plataforma']; ?> </td>
		<td>  <?php echo $coluna['comentario']; ?> </td>
                <td><a href="mailto: <?php echo $coluna['email']; ?> " value="Email" />Email</td>
                <td>
                    <form action="delete_aluno.php" method="post">
                        <input type="hidden" name="id"  value=" <?php echo $coluna['id_aluno_inscrito'];  ?> "/>
                        <input type="submit" value="Delete" />
                    </form>
                </td>
</tr>


    <?php endforeach; ?>


</table>
        <div class="cabecalho">
        <h3 class="subtitulo">Total: <?php echo $numeroLinhas;  ?></h3>
        </div>
<br><br>


<div class="cabecalho">
	<h3 class="subtitulo">Estatistica-marketing</h3>
</div>

<table id="paredeverde">

<tr>
  <th>Internet</th>
  <th>Amigo</th>
  <th>Evento</th>
  <th>Outro</th>
</tr>

<?php foreach ($result_marketing as $contador): ?>

<tr>
                <td>  <?php echo $contador['contador_internet']; ?> </td>
		<td>  <?php echo $contador['contador_amigo']; ?> </td>
		<td>  <?php echo $contador['contador_evento']; ?> </td>
		<td>  <?php echo $contador['contador_outro']; ?> </td>

</tr>


    <?php endforeach; ?>


</table>

       <div class="cabecalho">
           <h3 class="subtitulo">&nbsp;</h3>
        </div>
<br><br>




<div class="cabecalho">
	<h3 class="subtitulo">Comentarios</h3>
</div>

<table id="paredeverde">

<tr>
  <th>Email</th>
  <th>Nome</th>
  <th>Questao</th>
</tr>

<?php if ($valor_bool): ?>
 <?php foreach ($result_questao as $questao): ?>

<tr>
                <td>  <?php echo $questao['email']; ?> </td>
		<td>  <?php echo $questao['nome']; ?> </td>
		<td>  <?php echo $questao['questao']; ?> </td>
                <td><a href="mailto: <?php echo $questao['email']; ?> " value="Email" />Email</td>
                <td>
                    <form action="delete_comentario.php" method="post">
                        <input type="hidden" name="id"  value=" <?php echo $questao['id_questao'];  ?> "/>
                        <input type="submit" value="Delete" />
                    </form>
                </td>

</tr>


    <?php endforeach; ?>
<?php endif;  ?>


</table>

       <div class="cabecalho">
           <h3 class="subtitulo">&nbsp;</h3>
        </div>
<br><br>



<script type="text/javascript">
//    colocar as linhas pares com um backgroundColor diferente
    var trArray = document.getElementsByTagName('tr');
    console.log(trArray);
    for (i = 0; i < trArray.length; i++) {
      if (i%2==0) {
       trArray[i].style.backgroundColor="#EAF2D3";
        }
     }
</script>
</body>
</html>
