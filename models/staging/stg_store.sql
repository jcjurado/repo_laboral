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
    {{cast_as_date('"ModifiedDate"') }} AS ModifiedDate
FROM {{ source('demo_dg_pg', 'Store') }}