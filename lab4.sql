bài 1: tạo toàn bộ cấu trúc CSDL bằng câu lệnh
-- 1. Tạo bảng Khách hàng
CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY AUTO_INCREMENT,
    TenKH VARCHAR(255) NOT NULL,
    SoDienThoai VARCHAR(15),
    DiaChi VARCHAR(255)
);

-- 2. Tạo bảng Sản phẩm
CREATE TABLE SanPham (
    MaSP INT PRIMARY KEY AUTO_INCREMENT,
    TenSP VARCHAR(255) NOT NULL,
    DonGia DECIMAL(10, 2) NOT NULL CHECK (DonGia > 0)
);

-- 3. Tạo bảng Hóa đơn
CREATE TABLE HoaDon (
    MaHD INT PRIMARY KEY,
    NgayHD TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    MaKH INT,
    TongTien DECIMAL(10, 2),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

-- 4. Tạo bảng Chi tiết hóa đơn
CREATE TABLE ChiTietHoaDon (
    MaHD INT,
    MaSP INT,
    SoLuong INT NOT NULL CHECK (SoLuong > 0),
    PRIMARY KEY (MaHD, MaSP), -- Composite Key
    FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
bài 2: tạo bảng nhà cung cấp
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(15) UNIQUE
);
bài 3: cập nhật cấu trúc bảng
1, thêm cột email vào bảng suppliers
ALTER TABLE suppliers 
ADD email VARCHAR(100);
2, liên kết bảng products với bảng suppliers
bước 1 thêm cột supplier_id vào bảng products
ALTER TABLE products 
ADD supplier_id INT;
bước 2 tạo ràng buộc khóa 
ALTER TABLE products 
ADD CONSTRAINT fk_products_suppliers 
FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id);
bài 4: thao tác với dữ liệu nhà cung cấp và sản phẩm
INSERT INTO suppliers (supplier_name, contact_phone, email)
VALUES 
('Công ty Sữa Việt Nam', '0987654321', 'contact@vinamilk.vn'),
('Công ty Thực phẩm Á Châu', '0912345678', 'contact@acecook.vn');

UPDATE suppliers
SET contact_phone = '0911112222'
WHERE supplier_name = 'Công ty Thực phẩm Á Châu';

DELETE FROM products
WHERE product_id = 8;

bài 5: thao tác với dữ liệu nhà cung cấp và sản phẩm 
CREATE TABLE test_table (
    id INT
);

ALTER TABLE suppliers 
DROP COLUMN contact_phone;

DROP TABLE test_table;
