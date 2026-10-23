{{ dynamic_total_sales(
    source_table=ref('orders_model'),
    column_name='order_amount',
    where_clause="order_date >= date '2024-01-01' and order_date < date '2025-01-01'"
) }}