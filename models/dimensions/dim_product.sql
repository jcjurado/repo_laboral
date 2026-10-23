{{
    config(
        materialized = "incremental",
        unique_key = "ProductID",
        incremental_strategy = "merge",
        on_schema_change = "sync_all_columns",
        merge_exclude_columns=['fechacarga']
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
    SubcategoryID,
    SubcategoryName,
    CategoryID,
    CategoryName,
    SellStartDate,
    SellEndDate,
    DiscontinuedDate
FROM {{ref('int_product')}}