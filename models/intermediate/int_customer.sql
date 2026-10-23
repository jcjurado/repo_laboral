{{
    config(
        materialized="view"
    )
}}

SELECT
    cust.CustomerID,
    pers.FirstName,
    pers.LastName,
    cust.PersonID,
    store.Name AS storeName,
    terr.Name AS territoryName,
    cust.AccountNumber
FROM {{ ref('stg_customers') }} as cust
LEFT JOIN {{ref('stg_person')}} as pers ON cust.PersonID = pers.BusinessEntityID
LEFT JOIN {{ref('stg_salesterritory')}} as terr ON  cust.TerritoryID = terr.TerritoryID
LEFT JOIN {{ref('stg_store')}} as store ON cust.StoreID = store.BusinessEntityID