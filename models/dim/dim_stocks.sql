with raw_stock_data as (
    select * from {{ref('stock_daily')}}
)
select 
        STOCK_NAME, 
        SERIES,OPEN,HIGH,LOW,CLOSE,LAST,PREVCLOSE, total_quantity_traded, total_trade_val,Date,TOTALTRADES,ISIN
        {{ add_audit_columns('dbt_user') }}

from raw_stock_data