<?php
require 'db.php';
session_start();
$cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : [];
$items = [];
$total = 0.0;

if ($cart) {
    $ids = implode(',', array_map('intval', array_keys($cart)));
    $sql = "SELECT * FROM cycles WHERE id IN ($ids)";
    $res = $conn->query($sql);
    while($row = $res->fetch_assoc()){
        $row['order_qty'] = $cart[$row['id']];
        $row['sub'] = $row['order_qty'] * $row['price'];
        $total += $row['sub'];
        $items[] = $row;
    }
}
require 'header.php';
?>
<div class="card">
  <h2>Your Cart</h2>
  <?php if (empty($items)): ?>
    <p>Your cart is empty. <a href="index_3.php">Browse cycles</a></p>
  <?php else: ?>
    <table class="table">
      <tr><th>Cycle</th><th>Price</th><th>Qty</th><th>Sub</th></tr>
      <?php foreach($items as $it): ?>
        <tr>
          <td><?php echo htmlspecialchars($it['cycle_name']); ?></td>
          <td>₹<?php echo number_format($it['price'],2); ?></td>
          <td><?php echo intval($it['order_qty']); ?></td>
          <td>₹<?php echo number_format($it['sub'],2); ?></td>
        </tr>
      <?php endforeach; ?>
      <tr><td colspan="3" align="right"><strong>Total:</strong></td><td>₹<?php echo number_format($total,2); ?></td></tr>
    </table>
    <p><a class="btn" href="checkout.php">Proceed to Checkout</a></p>
  <?php endif; ?>
</div>
<?php require 'footer.php'; ?>