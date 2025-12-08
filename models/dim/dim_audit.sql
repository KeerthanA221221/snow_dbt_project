with audit_cols as(
    select * from {{ref("dim_stocks")}}
)
select * from audit_cols

