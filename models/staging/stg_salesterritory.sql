{{
    config(
        materialized="view"
    )
}}

SELECT
    "TerritoryID" AS TerritoryID,
    "Name" AS Name,
    "CountryRegionCode" AS CountryRegionCode,
    "Group" AS "Group",
    "SalesYTD" AS SalesYTD,
    "SalesLastYear" AS SalesLastYear,
    "CostYTD" AS CostYTD,
    "CostLastYear" AS CostLastYear,
    "rowguid" AS rowguid,
    CAST("ModifiedDate" AS DATE) AS ModifiedDate
FROM {{ source('demo_dg_pg', 'SalesTerritory') }}