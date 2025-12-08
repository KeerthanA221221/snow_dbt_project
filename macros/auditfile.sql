{% macro add_audit_columns(created_by='system') %}
    , '{{ created_by }}' AS created_by
    , {{ current_timestamp() }} AS created_on
    
{% endmacro %}