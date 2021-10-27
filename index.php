<?php
error_reporting(-1);
ini_set('display_errors','On');
//database
$username = "shop";
$password = "123456";
$dsn = "mysql:host=127.0.0.1:3307;dbname=shop;charset=utf8";
$db=new PDO($dsn,$username,$password);
$sql="SELECT id,titel,beschreibung,price FROM products";
$result=$db->query($sql);
?>
<!DOCTYPE html>
<html lang="de">
  <head>
    <title>Minh</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    </head>
  <body>
      <header class="jumbotron">
        <div class="container">
          <h1>Ricardo Milos Online Shop</h1>
        </div>
      </header>
      <section class="container" id="products">
        <div class="row">
          <?php while($row = $result->fetch()):?>
            <div class="col">
              <?php include 'card.php'?>
            </div>
          <?php endwhile;?>
        </div>
      </section>
    <script src="assets/js/bootstrap.bundle.js"></script>
  </body>
</html>
