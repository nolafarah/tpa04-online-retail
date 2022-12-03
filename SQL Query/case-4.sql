# Nominal rata-rata transaksi yang dilakukan oleh pelanggan dalam 1 bulan terakhir
select customer_id, year(invoice_date),month(invoice_date),
avg(invoice.qty*product.price) as invoice_avg
from invoice inner join product
on invoice.id = product.id
group by year(invoice.invoice_date),month(invoice.invoice_date)
order by year(invoice.invoice_date),month(invoice.invoice_date);