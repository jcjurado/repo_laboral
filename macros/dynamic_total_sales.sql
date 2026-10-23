{% macro dynamic_total_sales(source_table, column_name, where_clause=None) %}
    select
        sum({{ column_name }}) as total_sales
    from {{ source_table }}
    {% if where_clause is not none %}
        where {{ where_clause }}
    {% endif %}
{% endmacro %}