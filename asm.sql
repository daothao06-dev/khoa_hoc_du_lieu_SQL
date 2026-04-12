CREATE TABLE asm.product_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO asm.product_categories (category_name) VALUES 
('Thực phẩm khô'), ('Đồ uống'), ('Hóa mỹ phẩm'), ('Đồ gia dụng'), ('Thực phẩm tươi sống');


CREATE TABLE asm.suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_info TEXT
);


INSERT INTO asm.suppliers (supplier_name, contact_info) VALUES 
('Acecook Việt Nam', '0281234567'), ('Coca-Cola', '0287654321'), 
('Unilever', '0281112223'), ('Sunhouse', '0243334445'), ('Công ty Thực phẩm Hảo Hạng', '0249998887');


CREATE TABLE asm.promotions (
    promotion_id SERIAL PRIMARY KEY,
    promotion_name VARCHAR(255) NOT NULL,
    description TEXT,
    discount_percent DECIMAL(5,2) DEFAULT 0,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CHECK (end_date >= start_date)
);


INSERT INTO asm.promotions (promotion_name, description, discount_percent, start_date, end_date) VALUES 
('Sale Hè', 'Giảm giá tháng 6', 10, '2026-06-01', '2026-06-30'),
('Khai trương', 'Giảm giá mở cửa', 15, '2026-01-01', '2026-01-15'),
('Tri ân', 'Khách hàng thân thiết', 5, '2026-10-01', '2026-12-31');


CREATE TABLE asm.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(15,2) NOT NULL CHECK (price > 0),
    category_id INT NOT NULL REFERENCES asm.product_categories(category_id),
    supplier_id INT NOT NULL REFERENCES asm.suppliers(supplier_id)
);
INSERT INTO asm.products (product_name, price, category_id, supplier_id) VALUES
('Mì Hảo Hảo Tôm Chua Cay', 4500, 1, 1),
('Mì Omachi xốt bò hầm', 9000, 1, 1),
('Phở Đệ Nhất Acecook', 15000, 1, 1),
('Gạo ST25 túi 5kg', 195000, 1, 1),
('Dầu ăn Simply 1L', 52000, 1, 1),
('Nước mắm Nam Ngư 750ml', 45000, 1, 1),
('Coca Cola chai 1.5L', 20000, 2, 2),
('Pepsi lon 320ml', 10000, 2, 2),
('Nước cam ép Minute Maid', 15000, 2, 2),
('Sữa tươi Vinamilk 180ml', 8000, 2, 2),
('Bia Heineken lon 330ml', 20000, 2, 2),
('Nước suối Dasani 500ml', 5000, 2, 2),
('Dầu gội Clear 450ml', 155000, 3, 3),
('Sữa tắm Lifebuoy 800g', 165000, 3, 3),
('Bột giặt OMO Matic 3kg', 185000, 3, 3),
('Kem đánh răng P/S', 35000, 3, 3),
('Nước rửa bát Sunlight', 28000, 3, 3),
('Nước lau sàn Sunlight', 45000, 3, 3),
('Nồi cơm điện Sunhouse', 850000, 4, 4),
('Chảo chống dính Sunhouse', 120000, 4, 4),
('Ấm siêu tốc Sunhouse', 250000, 4, 4),
('Bộ lau nhà 360 độ', 320000, 4, 4),
('Quạt đứng Senko', 450000, 4, 4),
('Bếp từ đơn Sunhouse', 1200000, 4, 4),
('Thịt ba rọi CP 500g', 85000, 5, 5),
('Trứng gà ta vỉ 10 quả', 45000, 5, 5),
('Ức gà CP 500g', 65000, 5, 5),
('Cá hồi phi lê 200g', 155000, 5, 5),
('Sườn non heo 500g', 115000, 5, 5),
('Rau muống sạch gói 500g', 15000, 5, 5);


