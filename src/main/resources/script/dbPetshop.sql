--CREAR BASE DE DATOS
CREATE DATABASE IF NOT EXISTS petshop;
-- show warnings;
-- show databases;
--DROP TABLE (nombre)
--DESCRIBE  (nombre)
--DESC  (nombre)
--SHOW FULL COLUMNS FROM  (nombre)
USE petshop;

--CREAR TABLAS

CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    user_type ENUM('ADMIN', 'CUSTOMER') NOT NULL,
	created_user VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS pets (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type ENUM('DOG', 'CAT') NOT NULL,
    breed VARCHAR(50),
    age INT,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    category ENUM('DRY_FOOD', 'WET_FOOD', 'SNACKS', 'SUPPLEMENTS') NOT NULL,
    brand VARCHAR(50),
	created_user VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('PENDING', 'COMPLETED', 'CANCELED') NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE IF NOT EXISTS suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    available_quantity INT NOT NULL,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

/*
-- Insert users
INSERT INTO Users (name, email, password, phone, address, user_type) VALUES
('John Doe', 'john.doe@example.com', 'password123', '123456789', 'Miraflores, Lima, Peru', 'CUSTOMER'),
('Jane Smith', 'jane.smith@example.com', 'securepass', '987654321', 'San Isidro, Lima, Peru', 'CUSTOMER'),
('Admin User', 'admin@example.com', 'adminpass', NULL, NULL, 'ADMIN');

-- Insert pets
INSERT INTO Pets (name, type, breed, age, user_id) VALUES
('Buddy', 'DOG', 'Golden Retriever', 3, 1),
('Whiskers', 'CAT', 'Persian', 2, 2);

-- Insert products
INSERT INTO Products (name, description, price, stock, category, brand) VALUES
('Royal Canin Maxi Adult', 'Dry food for adult large dogs', 150.00, 50, 'DRY_FOOD', 'Royal Canin'),
('Pedigree Wet Food Chicken', 'Wet food for dogs with chicken flavor', 10.50, 100, 'WET_FOOD', 'Pedigree'),
('Whiskas Cat Treats', 'Snacks for cats, tuna flavor', 20.00, 200, 'SNACKS', 'Whiskas'),
('Hill\'s Science Diet Puppy', 'Nutritional dry food for puppies', 120.00, 30, 'DRY_FOOD', 'Hill\'s'),
('Nutri-Vet Cat Chews', 'Supplements for healthy cat joints', 50.00, 20, 'SUPPLEMENTS', 'Nutri-Vet');

-- Insert orders
INSERT INTO Orders (user_id, order_date, status, total) VALUES
(1, '2024-12-01 10:00:00', 'COMPLETED', 160.50),
(2, '2024-12-01 15:30:00', 'PENDING', 70.00);

-- Insert order details
INSERT INTO Order_Details (order_id, product_id, quantity, subtotal) VALUES
(1, 1, 1, 150.00),
(1, 3, 1, 10.50),
(2, 4, 1, 120.00),
(2, 5, 1, 50.00);

-- Insert suppliers
INSERT INTO Suppliers (name, phone, address, email) VALUES
('Distribuidora Canina', '555123456', 'Av. Larco, Miraflores, Lima, Peru', 'contacto@canina.com'),
('Proveedor Felino', '555987654', 'Jr. Las Flores, San Isidro, Lima, Peru', 'ventas@felino.com');

-- Insert inventory
INSERT INTO Inventory (product_id, available_quantity) VALUES
(1, 50),
(2, 100),
(3, 200),
(4, 30),
(5, 20);

*/