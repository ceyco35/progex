<?php
function addProductToCart(int $userId, int $productId)
{
  $sql = "INSERT INTO cart SET amount=1,
  user_id = :userId,product_id = :productId
  ON DUPLICATE KEY UPDATE amount= amount+1";
  $statement = getDB()->prepare($sql);
  $statement->execute([
    ':userId'=> $userId,
    ':productId'=> $productId
  ]);
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
  $sql="SELECT product_id,titel,describtion,price
  FROM cart
  JOIN products ON(cart.product_id = products.id)
  WHERE user_id = ".$userId;
  $results = getDB()->query($sql);
  if($results === false)
  {
    return [];
  }
  $found = [];
  while($row = $results->fetch())
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
  WHERE user_id = ".$userId;
  $results = getDB()->query($sql);
  if($results === false)
  {
    return 0;
  }
  return (double)$results->fetchColumn();
}
function moveCartProductsToAnotherUser(int $sourceUserId, int $targetUserId):int
{
  $sql ="UPDATE cart SET user_id =:targetUserId WHERE user_id =:sourceUserId";
  $statement =getDB()->prepare($sql);
  if(false === $statement)
  {
    return 0;
  }
  return $statement->execute(
    [':targetUserId'=>$targetUserId,
     ':sourceUserId'=>$sourceUserId
  ]);
}