CREATE TABLE asm.employees (
    employee_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    position VARCHAR(100) NOT NULL,
    hire_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO asm.employees (full_name, position, hire_date) VALUES 
('Nguyễn An', 'Quản lý', '2025-01-01'), ('Trần Bình', 'Thu ngân', '2025-02-10'),
('Lê Chi', 'Thu ngân', '2025-03-05'), ('Phạm Đạt', 'Quản lý kho', '2025-01-15'),
('Hoàng Giang', 'Bảo vệ', '2025-05-20'), ('Vũ Hương', 'Bán hàng', '2025-06-01'),
('Đặng Khoa', 'Bán hàng', '2025-06-15'), ('Bùi Liên', 'Thu ngân', '2025-07-01'),
('Mai Nam', 'Kho', '2025-07-20'), ('Trịnh Oanh', 'Thu ngân', '2025-08-01');



CREATE TABLE asm.customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(255) UNIQUE,
    address TEXT
);


INSERT INTO asm.customers (full_name, phone, email, address) VALUES 
('Nguyễn Thị Mai', '0912345678', 'mainguyen@gmail.com', '123 Lê Lợi, Hà Nội'),
('Trần Văn Hùng', '0987654321', 'hungtran@gmail.com', '45 đường 3/2, TP.HCM'),
('Lê Thu Hà', '0901234455', 'hale@gmail.com', '78 Trần Phú, Đà Nẵng'),
('Phạm Minh Tuấn', '0933445566', 'tuanpham@gmail.com', '12 Quang Trung, Hải Phòng'),
('Hoàng Lan Anh', '0944556677', 'anhlan@gmail.com', '56 Nguyễn Huệ, Cần Thơ'),
('Đỗ Hữu Nghĩa', '0955667788', 'nghiado@gmail.com', '89 Hùng Vương, Huế'),
('Bùi Tuyết Nhung', '0966778899', 'nhungbui@gmail.com', '34 Lý Thái Tổ, Bắc Ninh'),
('Ngô Quốc Anh', '0977889900', 'anhngo@gmail.com', '21 Cách Mạng Tháng 8, Biên Hòa'),
('Lý Mỹ Linh', '0922334455', 'linhly@gmail.com', '67 Phan Đình Phùng, Vinh'),
('Trương Gia Bảo', '0911223344', 'baotruong@gmail.com', '90 Trần Hưng Đạo, Quy Nhơn'),
('Vũ Thùy Chi', '0988776655', 'chivu@gmail.com', '15 Lê Thánh Tông, Hạ Long'),
('Phan Thanh Hải', '0977665544', 'haiphan@gmail.com', '43 Nguyễn Trãi, Thanh Hóa'),
('Nguyễn Bảo Ngọc', '0966554433', 'ngocbao@gmail.com', '27 Đinh Tiên Hoàng, Thái Bình'),
('Trần Trung Kiên', '0955443322', 'kientran@gmail.com', '88 Lê Hồng Phong, Nam Định'),
('Lê Kim Liên', '0944332211', 'lienle@gmail.com', '19 Trần Quý Cáp, Nha Trang'),
('Đặng Văn Lâm', '0933221100', 'lamdang@gmail.com', '55 Phan Chu Trinh, Buôn Ma Thuột'),
('Bùi Phương Thảo', '0922110099', 'thaobui@gmail.com', '72 Nguyễn Văn Linh, Đà Nẵng'),
('Nguyễn Minh Triết', '0911009988', 'trietnguyen@gmail.com', '10 Kim Mã, Hà Nội'),
('Trần Thanh Sơn', '0900998877', 'sontran@gmail.com', '36 Phổ Quang, TP.HCM'),
('Phạm Ngọc Diệp', '0899887766', 'dieppham@gmail.com', '64 Hai Bà Trưng, Cần Thơ'),
('Lương Thế Vinh', '0888776655', 'vinhluong@gmail.com', '41 Nguyễn Du, Vinh'),
('Hồ Xuân Hương', '0877665544', 'huongho@gmail.com', '29 Bà Triệu, Hà Nội'),
('Cao Văn Thắng', '0866554433', 'thangcao@gmail.com', '18 Đồng Khởi, TP.HCM'),
('Đoàn Thị Điểm', '0855443322', 'diemdoan@gmail.com', '92 Trần Phú, Nha Trang'),
('Tô Hiến Thành', '0844332211', 'thanhto@gmail.com', '14 Nguyễn Chí Thanh, Đà Lạt'),
('Nguyễn Du', '0833221100', 'dunguyen@gmail.com', '77 Xuân Diệu, Quy Nhơn'),
('Chu Văn An', '0822110099', 'anchu@gmail.com', '33 Chu Văn An, Hà Nội'),
('Nguyễn Huệ', '0811009988', 'huenguyen@gmail.com', '102 Nguyễn Huệ, TP.HCM'),
('Trần Hưng Đạo', '0800998877', 'daotran@gmail.com', '22 Trần Hưng Đạo, Vũng Tàu'),
('Lê Lợi', '0799887766', 'loile@gmail.com', '50 Lê Lợi, Thanh Hóa'),
('Nguyễn Trãi', '0788776655', 'trainguyen@gmail.com', '31 Nguyễn Trãi, Hải Dương'),
('Ngô Quyền', '0777665544', 'quyenngo@gmail.com', '16 Ngô Quyền, Hải Phòng'),
('Đinh Bộ Lĩnh', '0766554433', 'linhdinh@gmail.com', '8 Ninh Bình, Ninh Bình'),
('Lý Thái Tổ', '0755443322', 'toly@gmail.com', '5 Lý Thái Tổ, Hà Nội'),
('Trần Nhân Tông', '0744332211', 'tongtran@gmail.com', '9 Yên Tử, Quảng Ninh'),
('Nguyễn Anh Tuấn', '0733221100', 'tuananh@gmail.com', '11 Thái Hà, Hà Nội'),
('Lê Minh Tâm', '0722110099', 'tamle@gmail.com', '24 Nguyễn Đình Chiểu, TP.HCM'),
('Phạm Hồng Thái', '0711009988', 'thaipham@gmail.com', '6 Lạch Tray, Hải Phòng'),
('Võ Văn Kiệt', '0700998877', 'kietvo@gmail.com', '100 Võ Văn Kiệt, TP.HCM'),
('Nguyễn Văn Linh', '0912121212', 'linhnguyen@gmail.com', '222 Nguyễn Văn Linh, Hưng Yên'),
('Trần Đại Quang', '0913131313', 'quangtran@gmail.com', '55 Kim Liên, Hà Nội'),
('Nguyễn Xuân Phúc', '0914141414', 'phucnguyen@gmail.com', '33 Cửa Đại, Hội An'),
('Phạm Minh Chính', '0915151515', 'chinhpham@gmail.com', '88 Sầm Sơn, Thanh Hóa'),
('Vương Đình Huệ', '0916161616', 'huevuong@gmail.com', '99 Diễn Châu, Nghệ An'),
('Trần Thanh Mẫn', '0917171717', 'mantran@gmail.com', '44 Ninh Kiều, Cần Thơ'),
('Lâm Thị Phương', '0918181818', 'phuonglam@gmail.com', '12 Sông Cầu, Phú Yên'),
('Đỗ Văn Chiến', '0919191919', 'chiendo@gmail.com', '77 Sơn La, Sơn La'),
('Nguyễn Văn Hòa', '0920202020', 'hoanguyen@gmail.com', '66 Tuy Hòa, Phú Yên'),
('Lê Thị Tuyết', '0921212121', 'tuyetle@gmail.com', '33 Móng Cái, Quảng Ninh'),
('Nguyễn Văn Hậu', '0922222222', 'haunguyen@gmail.com', '11 Tam Kỳ, Quảng Nam');

