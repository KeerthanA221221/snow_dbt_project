{{ 
    config(
    materialized = 'incremental',
    incremental_strategy = 'delete+insert',
    on_schema_change='append_new_columns',
    partition_by = {'field':'order_id'},
    unique_key = 'order_id'
    )
}}

SELECT order_id,
    order_ts,
    customer_id,
    customer_email,
    currency,
    payment_method,
    total_amount,
    product_id,
    product_name,
    item_price,
    item_qty
FROM {{ source('orders', 'sample_flatten_orders') }}
 