with products as (
select
product_id,
department as product_department, 
cost as product_cost, 
retail_price as product_retail_price
from {{ref('stg_ecommerce__products') }}
)


select 
order_items.order_id_item,

order_items.order_id,

order_items.user_id,

order_items.product_id,

-- Order item data
order_items.item_sale_price,
-- Product data
products.product_department,
 products.product_cost, 
 products.product_retail_price,

-- Calculated fields
order_items.item_sale_price - products.product_cost as item_profit,
products.product_retail_price - order_items.item_sale_price as item_discount
from  {{ref('stg_ecommerce__order_items') }} as order_items
left join products on order_items.product_id = products.product_id