SELECT * FROM asm.customers;

CREATE TABLE asm.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES asm.customers(customer_id),
    employee_id INT NOT NULL REFERENCES asm.employees(employee_id),
    promotion_id INT REFERENCES asm.promotions(promotion_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO asm.orders (order_id, customer_id, employee_id, promotion_id, order_date) VALUES
(1, 10, 2, 1, '2025-10-01 08:30:00'), (2, 25, 3, NULL, '2025-10-01 09:45:00'),
(3, 5, 8, 1, '2025-10-02 10:20:00'), (4, 12, 6, NULL, '2025-10-02 11:15:00'),
(5, 40, 2, 2, '2025-10-03 14:00:00'), (6, 18, 9, NULL, '2025-10-03 15:30:00'),
(7, 33, 3, 1, '2025-10-04 09:00:00'), (8, 2, 7, NULL, '2025-10-04 10:10:00'),
(9, 45, 1, 2, '2025-10-05 16:45:00'), (10, 7, 2, NULL, '2025-10-05 17:20:00'),
(11, 21, 5, 1, '2025-10-06 08:00:00'), (12, 14, 10, NULL, '2025-10-06 13:00:00'),
(13, 39, 3, NULL, '2025-10-07 09:30:00'), (14, 28, 6, 2, '2025-10-07 10:45:00'),
(15, 4, 8, 1, '2025-10-08 14:20:00'), (16, 50, 2, NULL, '2025-10-08 15:50:00'),
(17, 11, 7, 1, '2025-10-09 11:10:00'), (18, 22, 1, NULL, '2025-10-09 16:30:00'),
(19, 35, 9, 2, '2025-10-10 10:00:00'), (20, 8, 3, NULL, '2025-10-10 12:15:00'),
(21, 1, 2, 1, '2025-10-11 08:30:00'), (22, 26, 6, NULL, '2025-10-11 09:45:00'),
(23, 13, 8, 1, '2025-10-12 10:20:00'), (24, 44, 2, NULL, '2025-10-12 11:15:00'),
(25, 30, 3, 2, '2025-10-13 14:00:00'), (26, 17, 7, NULL, '2025-10-13 15:30:00'),
(27, 49, 10, 1, '2025-10-14 09:00:00'), (28, 3, 2, NULL, '2025-10-14 10:10:00'),
(29, 37, 5, 2, '2025-10-15 16:45:00'), (30, 9, 9, NULL, '2025-10-15 17:20:00'),
(31, 23, 2, 1, '2025-10-16 08:00:00'), (32, 15, 3, NULL, '2025-10-16 13:00:00'),
(33, 41, 6, NULL, '2025-10-17 09:30:00'), (34, 27, 8, 2, '2025-10-17 10:45:00'),
(35, 6, 2, 1, '2025-10-18 14:20:00'), (36, 48, 7, NULL, '2025-10-18 15:50:00'),
(37, 19, 10, 1, '2025-10-19 11:10:00'), (38, 32, 3, NULL, '2025-10-19 16:30:00'),
(39, 46, 2, 2, '2025-10-20 10:00:00'), (40, 16, 9, NULL, '2025-10-20 12:15:00'),
(41, 20, 1, 1, '2025-10-21 08:30:00'), (42, 38, 3, NULL, '2025-10-21 09:45:00'),
(43, 2, 6, 1, '2025-10-22 10:20:00'), (44, 47, 8, NULL, '2025-10-22 11:15:00'),
(45, 31, 2, 2, '2025-10-23 14:00:00'), (46, 12, 10, NULL, '2025-10-23 15:30:00'),
(47, 43, 3, 1, '2025-10-24 09:00:00'), (48, 4, 7, NULL, '2025-10-24 10:10:00'),
(49, 36, 2, 2, '2025-10-25 16:45:00'), (50, 24, 1, NULL, '2025-10-25 17:20:00'),
(51, 1, 2, 1, '2025-10-26 08:30:00'), (52, 26, 3, NULL, '2025-10-26 09:45:00'),
(53, 13, 8, 1, '2025-10-27 10:20:00'), (54, 44, 6, NULL, '2025-10-27 11:15:00'),
(55, 30, 2, 2, '2025-10-28 14:00:00'), (56, 17, 9, NULL, '2025-10-28 15:30:00'),
(57, 49, 3, 1, '2025-10-29 09:00:00'), (58, 3, 7, NULL, '2025-10-29 10:10:00'),
(59, 37, 2, 2, '2025-10-30 16:45:00'), (60, 9, 10, NULL, '2025-10-30 17:20:00'),
(61, 5, 2, 1, '2025-11-01 08:00:00'), (62, 10, 3, NULL, '2025-11-01 09:00:00'),
(63, 15, 6, 2, '2025-11-02 10:00:00'), (64, 20, 8, NULL, '2025-11-02 11:00:00'),
(65, 25, 2, 1, '2025-11-03 14:00:00'), (66, 30, 9, NULL, '2025-11-03 15:00:00'),
(67, 35, 3, 2, '2025-11-04 09:00:00'), (68, 40, 7, NULL, '2025-11-04 10:00:00'),
(69, 45, 2, 1, '2025-11-05 16:00:00'), (70, 50, 1, NULL, '2025-11-05 17:00:00'),
(71, 2, 2, 1, '2025-11-06 08:00:00'), (72, 7, 3, NULL, '2025-11-06 09:00:00'),
(73, 12, 6, 2, '2025-11-07 10:00:00'), (74, 17, 8, NULL, '2025-11-07 11:00:00'),
(75, 22, 2, 1, '2025-11-08 14:00:00'), (76, 27, 9, NULL, '2025-11-08 15:00:00'),
(77, 32, 3, 2, '2025-11-09 09:00:00'), (78, 37, 7, NULL, '2025-11-09 10:00:00'),
(79, 42, 2, 1, '2025-11-10 16:00:00'), (80, 47, 1, NULL, '2025-11-10 17:00:00'),
(81, 1, 10, 1, '2025-11-11 08:30:00'), (82, 6, 2, NULL, '2025-11-11 09:45:00'),
(83, 11, 3, 1, '2025-11-12 10:20:00'), (84, 16, 6, NULL, '2025-11-12 11:15:00'),
(85, 21, 8, 2, '2025-11-13 14:00:00'), (86, 26, 2, NULL, '2025-11-13 15:30:00'),
(87, 31, 9, 1, '2025-11-14 09:00:00'), (88, 36, 3, NULL, '2025-11-14 10:10:00'),
(89, 41, 7, 2, '2025-11-15 16:45:00'), (90, 46, 2, NULL, '2025-11-15 17:20:00'),
(91, 50, 1, 1, '2025-11-16 08:30:00'), (92, 45, 10, NULL, '2025-11-16 09:45:00'),
(93, 40, 2, 1, '2025-11-17 10:20:00'), (94, 35, 3, NULL, '2025-11-17 11:15:00'),
(95, 30, 6, 2, '2025-11-18 14:00:00'), (96, 25, 8, NULL, '2025-11-18 15:30:00'),
(97, 20, 2, 1, '2025-11-19 09:00:00'), (98, 15, 9, NULL, '2025-11-19 10:10:00'),
(99, 10, 3, 2, '2025-11-20 16:45:00'), (100, 5, 7, NULL, '2025-11-20 17:20:00');

SELECT * FROM asm.order_items;

CREATE TABLE asm.order_items (
    order_id INT REFERENCES asm.orders(order_id),
    product_id INT REFERENCES asm.products(product_id),
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(15,2) NOT NULL,
    PRIMARY KEY (order_id, product_id)
);

INSERT INTO asm.order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 5, 4500), (1, 7, 2, 20000), (2, 25, 1, 85000), (2, 26, 2, 45000),
(3, 19, 2, 850000), (4, 13, 1, 155000), (5, 4, 1, 195000), (5, 10, 2, 8000),
(6, 28, 1, 155000), (7, 24, 1, 1200000), (8, 2, 10, 9000), (9, 21, 1, 250000),
(10, 29, 2, 115000), (11, 1, 3, 4500), (12, 15, 1, 185000), (13, 19, 1, 850000),
(14, 25, 1, 85000), (15, 30, 5, 15000), (16, 7, 2, 20000), (17, 19, 2, 850000),
(18, 13, 1, 155000), (19, 24, 1, 1200000), (20, 4, 1, 195000);

