with stock_daily as(
    select * from {{ref('stock_daily')}})
select stock_name, series,  CAST(open AS INT) as open

from stock_daily