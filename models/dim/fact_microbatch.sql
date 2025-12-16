{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'microbatch',
        event_time = 'ORDER_TS',
        begin= '2025-12-14',
        batch_size = 'day',
        unique_key = 'order_id'
    )
}}

select *, 'user' as created_by, current_timestamp as creation_date, current_timestamp as last_modified_date
     from {{ source('orders', 'sample_flatten_orders')}}