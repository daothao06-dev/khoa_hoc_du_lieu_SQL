CREATE TABLE sinhvien.bangkhachhang(
	MaKH INT PRIMARY KEY,
	TenKH VARCHAR(255),
	SoDienThoai VARCHAR(15),
	Email VARCHAR(100) NOT NULL,
	DiaChi VARCHAR(255)
);
INSERT INTO sinhvien.bangkhachhang (MaKh, TenKH, Email, SoDienThoai, DiaChi)
VALUES
('1', 'Nguyen Van An', 'an.nguyen@company.com', '0901234567', 'Ha Noi'),
('2', 'Tran Thi Binh', 'binh.tran@company.com', '0912345678', 'Hai Phong'),
('3', 'Le Minh Cuong', 'cuong.le@company.com', '0923456789', 'Da Nang'),
('4', 'Pham Thu Duong', 'duong.pham@company.com', '0934567890', 'Ho Chi Minh'),
('5', 'Hoang Van En', 'en.hoang@company.com', '0945678901', 'Can Tho'),
('6', 'Vo Thi Phuong', 'phuong.vo@company.com', '0956789012', 'Hue'),
('7', 'Do Minh Giang', 'giang.do@company.com', '0967890123', 'Nghe An'),
('8', 'Bui Thi Hoa', 'hoa.bui@company.com','0967890563', 'Nam Dinh'),
('9', 'Ly Van Ich', 'ich.ly@company.com', '0978901234', 'Quang Ninh'),
('10', 'Mai Thi Kim', 'kim.mai@company.com', '0989012345', 'Ha Noi');


CREATE TABLE sinhvien.bangsanpham(
	MaSP INT PRIMARY KEY,
	Product_name VARCHAR(255),
	Price DECIMAL(10,2)
);
INSERT INTO sinhvien.bangsanpham(MaSP, Product_name, Price)
VALUES
('1', 'banhmi', '25000'),
('2', 'snack','15000'),
('3','coca','10000'),
('4','suaconbo','27000'),
('5','nuoccam','17000'),
('6','nuocep','22000'),
('7','nuocepcam','32000'),
('8','banhmikinhdo','30000'),
('9','traicay','67000'),
('10','saurieng','50000');


CREATE TABLE sinhvien.banghoadon(
	MaHD INT PRIMARY KEY,
	NgayHD TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	MaKH INT,
	TongTien DECIMAL(10,2),
	CONSTRAINT fk_bangkhachhang FOREIGN KEY (MaKH) REFERENCES sinhvien.bangkhachhang(MaKH)
);
CREATE TABLE sinhvien.bangchitiethoadon(
	MaHD INT,
	MaSP INT,
	Soluong INT NOT NULL CHECK (Soluong >0),
	DonGiaBan DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (MaHD, MaSP),
	CONSTRAINT fk_banghoadon FOREIGN KEY (MaHD) REFERENCES sinhvien.banghoadon(MaHD),
	CONSTRAINT fk_bangsanpham FOREIGN KEY (MaSP) REFERENCES sinhvien.bangsanpham(MaSP)
);
SELECT * FROM sinhvien.bangkhachhang;
-- lab3 
SELECT 
    Product_name AS TenSanPham, 
    Price AS DonGia
FROM 
    sinhvien.bangsanpham;


SELECT  MaKH, TenKH, SoDienThoai
FROM sinhvien.bangkhachhang
WHERE TenKh LIKE '%An%';


SELECT Product_name, Price
FROM sinhvien.bangsanpham
ORDER BY Price DESC;



SELECT Product_name, Price
FROM sinhvien.bangsanpham
ORDER BY Price
LIMIT 3; 