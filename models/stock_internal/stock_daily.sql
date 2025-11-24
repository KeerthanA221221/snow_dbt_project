/*{{ config(transient = false)}}*/
with raw_stock_data as (
    select * from EDW_DEV.RAW.nse_stock_daily_data
)
select 
        SYMBOL as stock_name, 
        --xyz,
        SERIES,OPEN,HIGH,LOW,CLOSE,LAST,PREVCLOSE,TOTTRDQTY as total_quantity_traded,TOTTRDVAL as total_trade_val,TIMESTAMP as Date,TOTALTRADES,ISIN

from raw_stock_data