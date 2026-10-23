{{
    config(
        materialized="incremental",
        unique_key="CustomerID",
        incremental_strategy="merge",
        on_schema_change= "sync_all_columns"
    )
}}

SELECT
    CustomerID,
    FirstName,
    LastName,
    PersonID,
    storeName,
    territoryName,
    AccountNumber
FROM {{ref('int_customer')}}

    

    