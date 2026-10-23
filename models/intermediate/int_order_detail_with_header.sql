{{
    config(
        materialized="view"
    )
}}

SELECT
    detail.SalesOrderID,
    header.OrderDate,
    header.DueDate,
    header.ShipDate,
    header.Status,
    header.CustomerID,
    header.SalesPersonID,
    detail.SalesOrderDetailID,
    detail.CarrierTrackingNumber,
    detail.OrderQty,
    detail.ProductID,
    detail.SpecialOfferID,
    detail.UnitPrice,
    detail.UnitPriceDiscount,
    detail.LineTotal,
    GREATEST(detail.ModifiedDate, header.ModifiedDate) AS ModifiedDate
FROM {{ ref('stg_orderDetail') }} AS detail
LEFT JOIN {{ ref('stg_orderHeader') }} AS header
    ON detail.SalesOrderID = header.SalesOrderID
