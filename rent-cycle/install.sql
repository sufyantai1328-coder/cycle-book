CREATE DATABASE IF NOT EXISTS cycle_booking;
USE cycle_booking;

CREATE TABLE IF NOT EXISTS suppliers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS admins (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS cycles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  supplier_id INT DEFAULT NULL,
  name VARCHAR(150) NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  qty INT DEFAULT 1,
  image VARCHAR(255) DEFAULT 'images/default.png',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  total DECIMAL(10,2),
  status VARCHAR(50) DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  cycle_id INT,
  qty INT,
  price DECIMAL(10,2)
);

-- sample admin (register through admin panel recommended)
-- sample supplier (register through supplier panel recommended)
-- sample user (register through site)
-- sample cycles (supplier_id left NULL or set later)
INSERT INTO cycles (name, description, price, qty, image) VALUES
('City Cruiser', 'Comfortable city bicycle, good for daily rides.', 12.00, 5, 'images/city_cruiser.jpg'),
('Mountain Explorer', 'Sturdy mountain bike for off-road trails.', 18.50, 3, 'images/mountain_explorer.jpg'),
('Road Racer', 'Lightweight road bike for speed and distance.', 20.00, 2, 'images/road_racer.jpg');
