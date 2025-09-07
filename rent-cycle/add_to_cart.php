<?php
require 'db.php';
session_start();
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$qty = isset($_GET['qty']) ? intval($_GET['qty']) : 1;
if ($id <= 0) header('Location: index.php');

if (!isset($_SESSION['cart'])) $_SESSION['cart'] = [];
if (isset($_SESSION['cart'][$id])) $_SESSION['cart'][$id] += $qty;
else $_SESSION['cart'][$id] = $qty;

header('Location: cart.php');
exit;
?>