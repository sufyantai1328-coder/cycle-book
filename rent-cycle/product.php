<?php
require 'db.php';
require 'header.php';
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$stmt = $conn->prepare("SELECT c.*, s.name as supplier_name FROM cycles c LEFT JOIN suppliers s ON s.id = c.supplier_id WHERE c.id = ?");
$stmt->bind_param('i',$id);
$stmt->execute();
$res = $stmt->get_result();
$cycle = $res->fetch_assoc();
if (!$cycle) {
  echo '<p>Product not found.</p>';
  require "footer.php";
  exit;
}
?>
<div class="card">
  <h2><?php echo htmlspecialchars($cycle['cycle_name']); ?></h2>

  <img src="<?php echo htmlspecialchars($cycle['image']); ?>" style="max-width:300px">
  <?php if (!empty($cycle['supplier_name'])): ?><p>Supplier: <?php echo htmlspecialchars($cycle['supplier_name']); ?></p><?php endif; ?>
  <p><?php echo htmlspecialchars($cycle['description']); ?></p>
  <p><strong>₹<?php echo number_format($cycle['price'],2); ?></strong></p>
  <p>Available: <?php echo intval($cycle['qty']); ?></p>
  <a class="btn" href="add_to_cart.php?id=<?php echo $cycle['id']; ?>&qty=1">Add to Cart</a>
</div>
<?php require 'footer.php'; ?>