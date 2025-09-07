<?php
session_start();
session_destroy();
header('Location: index_3.php');
exit;
?>