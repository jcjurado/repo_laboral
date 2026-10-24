{{
    config(
        materialized="view"
    )
}}

SELECT
    "ProductCategoryID" AS CategoryID,
    "Name" AS CategoryName,
    "rowguid" AS rowguid,
    {{cast_as_date('"ModifiedDate"') }} AS ModifiedDate
FROM {{ source('demo_dg_pg', 'ProductCategory') }}