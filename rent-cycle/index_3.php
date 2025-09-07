<?php
require 'db.php';
require 'header.php';

$sql = "SELECT c.*, s.name as supplier_name FROM cycles c LEFT JOIN suppliers s ON s.id = c.supplier_id ORDER BY created_at DESC";
$res = $conn->query($sql);
?>
<div class="card">
  <h2>Available Cycles</h2>
  <div class="products">
    <?php while($row = $res->fetch_assoc()): ?>
      <div class="product card">
        <img src="<? php echo htmlspecialchars($row['image']); ?>" alt="images/BB-EC-3.jpg">
        <img src="images/BB-EC-3.jpg" alt="Cycle Image" style="width: 300px;">
        <img src="images/P800-8-feature-f4.jpg" alt="Cycle Image" style="width: 300px;">
        <h3><?php echo htmlspecialchars($row['cycle_name']); ?></h3>
        <p><?php echo htmlspecialchars($row['description']); ?></p>
        <p><strong>₹<?php echo number_format($row['price'],2); ?></strong></p>
        <?php if (!empty($row['supplier_name'])): ?><p>Supplier: <?php echo htmlspecialchars($row['supplier_name']); ?></p><?php endif; ?>
        <a class="btn" href="product.php?id=<?php echo $row['id']; ?>">Details</a>
        <a class="btn secondary" href="add_to_cart.php?id=<?php echo $row['id']; ?>&qty=1">Add to Cart</a>
      </div>
    <?php endwhile; ?>
  </div>
</div>
<?php require 'footer.php'; ?>