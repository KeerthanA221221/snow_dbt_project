{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'microbatch',
        event_time = 'last_modified_date',
        begin= '2025-12-14',
        batch_size = 'day',
        unique_key = 'order_id', 
        post_hook = "update EDW_DEV.RAW.flatten_orders set customer_id = 'pl7q524' where order_id = 'O62e427b5'",
        pre_hook = "update EDW_DEV.DBT_KADAMANA.fact_microbatch set customer_id = 'pl7q524' where order_id = 'O62e427b5'"
    )
}}

select *, 'user' as created_by, current_timestamp as creation_date, current_timestamp as last_modified_date
     from {{ source('orders', 'sample_flatten_orders')}}