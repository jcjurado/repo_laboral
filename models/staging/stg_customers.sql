{{
    config(
        materialized="view"
    )

}}

SELECT
    "CustomerID" AS CustomerID,
    "PersonID" AS PersonID,
    "StoreID" AS StoreID,
    "TerritoryID" AS TerritoryID,
    "AccountNumber" AS AccountNumber
FROM {{ source('demo_dg_pg', 'Customer') }}