-- y4
SELECT 
    o.order_id, 
    c.full_name AS customer_name, 
    e.full_name AS employee_name, 
    o.order_date, 
    SUM(oi.quantity * oi.unit_price) AS total_amount
FROM asm.orders o
JOIN asm.customers c ON o.customer_id = c.customer_id
JOIN asm.employees e ON o.employee_id = e.employee_id
JOIN asm.order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, c.full_name, e.full_name
ORDER BY o.order_date DESC
LIMIT 10;

-- y5

SELECT 
    pc.category_name AS "Danh mục sản phẩm", 
    SUM(oi.quantity * oi.unit_price) AS "Tổng doanh thu"
FROM asm.product_categories pc
JOIN asm.products p ON pc.category_id = p.category_id
JOIN asm.order_items oi ON p.product_id = oi.product_id
GROUP BY pc.category_name
HAVING SUM(oi.quantity * oi.unit_price) > 1000000
ORDER BY "Tổng doanh thu" DESC;

-- y6

SELECT 
    product_name AS "Tên sản phẩm", 
    price AS "Giá bán"
FROM asm.products
WHERE supplier_id = (
    SELECT supplier_id 
    FROM asm.suppliers 
    WHERE supplier_name = 'Công ty Thực phẩm Hảo Hạng'
);

