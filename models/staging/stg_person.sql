{{
    config(
        materialized="view"
    )
}}

SELECT
    "BusinessEntityID" AS BusinessEntityID,
    "PersonType" AS PersonType,
    "NameStyle" AS NameStyle,
    "Title" AS Title,
    "FirstName" AS FirstName,
    "MiddleName" AS MiddleName,
    "LastName" AS LastName,
    "Suffix" AS Suffix,
    "EmailPromotion" AS EmailPromotion,
    "AdditionalContactInfo" AS AdditionalContactInfo,
    "Demographics" AS Demographics,
    "rowguid" AS rowguid,
    CAST("ModifiedDate" AS DATE) AS ModifiedDate
FROM {{ source('demo_dg_pg', 'Person') }}