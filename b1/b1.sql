-- 1. Tạo database
DROP DATABASE IF EXISTS ss5;
CREATE DATABASE ss5;
USE ss5;

-- 2. Tạo bảng customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20)
);

-- 3. Tạo bảng orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    total_amount DECIMAL(10,2),
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Thêm dữ liệu mẫu
INSERT INTO customers (name, phone) VALUES
('Nguyen Van A', '0901234567'),
('Tran Thi B', '0907654321'),
('Le Van C', '0912345678'),
('Pham Thi D', '0934567890');

INSERT INTO orders (customer_id, total_amount, order_date, status) VALUES
(1, 500000, '2025-08-01', 'Pending'),
(1, 300000, '2025-08-02', 'Shipped'),
(2, 450000, '2025-08-03', 'Delivered'),
(NULL, 200000, '2025-08-04', 'Pending'), -- đơn hàng không có khách hàng
(3, 800000, '2025-08-05', 'Shipped');

SELECT *
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id;

SELECT 
    customers.customer_id,
    customers.name,
    customers.phone,
    orders.order_id,
    orders.status
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;

SELECT 
    customers.customer_id,
    customers.name,
    orders.order_id,
    orders.total_amount,
    orders.order_date
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id;
