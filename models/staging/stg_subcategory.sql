{{
    config(
        materialized="view"
    )
}}

SELECT
    "ProductSubcategoryID" AS SubcategoryID,
    "ProductCategoryID" AS CategoryID,
    "Name" AS SubcategoryName,
    "rowguid" AS rowguid,
    CAST("ModifiedDate" AS DATE) AS ModifiedDate
FROM {{ source('demo_dg_pg', 'ProductSubcategory') }}