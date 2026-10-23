{{
    config(
        materialized="view"
    )
}}

SELECT
    "SalesOrderID" AS SalesOrderID,
    "RevisionNumber" AS RevisionNumber,
    "OrderDate" AS OrderDate,
    "DueDate" AS DueDate,
    "ShipDate" AS ShipDate,
    "Status" AS Status,
    "SalesOrderNumber" AS SalesOrderNumber,
    "PurchaseOrderNumber" AS PurchaseOrderNumber,
    "AccountNumber" AS AccountNumber,
    "CustomerID" AS CustomerID,
    "SalesPersonID" AS SalesPersonID,
    "TerritoryID" AS TerritoryID,
    "BillToAddressID" AS BillToAddressID,
    "ShipToAddressID" AS ShipToAddressID,
    "ShipMethodID" AS ShipMethodID,
    "CreditCardID" AS CreditCardID,
    "CreditCardApprovalCode" AS CreditCardApprovalCode,
    "CurrencyRateID" AS CurrencyRateID,
    "SubTotal" AS SubTotal,
    "TaxAmt" AS TaxAmt,
    "Freight" AS Freight,
    "TotalDue" AS TotalDue,
    CAST("ModifiedDate" as DATE) AS ModifiedDate
FROM {{ source('demo_dg_pg', 'SalesOrderHeader') }}