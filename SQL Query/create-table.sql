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