------lab6--------

---bài 1----
SELECT COUNT (*) AS SoLuongSanPham
FROM sinhvien.bangsanpham

SELECT AVG (price) AS GiaTrungBinh
FROM sinhvien.bangsanpham

SELECT MIN(price) AS SanPhamReNhat
FROM sinhvien.bangsanpham

SELECT MAX(price) AS SanPhamDatNhat
FROM sinhvien.bangsanpham

----bài2----
SELECT 
s.supplier_name,
sp.product_name
FROM sinhvien.suppliers as s
JOIN sinhvien.bangsanpham as sp ON s.supplier_id = sp.supplier_id

INSERT INTO sinhvien.bangsanpham (masp, product_name, price, supplier_id, quantity)
VALUES 
(20, 'suachua', 15000, 1, '20'),
(21, 'suadac', 20000, 1, '15');



UPDATE sinhvien.bangsanpham 
SET supplier_id = 2 
WHERE masp = 1;



SELECT s.supplier_name, 
COUNT(sp.product_name) AS tong_so_san_pham
FROM sinhvien.suppliers AS s
JOIN sinhvien.bangsanpham AS sp ON s.supplier_id = sp.supplier_id
GROUP BY s.supplier_name


SELECT s.supplier_name, 
COUNT(sp.product_name) AS tong_so_san_pham
FROM sinhvien.suppliers AS s
JOIN sinhvien.bangsanpham AS sp ON s.supplier_id = sp.supplier_id
GROUP BY s.supplier_name
HAVING 
COUNT(sp.product_name) > 1;

---bài 3---
SELECT * FROM sinhvien.banghoadon
WHERE EXTRACT(YEAR FROM ngayhd) = 2026 
  AND EXTRACT(MONTH FROM ngayhd) = 4;



SELECT 
    mahd, 
    TO_CHAR(ngayhd, 'DD/MM/YYYY') AS ngay_dinh_dang
FROM sinhvien.banghoadon;


----bài 4----

SELECT 
    kh.tenkh, 
    SUM(ct.soluong * ct.dongiaban) AS tong_chi_tieu
FROM sinhvien.bangkhachhang AS kh
JOIN sinhvien.banghoadon AS hd ON kh.makh = hd.makh
JOIN sinhvien.bangchitiethoadon AS ct ON hd.mahd = ct.mahd
GROUP BY kh.tenkh
HAVING SUM(ct.soluong * ct.dongiaban) > 100000
ORDER BY tong_chi_tieu DESC;