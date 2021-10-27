<?php
error_reporting(-1);
ini_set('display_errors','On');
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
          <div class="col">
            <?php include 'card.php'?>
          </div>
          <div class="col">
            <?php include 'card.php'?>
          </div>
          <div class="col">
            <?php include 'card.php'?>
          </div>
          <div class="col">
            <?php include 'card.php'?>
          </div>
        </div>
      </section>
    <script src="assets/js/bootstrap.bundle.js"></script>
  </body>
</html>
