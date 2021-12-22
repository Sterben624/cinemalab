<?php

session_start();

if(!isset($_SESSION["session_phone"])):
header("location:index.php");
else:
?>
<?php require_once("includes/connection.php"); ?>
<?php 
$id="";
$name="";
$price="";
$rating="";
function getPosts(){
	$posts=array();
	$posts[0]=$_POST['id_ticket'];
	$posts[1]=$_POST['user_id_user'];
	$posts[2]=$_POST['session_id_session'];
	$posts[3]=$_POST['VIP'];
	$posts[4]=$_POST['place'];
	return $posts;
}
if (isset($_POST['insert'])){
	$data=getPosts();
	echo $data[1];
	echo $data[2];
	echo $data[3];
	echo $data[4];
	$insert_Query="INSERT INTO `tickets` (`user_id_user`, `session_id_session`, `VIP`, `place`) VALUES ('$data[1]', '$data[2]', '1', '$data[4]')";
	try{
		$insert_Result=mysqli_query($con, $insert_Query);
		if($insert_Result){
			if(mysqli_affected_rows($con)>0){
				echo 'Data insered';
			}else{
				echo 'Data Not insered';
			}
		}
	}catch(Exception $ex){
		echo 'Error insert' .$ex->getMessage();
	}
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Cinema</title>
<link href="css/style.css" media="screen" rel="stylesheet">
<link href= 'http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
</head>
<div id="welcome" background="photo/fone.jpg">
<h2 align='center'>Добро пожаловать, <span><?php echo $_SESSION['session_phone'];?>! </span></h2>
<h2 align='center'>Фільми в прокаті</h2>
<?php
$user_phone=$_SESSION['session_phone'];
$sql2=mysqli_query($con,"SELECT id_user FROM user WHERE phone='$user_phone'");
while($roww=mysqli_fetch_assoc($sql2))
 {
	$user_id_user=$roww['id_user'];
 }
$sql = "SELECT * FROM film";
if($result = $con->query($sql)){
    echo "<table><tr bgcolor='#D3EDF6'><th>Id</th><th>Назва</th><th>Ціна</th><th>Рейтинг</th></tr>";
    foreach($result as $row){?>
        <tr>
           <?php
		    echo "<td align='center'><a>" . $row["id_film"] . "</a></td>";
            echo "<td>" . $row["name"] . "</td>";
            echo "<td align='center'>" . $row["price"] . "</td>";
			echo "<td align='center'>" . $row["rating"] . "</td>";?>
        </tr>
   <?php }
    echo "</table>";
    $result->free();
} else{
    echo "Ошибка: " . $conn->error;
}?>
<h2 align='center'>Сеанси зараз</h2>
<?php
$sql2 = "SELECT * FROM session";
if($result2 = $con->query($sql2)){
    echo "<table><tr bgcolor='#D3EDF6'><th>Id</th><th>Id Film</th><th>Зала</th><th>Дата</th></tr>";
    foreach($result2 as $row){?>
        <tr>
           <?php
		    echo "<td align='center'><a>" . $row["id_session"] . "</a></td>";
            echo "<td align='center'>" . $row["film_id_film"] . "</td>";
            echo "<td align='center'>" . $row["hall_id_hall"] . "</td>";
			echo "<td align='center'>" . $row["time"] . "</td>";?>
        </tr>
   <?php }
    echo "</table>";
	echo $user_id_user;
    $result2->free();
} else{
    echo "Ошибка: " . $conn->error;
}
?>
  <h2 align='center'>Зробити вибір:</h2>
  <form action="" id="loginform" method="post"name="loginform">
<p><label for="user_login">Id користувача<br>
<input class="input" id="user_id_user" name="user_id_user"size="20"
type="number" value="<?php echo $user_id_user ?>"></label></p>
<p><label for="user_pass">Введіть номер сесcії<br>
<input class="input" id="session_id_session" name="session_id_session"size="20"
type="number" value=""></label></p>
<p><label for="user_pass">VIP: 1 - так, 0 - ні<br>
<input class="input" id="VIP" name="VIP"size="20"
type="number" value=""></label></p>
<p><label for="user_pass">Місце<br>
<input class="input" id="place" name="place"size="20"
type="number" value=""></label></p>
</form>
<p class="submit">
<input class="button" type="submit" name="insert" value="Замовити">
</p>
  <p><a href="logout.php">Выйти</a> из системы</p>
</div>

  
</div>
	
<?php include("includes/footer.php"); ?>
	
<?php endif; ?>
