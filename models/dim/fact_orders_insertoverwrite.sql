{{ config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    on_schema_change = 'append_new_columns',
    partition_by = {'field' : 'LAST_MODIFIED_DATE', 'datatype': 'date'}

) }}

select *, 'user' as created_by, current_timestamp as creation_date, current_timestamp as last_modified_date
     from {{ source('orders','sample_flatten_orders') }}

{% if is_incremental() %}
    WHERE order_ts >= (SELECT MAX(order_ts) FROM {{ this }})
{% endif %}