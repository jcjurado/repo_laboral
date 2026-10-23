{{
    config(
        materialized="view"
    )
}}

SELECT
    "ProductID" AS ProductID,
    "Name" AS ProductName,
    "ProductNumber" AS ProductNumber,
    "MakeFlag" AS MakeFlag,
    "FinishedGoodsFlag" AS FinishedGoodsFlag,
    "Color" AS Color,
    "SafetyStockLevel" AS SafetyStockLevel,
    "ReorderPoint" AS ReorderPoint,
    "StandardCost" AS StandardCost,
    "ListPrice" AS ListPrice,
    "Size" AS Size,
    "SizeUnitMeasureCode" AS SizeUnitMeasureCode,
    "WeightUnitMeasureCode" AS WeightUnitMeasureCode,
    "Weight" AS Weight,
    "DaysToManufacture" AS DaysToManufacture,
    "ProductLine" AS ProductLine,
    "Class" AS Class,
    "Style" AS Style,
    "ProductSubcategoryID" AS SubcategoryID,
    "ProductModelID" AS ProductModelID,
    CAST("SellStartDate" AS DATE) AS SellStartDate,
    CAST("SellEndDate" AS DATE) AS SellEndDate,
    "DiscontinuedDate" AS DiscontinuedDate,
    "rowguid" AS rowguid,
    CAST("ModifiedDate" AS DATE) AS ModifiedDate
FROM {{ source('demo_dg_pg', 'Product') }}