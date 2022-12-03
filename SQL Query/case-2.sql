# Melihat 3 produk yang paling sering dibeli oleh pelanggan
select product_id, sum(qty) as total_qty from invoice group by product_id order by qty desc limit 3;