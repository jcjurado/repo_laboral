{% test no_invalid_order_amounts(model, column_name) %}
  select *
  from {{ model }}
  where {{ column_name }} < 0
{% endtest %}
