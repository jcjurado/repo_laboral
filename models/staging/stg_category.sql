{{
    config(
        materialized="view"
    )
}}

SELECT
    "ProductCategoryID" AS CategoryID,
    "Name" AS CategoryName,
    "rowguid" AS rowguid,
    CAST("ModifiedDate" AS DATE) AS ModifiedDate
FROM {{ source('demo_dg_pg', 'ProductCategory') }}