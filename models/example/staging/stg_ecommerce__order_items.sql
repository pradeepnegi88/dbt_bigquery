{{ config(tags=['orders_related']) }} -- dbt run -s tag:orders_related

with source as (
    select * from {{source('thelook_ecommerce','order_items')}}
)

select 
id as order_id_item,
order_id,
user_id,
product_id,
sale_price as item_sale_price
from source





	

-- id	INTEGER	NULLABLE	-	-	-	
-- -	-	
-- order_id	INTEGER	NULLABLE	-	-	-	
-- -	-	
-- user_id	INTEGER	NULLABLE	-	-	-	
-- -	-	
-- product_id	INTEGER	NULLABLE	-	-	-	
-- -	-	
-- inventory_item_id	INTEGER	NULLABLE	-	-	-	
-- -	-	
-- status	STRING	NULLABLE	-	-	-	
-- -	-	
-- created_at	TIMESTAMP	NULLABLE	-	-	-	
-- -	-	
-- shipped_at	TIMESTAMP	NULLABLE	-	-	-	
-- -	-	
-- delivered_at	TIMESTAMP	NULLABLE	-	-	-	
-- -	-	
-- returned_at	TIMESTAMP	NULLABLE	-	-	-	
-- -	-	
-- sale_price