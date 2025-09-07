<?php
if (session_status() == PHP_SESSION_NONE) session_start();
$cart_count = 0;
if (isset($_SESSION['cart'])) {
    foreach ($_SESSION['cart'] as $qty) $cart_count += $qty;
}
?>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Cycle Booking</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header class="header">
  <div class="container">
    <span class="brand">Cycle Booking</span>
    <span class="cart-info">
      <?php if (isset($_SESSION['user_id'])): ?>
        Welcome, <?php echo htmlspecialchars($_SESSION['user_name']); ?> |
        <a href="logout.php">Logout</a> |
      <?php else: ?>
        <a href="login.php">Login</a> |
        <a href="register.php">Register</a> |
      <?php endif; ?>
      Cart: <?php echo $cart_count; ?> items |
      <a href="cart.php" class="btn">View Cart</a>
      <!-- links to admin & supplier panels -->
      | <a href="admin/admin_login.php" style="color:#fff">Admin</a>
      | <a href="supplier/supplier_login.php" style="color:#fff">Supplier</a>
    </span>
  </div>
</header>
<div class="container">