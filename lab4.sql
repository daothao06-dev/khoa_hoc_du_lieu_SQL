CREATE TABLE sinhvien.suppliers(
	Supplier_id SERIAL PRIMARY KEY ,
	Supplier_name VARCHAR(255) NOT NULL,
	Contact_phone VARCHAR(15) UNIQUE
); 


ALTER TABLE sinhvien.suppliers 
ADD COLUMN email VARCHAR(100);

ALTER TABLE sinhvien.bangsanpham
ADD COLUMN Supplier_id INT ;


ALTER TABLE sinhvien.bangsanpham 
ADD CONSTRAINT fk_sinhvien_bangsanpham_Suppliers 
FOREIGN KEY (Supplier_id) REFERENCES sinhvien.Suppliers(Supplier_id);


INSERT INTO sinhvien.Suppliers (Supplier_name, Contact_phone, Email) 
VALUES ('Công ty Sữa Việt Nam', '0987654321', 'contact@vinamilk.vn'),
('Công ty Thực phẩm Á Châu', '0912345678', 'contact@acecook.vn');


SELECT * FROM sinhvien.Suppliers;


UPDATE sinhvien.Suppliers 
SET Contact_phone = '0911112222'
WHERE Supplier_name = 'Công ty Thực phẩm Á Châu'



CREATE TABLE test_table (
    id INT
);

ALTER TABLE suppliers 
DROP COLUMN contact_phone;

DROP TABLE test_table;



SELECT c.customeridcustomerid, 
from customers c
inner join 