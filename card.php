<div class="card">
  <div class="card-title"><?=$product['titel']?></div>
  <img src="https://image.yes24.vn/Upload/ProductImage/thethaochinhang/2063162_L.jpg?width=550&height=550" class="card-img-top" alt="products">
  <div class="card-body">
    <?=$product['describtion']?>
    <hr>
    <?=$product['price']?>
  </div>
  <div class="card-footer">
    <a href="" class="btn btn-primary btn-sm">details</a>
    <a href="index.php/cart/add/<?= $product['id']?>" class="btn btn-success btn-sm">In den Warenkorb</a>
  </div>
</div>
