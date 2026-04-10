--------lab5--------
select * from sinhvien.bangsanpham
select * from sinhvien.suppliers
----bài 1----
ALTER TABLE sinhvien.bangsanpham
ADD quantity VARCHAR(15)
-- #update thêm cột quantity
UPDATE sinhvien.bangsanpham 
SET quantity = '1' 
WHERE masp IN (6,10);
--- tạo hóa đơn tổng trước vì đây là bảng cha-----
INSERT INTO sinhvien.banghoadon (mahd, makh, tongtien)
VALUES 
(1, 1, 80000), 
(2, 1, 15000), 
(4, 1, 17000);
--sau đó mới thêm thông tin vào bảng con  ---------
INSERT INTO sinhvien.bangchitiethoadon (mahd, masp, soluong, dongiaban)
VALUES 
(1, 8, 2, 30000),  
(1, 10, 1, 50000), 
(2, 6, 5, 15000);

SELECT 
ct.mahd,
sp.product_name,
ct.soluong,
sp.price
FROM sinhvien.bangchitiethoadon ct
INNER JOIN sinhvien.bangsanpham sp ON ct.masp = sp.masp; 
----------
SELECT 
    kh.tenkh,     
    hd.mahd            
FROM sinhvien.bangkhachhang kh
LEFT JOIN sinhvien.banghoadon hd ON kh.makh = hd.makh; 

-- bài2---

SELECT 
    sp.product_name, 
    ct.mahd
FROM sinhvien.bangchitiethoadon ct
RIGHT JOIN sinhvien.bangsanpham sp ON sp.masp = ct.masp;
--thêm dữ liệu vào bảng customers
INSERT INTO sinhvien.customers (customerid, firstname, lastname, email, phone, 
    address, joinedat, createdat, updatedat, "ngayGiaNhap")
VALUES
(1, 'Thao', 'Nguyen', 'thao.nguyen@gmail.com', '0912345678', 'Ha Tinh', '2026-01-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '2026-01-01'),
(2, 'An', 'Tran', 'an.tran@yahoo.com', '0988776655', 'Ha Noi', '2026-02-15', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '2026-02-15'),
(3, 'Binh', 'Le', 'binh.le@outlook.com', '0905112233', 'Da Nang', '2026-03-10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '2026-03-10'),
(4, 'Chi', 'Pham', 'chi.pham@gmail.com', '0944009988', 'TP HCM', '2026-04-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '2026-04-01'),
(5, 'Dung', 'Hoang', 'dung.hoang@fpt.edu.vn', '0977123123', 'Can Tho', '2026-04-05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '2026-04-05');

select * from sinhvien.customers
select * from sinhvien.suppliers


SELECT 
    firstname || ' ' || lastname AS ContactName, 
    phone AS PhoneNumber
FROM sinhvien.customers

UNION

SELECT 
    supplier_name AS ContactName, 
    contact_phone AS PhoneNumber
FROM sinhvien.suppliers;

----bài 3----
   
UPDATE sinhvien.bangsanpham 
SET supplier_id = 1  
WHERE product_name = 'suaconbo';

select * from sinhvien.bangsanpham

SELECT 
product_name,
price
FROM sinhvien.bangsanpham
WHERE supplier_id IN (
	SELECT supplier_id
	FROM sinhvien.suppliers
	WHERE supplier_name = 'Công ty Sữa Việt Nam'
);


SELECT 
    product_name, 
    price, 
    (SELECT AVG(price) FROM sinhvien.bangsanpham) AS average_price
FROM sinhvien.bangsanpham;


---bài 4---
SELECT 
    order_totals.mahd AS order_id, 
    order_totals.tong_tien
FROM (
    SELECT 
        mahd, 
        SUM(soluong * dongiaban) AS tong_tien
    FROM sinhvien.bangchitiethoadon
    GROUP BY mahd
) AS order_totals
WHERE order_totals.tong_tien > 50000;



SELECT 
    s.supplier_name
FROM sinhvien.suppliers s
WHERE EXISTS (
    SELECT 1 
    FROM sinhvien.bangsanpham p 
    WHERE p.supplier_id = s.supplier_id
);
