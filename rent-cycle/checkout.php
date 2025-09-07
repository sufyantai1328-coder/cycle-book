<?php
require 'db.php';
session_start();

// Redirect if not logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Get cart from session
$cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : [];
if (!$cart) {
    header("Location: index.php");
    exit;
}

// Fetch selected cycles
$ids = implode(',', array_map('intval', array_keys($cart)));
$sql = "SELECT * FROM cycles WHERE id IN ($ids)";
$res = $conn->query($sql);

$total = 0;
$items = [];

while ($row = $res->fetch_assoc()) {
    $qty = $cart[$row['id']];
    $sub = $qty * $row['price'];
    $items[] = [
        'id'    => $row['id'],
        'qty'   => $qty,
        'price' => $row['price']
    ];
    $total += $sub;
}

// Insert order (using total_amount column)
$stmt = $conn->prepare("INSERT INTO orders (user_id, total_amount, status) VALUES (?,?,?)");
$status = 'confirmed';
$stmt->bind_param('ids', $user_id, $total, $status);
$stmt->execute();
$order_id = $stmt->insert_id;
$stmt->close();

// Insert order items
$itstmt = $conn->prepare("INSERT INTO order_items (order_id, cycle_id, qty, price) VALUES (?,?,?,?)");
foreach ($items as $it) {
    $itstmt->bind_param('iiid', $order_id, $it['id'], $it['qty'], $it['price']);
    $itstmt->execute();

    // Reduce stock
    $conn->query("UPDATE cycles SET qty = qty - " . intval($it['qty']) . " WHERE id = " . intval($it['id']) . " AND qty >= " . intval($it['qty']));

}
$itstmt->close();

// Clear cart
unset($_SESSION['cart']);

require 'header.php';
?>
<div class="card">
  <h2>✅ Thank you! Your booking is confirmed.</h2>
  <p><strong>Order ID:</strong> <?php echo intval($order_id); ?></p>
  <p><strong>Total Amount:</strong> ₹<?php echo number_format($total, 2); ?></p>
  <p>Status: <?php echo ucfirst($status); ?></p>
  <p><a href="index_3.php" class="btn">Continue Browsing</a></p>
</div>
<?php require 'footer.php'; ?>
