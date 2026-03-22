bài 1: lấy dữ liệu sản phẩm
SELECT 
    product_name AS TenSanPham, 
    price AS DonGia
FROM products;
bài 2: tìm kiếm khách hàng theo tên
SELECT 
    full_name, 
    phone_number
FROM customers
WHERE full_name LIKE '%Văn%';
bài 3: sắp xếp sản phẩm theo giá
SELECT 
    product_name, 
    price
FROM products
ORDER BY price DESC;
bài 4: tìm 3 sản phẩm rẻ nhất
SELECT 
    product_name, 
    price
FROM products
ORDER BY price ASC
LIMIT 3;