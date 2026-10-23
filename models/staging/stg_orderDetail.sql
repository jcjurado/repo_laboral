{{
    config(
        materialized="view"
    )
}}
SELECT
    "SalesOrderID" AS SalesOrderID,
    "SalesOrderDetailID" AS SalesOrderDetailID,
    "CarrierTrackingNumber" AS CarrierTrackingNumber,
    "OrderQty" AS OrderQty,
    "ProductID" AS ProductID,
    "SpecialOfferID" AS SpecialOfferID,
    "UnitPrice" AS UnitPrice,
    "UnitPriceDiscount" AS UnitPriceDiscount,
    "LineTotal" AS LineTotal,
    CAST("ModifiedDate" as DATE) AS ModifiedDate
FROM {{ source('demo_dg_pg', 'SalesOrderDetail') }}