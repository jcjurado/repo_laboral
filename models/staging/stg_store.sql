{{
    config(
        materialized="view"
    )
}}

SELECT
    "BusinessEntityID" AS BusinessEntityID,
    "Name" AS Name,
    "SalesPersonID" AS SalesPersonID,
    "Demographics" AS Demographics,
    "rowguid" AS rowguid,
    CAST("ModifiedDate" AS DATE) AS ModifiedDate
FROM {{ source('demo_dg_pg', 'Store') }}