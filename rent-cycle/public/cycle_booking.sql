-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2025 at 01:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cycle_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', '2025-09-07 05:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cycles`
--

CREATE TABLE `cycles` (
  `id` int(11) NOT NULL,
  `cycle_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `available_stock` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cycles`
--

INSERT INTO `cycles` (`id`, `cycle_name`, `description`, `price`, `available_stock`, `created_at`, `supplier_id`, `qty`, `image`) VALUES
(1, 'firefox', 'hello', 12000.00, 5, '2025-09-07 06:13:06', 4, 0, NULL),
(2, 'firefox', 'with good gear box', 18000.00, 5, '2025-09-07 07:34:39', 2, 0, NULL),
(3, 'firefox', 'with good gear box', 18000.00, 5, '2025-09-07 07:38:50', 2, 0, NULL),
(4, 'Being human', 'BHAIJAAN COMPANY', 10000.00, 2, '2025-09-07 09:53:26', 5, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','cancelled') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_date`, `total_amount`, `status`) VALUES
(1, 4, '2025-09-07 07:26:51', 12000.00, 'confirmed'),
(2, 4, '2025-09-07 07:26:53', 12000.00, 'confirmed'),
(3, 4, '2025-09-07 07:26:54', 12000.00, 'confirmed'),
(4, 4, '2025-09-07 07:26:54', 12000.00, 'confirmed'),
(5, 4, '2025-09-07 07:30:04', 12000.00, 'confirmed'),
(6, 4, '2025-09-07 07:32:41', 12000.00, 'confirmed'),
(7, 4, '2025-09-07 07:33:29', 12000.00, 'confirmed'),
(8, 4, '2025-09-07 07:33:45', 12000.00, 'confirmed'),
(9, 4, '2025-09-07 07:33:52', 12000.00, 'confirmed'),
(10, 5, '2025-09-07 10:19:55', 18000.00, 'confirmed'),
(11, 5, '2025-09-07 10:21:24', 10000.00, 'confirmed'),
(12, 5, '2025-09-07 10:22:15', 10000.00, 'confirmed'),
(13, 5, '2025-09-07 10:23:37', 10000.00, 'confirmed'),
(14, 5, '2025-09-07 10:23:55', 18000.00, 'confirmed'),
(15, 5, '2025-09-07 10:24:03', 10000.00, 'confirmed'),
(16, 5, '2025-09-07 10:24:17', 10000.00, 'confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `cycle_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `cycle_id`, `quantity`, `price`, `qty`) VALUES
(1, 5, 1, 0, 12000.00, 1),
(2, 6, 1, 0, 12000.00, 1),
(3, 7, 1, 0, 12000.00, 1),
(4, 8, 1, 0, 12000.00, 1),
(5, 9, 1, 0, 12000.00, 1),
(6, 10, 2, 0, 18000.00, 1),
(7, 11, 4, 0, 10000.00, 1),
(8, 12, 4, 0, 10000.00, 1),
(9, 13, 4, 0, 10000.00, 1),
(10, 14, 3, 0, 18000.00, 1),
(11, 15, 4, 0, 10000.00, 1),
(12, 16, 4, 0, 10000.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `company` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `password`, `company`, `created_at`) VALUES
(1, 'Test Supplier', 'supplier@cycle.com', '$2y$10$abcdefghijklmnopqrstuvABCDEfghijklmnopqrstuv12', 'Cycle World', '2025-09-07 05:47:06'),
(2, 'sufyan', 'sufyan123@gmai.com', '$2y$10$0gwTj9NCZQAa3BK.HV7xue8ozWZBt4nFgkOlFtq9I6RpGsIQ3POfG', 'firefox', '2025-09-07 05:49:41'),
(4, 'sufyann', 'sufyan1234@gmai.com', '$2y$10$jlhD3T2.xoyVapMlgOmO7OutSGOn4bCIcEOOv0Wc4Gvr6B3FqxK5C', 'firefox', '2025-09-07 05:53:33'),
(5, 'sufyan', 'sufyan.tai1328@gmail.com', '$2y$10$rjoVOrumeuUlYCfBFJ1hRe8hWSBZydXuWNvwXxhSw0tRxiT9cFTHm', 'being human', '2025-09-07 09:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin','supplier') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ph_num` varchar(10) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `ph_num`, `address`, `registration_date`) VALUES
(1, 'Super Admin', 'admin@cycle.com', '$2y$10$abcdefghijklmnopqrstuvABCDEfghijklmnopqrstuv12', 'admin', '2025-09-07 05:42:40', NULL, NULL, NULL),
(2, 'sufyan', 'sufyan123@gmai.com', '$2y$10$8QaRfmVNbGG5qPnDibQg.ef/rrLy21dz2V.x8MA6RbVL0GDqWfIB2', 'user', '2025-09-07 06:54:45', NULL, NULL, NULL),
(4, 'suffu', 'taisufyan0@gmail.com', '$2y$10$ndOM81QnOp0cWQHbqyoiwuozWYpv2dxs35Z0AIW5Qpk2KiTArLzVK', 'user', '2025-09-07 07:21:05', NULL, NULL, NULL),
(5, 'khalid', 'doctorkhalid33@gmail.com', '$2y$10$fVOjMYoXQNpDnkUf5CnlpOKoioiLekGB1bMOcG96CvlidDlHOWuBK', 'user', '2025-09-07 09:51:54', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `cycles`
--
ALTER TABLE `cycles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `cycle_id` (`cycle_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cycles`
--
ALTER TABLE `cycles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cycles`
--
ALTER TABLE `cycles`
  ADD CONSTRAINT `cycles_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`cycle_id`) REFERENCES `cycles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
