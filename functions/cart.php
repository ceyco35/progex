<?php
function addProductToCart(int $userId, int $productId, int $amount =1)
{
  $sql = "INSERT INTO cart SET amount=:amount,
  user_id = :userId,product_id = :productId
  ON DUPLICATE KEY UPDATE amount= amount+1";
  $statement = getDB()->prepare($sql);
  $data =[
    ':userId'=>$userId,
    ':productId'=>$productId,
    ':amount'=>$amount
  ];
  return $statement->execute($data);
  $statement->execute($data);
}
function countProductsInCart(int $userId)
{
  $sql="SELECT COUNT(id) FROM cart WHERE user_id =".$userId;
  $cartResults = getDB()->query($sql);
  if($cartResults === false)
  {
    return 0;
  }
  $cartItems = $cartResults->fetchColumn();
  return $cartItems;
}
function getCarItemsForUserId(int $userId):array
{
  $sql="SELECT product_id,titel,describtion,price,amount,image
  FROM cart
  JOIN products ON(cart.product_id = products.id)
  WHERE user_id = :userId";
   $statement = getDb()->prepare($sql);
  if($statement === false)
  {
    return [];
  }
  $data = [
       ':userId' => $userId
   ];
  $statement->execute($data);
  $found = [];
  while($row = $statement->fetch())
  {
    $found[]=$row;
  }
  return $found;
}
function getCartSumForUserId(int $userId):float
{
  $sql="SELECT SUM(price * amount)
  FROM cart
  JOIN products ON(cart.product_id = products.id)
  WHERE user_id = ". $userId;
  $results = getDB()->query($sql);
  if($results === false)
  {
    return 0;
  }
  return (double)$results->fetchColumn();
}
function deleteProductInCartForUserId(int $userId,int $productId):int
{
  $sql ="DELETE FROM cart WHERE user_id = :userId AND product_id = :productId";
  $statement = getDB()->prepare ($sql);
  if(false === $statement)
  {
    return 0;
  }
  $data =[
    ':userId'=>$userId,
    ':productId'=>$productId
  ];
  return $statement->execute($data);
}
function moveCartProductsToAnotherUser(int $sourceUserId, int $targetUserId):int
{
  if($sourceUserId == $targetUserId)
  {
    return 0;
  }
  $oldCartItems = getCarItemsForUserId($sourceUserId);
  if(count($oldCartItems) > 0)
  {
  return 0;
  }
  $movedProducts=0;
  foreach($oldCartItems as $oldCartItems)
  {
    addProductToCart($targetUserId,(int)$oldCartItems['product_id'],(int)$oldCartItems['amount']);
    $movedProducts+= deleteProductInCartForUserId($sourceUserId,(int)$oldCartItems['product_id']);
  }
  return $movedProducts;
}
