with order_item_measures as (
select
order_id,
SUM(item_sale_price) as total_sale_price,
SUM(product_cost) as total_product_cost,
SUM(item_profit) as total_profit,
SUM(item_discount) as total_discount,
from {{ref('int_ecommerce_product_order_item')}}  
group by 1
)

SELECT
 od.order_id, 
 od.created_at as order_created_at, 
 {{ is_weekday(' od.created_at ') }} as weekday_order,
 od.shipped_at as order_shipped_at, 
 od.delivered_at as order_delivered_at,
 od.returned_at as order_returned_at,
 od.status as order_status, 
 od.num_items_ordered,
 om.total_sale_price, 
 om.total_product_cost, 
 om.total_profit, 
 om.total_discount
from {{ ref('stg_ecommerce__orders') }} as od
left join order_item_measures as om
on od.order_id = om.order_id