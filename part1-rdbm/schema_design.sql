create database bitsom;
CREATE TABLE customers(
 customer_id VARCHAR(10) PRIMARY KEY,
 customer_name VARCHAR(100) NOT NULL,
 customer_email VARCHAR(100),
 customer_city VARCHAR(50)
);
CREATE TABLE products(
 product_id VARCHAR(10) PRIMARY KEY,
 product_name VARCHAR(100),
 category VARCHAR(50),
 unit_price DECIMAL(10,2)
);
CREATE TABLE sales_reps(
 sales_rep_id VARCHAR(10) PRIMARY KEY,
 sales_rep_name VARCHAR(100),
 sales_rep_email VARCHAR(100),
 office_address VARCHAR(200)
);
CREATE TABLE orders(
 order_id VARCHAR(10) PRIMARY KEY,
 order_date DATE,
 customer_id VARCHAR(10),
 sales_rep_id VARCHAR(10),
 FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
 FOREIGN KEY(sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);
CREATE TABLE order_items(
 order_id VARCHAR(10),
 product_id VARCHAR(10),
 quantity INT,
 PRIMARY KEY(order_id, product_id),
 FOREIGN KEY(order_id) REFERENCES orders(order_id),
 FOREIGN KEY(product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
('C001','Rohan Mehta','rohan@gmail.com','Mumbai'),
('C002','Priya Sharma','priya@gmail.com','Delhi'),
('C003','Amit Verma','amit@gmail.com','Bangalore'),
('C004','Sneha Iyer','sneha@gmail.com','Chennai'),
('C005','Vikram Singh','vikram@gmail.com','Mumbai'),
('C006','Neha Gupta','neha@gmail.com','Delhi'),
('C007','Arjun Nair','arjun@gmail.com','Bangalore'),
('C008','Kavya Rao','kavya@gmail.com','Hyderabad');

INSERT INTO products VALUES
('P001','Laptop','Electronics',55000),
('P002','Mouse','Electronics',800),
('P003','Desk Chair','Furniture',8500),
('P004','Notebook','Stationery',120),
('P005','Headphones','Electronics',3200),
('P006','Standing Desk','Furniture',22000),
('P007','Pen Set','Stationery',250),
('P008','Webcam','Electronics',2100);

INSERT INTO sales_reps VALUES
('SR01','Deepak Joshi','deepak@corp.com','Mumbai HQ, Nariman Point'),
('SR02','Anita Desai','anita@corp.com','Delhi Office, Connaught Place'),
('SR03','Ravi Kumar','ravi@corp.com','South Zone, MG Road, Bangalore');

INSERT INTO orders VALUES
('ORD1027','2024-01-10','C002','SR02'),
('ORD1114','2024-01-12','C001','SR01'),
('ORD1153','2024-01-15','C006','SR01'),
('ORD1002','2024-01-18','C002','SR02'),
('ORD1118','2024-01-20','C006','SR02'),
('ORD1132','2024-01-22','C003','SR02'),
('ORD1037','2024-01-25','C002','SR03'),
('ORD1075','2024-01-27','C005','SR03');

INSERT INTO order_items VALUES
('ORD1027','P004',4),
('ORD1114','P007',2),
('ORD1153','P007',3),
('ORD1002','P005',1),
('ORD1118','P007',5),
('ORD1132','P007',5),
('ORD1037','P007',2),
('ORD1075','P003',3);
