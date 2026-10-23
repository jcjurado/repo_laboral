{{
    config(
        materialized="view"
    )
}}

SELECT 
    ProductID,
    ProductName,
    ProductNumber,
    MakeFlag,
    FinishedGoodsFlag,
    Color,
    SafetyStockLevel,
    ReorderPoint,
    StandardCost,
    ListPrice,
    Size,
    SizeUnitMeasureCode,
    WeightUnitMeasureCode,
    Weight,
    DaysToManufacture,
    ProductLine,
    Class,
    Style,
    prod.SubcategoryID,
    SubcategoryName,
    subcat.CategoryID,
    CategoryName,
    SellStartDate,
    SellEndDate,
    DiscontinuedDate
FROM {{ref('stg_product')}} as prod 
LEFT JOIN {{ref('stg_subcategory')}} as subcat ON prod.SubcategoryID = subcat.SubcategoryID
LEFT JOIN {{ref('stg_category')}} as cat ON subcat.CategoryID = cat.CategoryID