-- y7
SELECT 
    e.full_name AS "Tên nhân viên", 
    SUM(oi.quantity * oi.unit_price) AS "Tổng doanh thu",
    DENSE_RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS "Thứ hạng"
FROM asm.employees e
JOIN asm.orders o ON e.employee_id = o.employee_id
JOIN asm.order_items oi ON o.order_id = oi.order_id
WHERE o.order_date BETWEEN '2025-10-01' AND '2025-10-31'
GROUP BY e.employee_id, e.full_name;


--Y8.1

INSERT INTO asm.customers (full_name, phone, email, address)
SELECT 
    'Khách hàng thứ ' || i,                 -- Tên: Khách hàng thứ 1, 2, 3...
    '09' || LPAD(i::text, 8, '0'),         -- Số điện thoại: 0900000001...
    'user' || i || '@gmail.com',           -- Email: user1@gmail.com...
    'Địa chỉ số ' || i || ' Hà Tĩnh'       -- Địa chỉ: Số 1 Hà Tĩnh...
FROM generate_series(1, 50000) AS i;

select * from asm.customers

EXPLAIN ANALYZE 
SELECT * FROM asm.customers 
WHERE email = 'user45000@gmail.com';

--kế hoạch thực thi là: Index Scan using customers_email_key on customers
--thời gian thực thi: Execution Time 3.
 
-- Y9
CREATE INDEX idx_customers_email ON asm.customers(email);
-- y10
--Sự khác biệt trong Query Plan: Trước khi tạo index, hệ thống phải sử dụng Seq Scan (quét toàn bộ bảng), nhưng sau khi có index, máy đã chuyển sang Index Scan để truy cập trực tiếp vào dữ liệu cần tìm.

--Cải thiện thời gian thực thi: Thời gian thực thi đã được cải thiện rõ rệt, giảm từ 3.633 ms xuống chỉ còn 1.384 ms (nhanh hơn gấp gần 3 lần dựa trên kết quả thực tế).

--Ảnh hưởng tiêu cực: Việc thêm index có thể làm chậm tốc độ của các lệnh ghi dữ liệu (INSERT, UPDATE, DELETE) vì hệ thống phải mất thêm thời gian để cập nhật lại bảng chỉ mục (index).

--Giải thích ngắn gọn: Index giống như mục lục của cuốn sách; nó giúp việc tìm kiếm (đọc) cực nhanh nhưng sẽ làm tăng dung lượng lưu trữ của cơ sở dữ liệu và tốn công sức cập nhật hơn khi nội dung thay đổi.
