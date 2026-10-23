{{
    config(
        materialized="incremental",
        unique_key="SalesOrderDetailID",
        incremental_strategy="merge",
        merge_update_columns=["OrderQty","GrossLineAmount"]
    )
}}

{% if is_incremental() %}
WITH incremental_watermark AS (
    SELECT COALESCE(MAX(ModifiedDate), '1900-01-01'::date) AS max_modified_date
    FROM {{ this }}
)
{% endif %}
SELECT
    SalesOrderID,
    SalesOrderDetailID,
    OrderDate,
    DueDate,
    ShipDate,
    Status,
    CustomerID,
    ProductID,
    OrderQty,
    UnitPrice,
    UnitPriceDiscount,
    UnitPrice * OrderQty AS GrossLineAmount,
    UnitPrice * OrderQty * UnitPriceDiscount AS DiscountAmount,
    LineTotal,
    CAST(ModifiedDate AS date) AS ModifiedDate
FROM {{ ref('int_order_detail_with_header') }} AS orders
{% if is_incremental() %}
WHERE orders.ModifiedDate >= (
    SELECT max_modified_date
    FROM incremental_watermark
)
{% endif %}