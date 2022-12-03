# Membuat Database 
create database online_retail;

# Menggunakan Database
use online_retail;

# Membuat Tabel
create table category(
	id int primary key not null auto_increment,
    category_name varchar(30)
);

create table product(
	id int primary key not null auto_increment,
    category_id int,
    product_name varchar(30),
    stock int,
    price int,
    foreign key(category_id) references category(id)
);

create table customer(
	id int primary key not null auto_increment,
    customer_name varchar(25),
    email varchar(25),
    phone_number varchar(20),
    address varchar(30)
);

create table invoice(
	id int primary key not null auto_increment,
    invoice_date date,
    qty int,
    total_price int,
	customer_id int,
    product_id int,
    foreign key (customer_id) references customer(id),
    foreign key (product_id) references product(id)
);

# Mengisi Data Pada Tabel
insert into category(id, category_name) values
(1, "Food & Beverage"),
(2, "Health Care"),
(3, "Stationary"),
(4, "Electoric"),
(5, "Hoby & Collection"),
(6, "Book"),
(7, "Sport"),
(8, "Fashion"),
(9, "Accessories"),
(10, "Beauty & Care");

insert into product(id, category_id, product_name, stock, price) values
(1, 1, "Pie Susu", 121, 35000),
(2, 2, "Vitamin", 200, 15000),
(3, 3, "Binder", 76, 75000),
(4, 4, "Headphone", 10, 569000),
(5, 5, "Photocard", 50, 180000),
(6, 6, "English Dictionary", 23, 80000),
(7, 7, "Sepatu Sport", 30, 199000),
(8, 8, "T-shirt", 55, 129000),
(9, 9, "Jam Tangan", 80, 259000),
(10, 10, "Sunscreen", 157, 69000);

insert into customer(id, customer_name, email, phone_number, address) values
(1, "Destine", "desti@gmail.com", "081293547127", "Surabaya"),
(2, "Sisi", "sisi@gmail.com", "08571727189", "Tangerang"),
(3, "Natasya", "natasy@gmail.com", "089677325525", "Bandung"),
(4, "Nana", "nana@gmail.com", "083811245325", "Jakarta"),
(5, "Raisa", "raisa@gmail.com", "081234567890", "Malang"),
(6, "Sarah", "sarah@gmail.com", "081231455767", "Depok"),
(7, "Azalea", "lea@gmail.com", "087886567985", "Jakarta"),
(8, "Putra", "putra@gmail.com", "085779931231", "Lampung"),
(9, "Steven", "steven@gmail.com", "089865743568", "Jakarta"),
(10, "Budi", "budi@gmail.com", "085712445737", "Bogor");

insert into invoice(id, invoice_date, qty, total_price, customer_id, product_id) values
(1, "2022-08-10", 2, 30000, 1, 2),
(2, "2022-08-17", 1, 569000, 2, 4),
(3, "2022-08-18", 2, 80000, 3, 6),
(4, "2022-08-21", 1, 129000, 4, 8),
(5, "2022-08-25", 2, 199000, 5, 7),
(6, "2022-08-27", 2, 69000, 6, 10),
(7, "2022-09-09", 1, 199000, 7, 7),
(8, "2022-09-25", 2, 75000, 8, 3),
(9, "2022-10-10", 2, 70000, 9, 1),
(10, "2022-11-18", 1, 259000, 10, 9);

# Mengambil Data Tabel
select * from customer;
select * from category;
select * from product;
select * from invoice;

# Update Data Pada Tabel
update customer
set email = "destine@gmail.com", address = "Semarang"
where id = 1;

# Menghapus Data Pada Tabel
delete from invoice where id = 5;
delete from customer where id = 3;
delete from product where id = 3;

# Menghapus Tabel
drop table product;
drop table invoice;

# Menghapus Database
drop database online_retail;

# 1 pelanggan membeli 3 barang yang berbeda
insert into invoice(id, invoice_date, qty, total_price, customer_id, product_id) values
(13, "2022-11-28", 1, 80000, 1, 6),
(14, "2022-11-28", 2, 70000, 1, 1),
(15, "2022-11-28", 1, 75000, 1, 3);

select invoice.id, customer.customer_name, product.product_name
from invoice
left join product on invoice.product_id = product.id 
left join customer on invoice.customer_id = customer.id
order by customer.id desc limit 3;

# Melihat 3 produk yang paling sering dibeli oleh pelanggan
select product_id, sum(qty) as total_qty from invoice group by product_id order by qty desc limit 3;

# Melihat kategori barang yang paling banyak barangnya
select category_id, category_name, product_name, max(stock)
from product inner join category
on product.category_id = category.id;

# Nominal rata-rata transaksi yang dilakukan oleh pelanggan dalam 1 bulan terakhir
select customer_id, year(invoice_date),month(invoice_date),
avg(invoice.qty*product.price) as invoice_avg
from invoice inner join product
on invoice.id = product.id
group by year(invoice.invoice_date),month(invoice.invoice_date)
order by year(invoice.invoice_date),month(invoice.invoice_date);