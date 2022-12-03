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