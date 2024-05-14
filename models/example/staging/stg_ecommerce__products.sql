with source as (
    select * from {{source('thelook_ecommerce','products')}}
)

select 
id as product_id,
cost,
retail_price,
department,
brand
from source




-- id	INTEGER	NULLABLE	-	-	-	
-- -	-	
-- cost	FLOAT	NULLABLE	-	-	-	
-- -	-	
-- category	STRING	NULLABLE	-	-	-	
-- -	-	
-- name	STRING	NULLABLE	-	-	-	
-- -	-	
-- brand	STRING	NULLABLE	-	-	-	
-- -	-	
-- retail_price	FLOAT	NULLABLE	-	-	-	
-- -	-	
-- department	STRING	NULLABLE	-	-	-	
-- -	-	
-- sku	STRING	NULLABLE	-	-	-	
-- -	-	
-- distribution_center_id	INTEGER	NULLABLE	-	-	-	
-- -	-	
-- Job history



