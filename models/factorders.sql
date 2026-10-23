{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

SELECT
  order_id,
  order_date,
  customer_id,
  order_amount,
  status
FROM demo_dag.raw_orders

{% if is_incremental() %}
  WHERE order_id > (SELECT MAX(order_id) FROM {{ this }})
{% endif %}