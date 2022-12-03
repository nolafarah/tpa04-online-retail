# Melihat kategori barang yang paling banyak barangnya
select category_id, category_name, product_name, max(stock)
from product inner join category
on product.category_id = category.id;