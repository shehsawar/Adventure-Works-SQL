.LOGON 192.168.25.128/dbc,dbc;
DATABASE awp_stg2;

--Person Module

INSERT INTO awp_stg2.Person_Address
SELECT DISTINCT
CASE WHEN AddressID1 = 'NULL' THEN -1 ELSE AddressID1 END AS AddressID1,
CASE WHEN AddressLine1 IS NULL THEN 'N/A' ELSE AddressLine1 END AS AddressLine1,
CASE WHEN AddressLine2 IS NULL THEN 'N/A' ELSE AddressLine2 END AS AddressLine2,
CASE WHEN City= 'NULL' THEN 'N/A' ELSE City END AS City,
CASE WHEN StateProvinceID1 = 'NULL' THEN -1 ELSE StateProvinceID1 END AS StateProvinceID, --DML is same, DDL: Integer --> VARCHAR(100)
CASE WHEN PostalCode IS NULL THEN 'N/A' ELSE PostalCode END AS PostalCode,
CASE WHEN SpatialLocation IS NULL THEN 'N/A' ELSE SpatialLocation END AS SpatialLocation
FROM awp_stg1.Person;

INSERT INTO awp_stg2.Person_AddressType
SELECT DISTINCT
CASE WHEN AddressTypeID1 = 'NULL' THEN -1 ELSE AddressTypeID1 END AS AddressTypeID,
CASE WHEN Name4 = 'NULL' THEN 'N/A' ELSE Name4 END AS Name4
FROM awp_stg1.Person;

INSERT INTO awp_stg2.Person_BusinessEntity
SELECT DISTINCT
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1
FROM awp_stg1.Person;

INSERT INTO awp_stg2.Person_BusinessEntityAddress
SELECT DISTINCT
CASE WHEN AddressID1 = 'NULL' THEN -1 ELSE AddressID1 END AS AddressID1,
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN AddressTypeID1 = 'NULL' THEN -1 ELSE AddressTypeID1 END AS AddressTypeID
FROM awp_stg1.Person;

INSERT INTO awp_stg2.Person_ContactType
SELECT DISTINCT
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN Name1 = 'NULL' THEN 'N/A' ELSE Name1 END AS Name1
FROM awp_stg1.Person;

INSERT INTO awp_stg2.Person_CountryRegion
SELECT DISTINCT
CASE WHEN CountryRegionCode1 = 'NULL' THEN 'N/A' ELSE CAST(CountryRegionCode1 AS CHAR(4)) END AS CountryRegionCode,
CASE WHEN Name3 = 'NULL' THEN 'N/A' ELSE Name3 END AS Name3
FROM awp_stg1.Person;

INSERT INTO awp_stg2.Person_EmailAddress
SELECT DISTINCT
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN EmailAddressID = 'NULL' THEN -1 ELSE EmailAddressID END AS EmailAddressID,
CASE WHEN EmailAddress = 'NULL' THEN 'N/A' ELSE EmailAddress END AS EmailAddress
FROM awp_stg1.Person;

INSERT INTO awp_stg2.Person_Passwords
SELECT DISTINCT
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN PasswordHash = 'NULL' THEN 'N/A' ELSE PasswordHash END AS PasswordHash,
CASE WHEN PasswordSalt = 'NULL' THEN 'N/A' ELSE PasswordSalt END AS PasswordSalt
FROM awp_stg1.Person;

INSERT INTO awp_stg2.Person_Person
SELECT DISTINCT
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN PersonType = 'NULL' THEN 'N/A' ELSE PersonType END AS PersonType,
CASE WHEN Title1 = 'NULL' THEN 'N/A' ELSE CAST(Title1 AS CHAR(4)) END AS Title1,
CASE WHEN FirstName = 'NULL' THEN 'N/A' ELSE FirstName END AS FirstName,
CASE WHEN MiddleName = 'NULL' THEN 'N/A' ELSE MiddleName END AS MiddleName,
CASE WHEN LastName = 'NULL' THEN 'N/A' ELSE LastName END AS LastName,
CASE WHEN Suffix = 'NULL' THEN 'N/A' ELSE CAST(Suffix AS CHAR(5)) END AS Suffix,
CASE WHEN EmailPromotion = 'NULL' THEN -1 ELSE CAST(EmailPromotion AS BYTEINT) END AS EmailPromotion,
CASE WHEN DEMOGRAPHICS = 'NULL' THEN 'N/A' ELSE DEMOGRAPHICS END AS DEMOGRAPHICS
FROM awp_stg1.Person;

INSERT INTO awp_stg2.Person_PhoneNumberType
SELECT DISTINCT
1,
CASE WHEN Name1 = 'NULL' THEN 'N/A' ELSE Name1 END AS Name1
FROM awp_stg1.Person;

INSERT INTO awp_stg2.Person_PersonPhone
SELECT DISTINCT
CASE WHEN a.BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN a.PhoneNumber = 'NULL' THEN -1 ELSE PhoneNumber END AS PhoneNumber,
CASE WHEN b.PhoneNumberTypeID IS NULL THEN -1 ELSE PhoneNumberTypeID END AS PhoneNumberTypeID
FROM awp_stg1.Person a
INNER JOIN
awp_stg2.Person_PhoneNumberType b
ON a.Name1 = b.Name1;

INSERT INTO awp_stg2.Person_StateProvince
SELECT DISTINCT
CASE WHEN StateProvinceID1 = 'NULL' THEN -1 ELSE StateProvinceID1 END AS StateProvinceID, --DML is same, DDL: Integer --> VARCHAR(100)
CASE WHEN StateProvinceCode IS NULL THEN 'N/A' ELSE StateProvinceCode END AS StateProvinceCode,
--StateProvinceCode,
CASE WHEN CountryRegionCode1 = 'NULL' THEN 'N/A' ELSE CAST(CountryRegionCode1 AS CHAR(6)) END AS CountryRegionCode,
CASE WHEN isOnlyStateProvinceFlag = 'NULL' THEN -1 ELSE isOnlyStateProvinceFlag END AS isOnlyStateProvinceFlag,
CASE WHEN Name2 = 'NULL' THEN 'N/A' ELSE Name2 END AS Name2,
CASE WHEN TerritoryID = 'NULL' THEN -1 ELSE TerritoryID END AS TerritoryID
FROM awp_stg1.Person;













--Sales

-- for dates of some tables, dash (-) is used instead of hyphen (/) in STG1


INSERT INTO awp_stg2.Sales_CreditCard	
SELECT DISTINCT 
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID,
	CASE WHEN CardType='NULL' THEN 'N/A' ELSE CardType END  AS CardType,
	CASE WHEN CardNumber = 'NULL' THEN 'NA' ELSE CardNumber END AS CardNumber,
	CASE WHEN ExpMonth='NULL' THEN -1 ELSE CAST(ExpMonth AS SMALLINT) END AS  ExpMonth,
	CASE WHEN ExpYear='NULL' THEN -1 ELSE CAST(ExpYear AS SMALLINT) END AS  ExpYear
FROM awp_stg1.Sales
UNION
SELECT DISTINCT 
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID,
	CASE WHEN CardType='NULL' THEN 'N/A' ELSE CardType END  AS CardType,
	CASE WHEN CardNumber = 'NULL' THEN 'NA' ELSE CardNumber END AS CardNumber,
	CASE WHEN ExpMonth='NULL' THEN -1 ELSE CAST(ExpMonth AS SMALLINT) END AS  ExpMonth,
	CASE WHEN ExpYear='NULL' THEN -1 ELSE CAST(ExpYear AS SMALLINT) END AS  ExpYear
FROM awp_stg1.Sales_April_1_10
UNION
SELECT DISTINCT 
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID,
	CASE WHEN CardType='NULL' THEN 'N/A' ELSE CardType END  AS CardType,
	CASE WHEN CardNumber = 'NULL' THEN 'NA' ELSE CardNumber END AS CardNumber,
	CASE WHEN ExpMonth='NULL' THEN -1 ELSE CAST(ExpMonth AS SMALLINT) END AS  ExpMonth,
	CASE WHEN ExpYear='NULL' THEN -1 ELSE CAST(ExpYear AS SMALLINT) END AS  ExpYear
FROM awp_stg1.Sales_April_1_10_2
UNION
SELECT DISTINCT 
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID,
	CASE WHEN CardType='NULL' THEN 'N/A' ELSE CardType END  AS CardType,
	CASE WHEN CardNumber = 'NULL' THEN 'NA' ELSE CardNumber END AS CardNumber,
	CASE WHEN ExpMonth='NULL' THEN -1 ELSE CAST(ExpMonth AS SMALLINT) END AS  ExpMonth,
	CASE WHEN ExpYear='NULL' THEN -1 ELSE CAST(ExpYear AS SMALLINT) END AS  ExpYear
FROM awp_stg1.Sales_April_11_20
UNION
SELECT DISTINCT 
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID,
	CASE WHEN CardType='NULL' THEN 'N/A' ELSE CardType END  AS CardType,
	CASE WHEN CardNumber = 'NULL' THEN 'NA' ELSE CardNumber END AS CardNumber,
	CASE WHEN ExpMonth='NULL' THEN -1 ELSE CAST(ExpMonth AS SMALLINT) END AS  ExpMonth,
	CASE WHEN ExpYear='NULL' THEN -1 ELSE CAST(ExpYear AS SMALLINT) END AS  ExpYear
FROM awp_stg1.Sales_April_21_30
UNION
SELECT DISTINCT 
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID,
	CASE WHEN CardType='NULL' THEN 'N/A' ELSE CardType END  AS CardType,
	CASE WHEN CardNumber = 'NULL' THEN 'NA' ELSE CardNumber END AS CardNumber,
	CASE WHEN ExpMonth='NULL' THEN -1 ELSE CAST(ExpMonth AS SMALLINT) END AS  ExpMonth,
	CASE WHEN ExpYear='NULL' THEN -1 ELSE CAST(ExpYear AS SMALLINT) END AS  ExpYear
FROM awp_stg1.Sales_May_06_10
UNION
SELECT DISTINCT 
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID,
	CASE WHEN CardType='NULL' THEN 'N/A' ELSE CardType END  AS CardType,
	CASE WHEN CardNumber = 'NULL' THEN 'NA' ELSE CardNumber END AS CardNumber,
	CASE WHEN ExpMonth='NULL' THEN -1 ELSE CAST(ExpMonth AS SMALLINT) END AS  ExpMonth,
	CASE WHEN ExpYear='NULL' THEN -1 ELSE CAST(ExpYear AS SMALLINT) END AS  ExpYear
FROM awp_stg1.Sales_May_11_20
UNION
SELECT DISTINCT 
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID,
	CASE WHEN CardType='NULL' THEN 'N/A' ELSE CardType END  AS CardType,
	CASE WHEN CardNumber = 'NULL' THEN 'NA' ELSE CardNumber END AS CardNumber,
	CASE WHEN ExpMonth='NULL' THEN -1 ELSE CAST(ExpMonth AS SMALLINT) END AS  ExpMonth,
	CASE WHEN ExpYear='NULL' THEN -1 ELSE CAST(ExpYear AS SMALLINT) END AS  ExpYear
FROM awp_stg1.Sales_May_21_31;







INSERT INTO awp_stg2.Sales_Currency
SELECT DISTINCT 
	CASE WHEN CurrencyCode = 'NULL' THEN -1 ELSE CAST(CurrencyCode AS CHAR(6)) END AS  CurrencyCode,
	CASE WHEN Name2 = 'NULL' THEN 'N/A' ELSE Name2 END AS Name1
FROM awp_stg1.Sales_May_06_10;







INSERT INTO awp_stg2.Sales_CurrencyRate
SELECT DISTINCT 
	CASE WHEN CurrencyRateID1='NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID1,
	CASE WHEN CurrencyRateDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(CurrencyRateDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS CurrencyRateDate,
	CASE WHEN FromCurrencyCode = 'NULL' THEN '-1' ELSE FromCurrencyCode END AS FromCurrencyCode,
	CASE WHEN ToCurrencyCode = 'NULL' THEN '-1' ELSE ToCurrencyCode END AS ToCurrencyCode,
	CASE WHEN AverageRate='NULL' THEN -1 ELSE CAST(AverageRate AS DECIMAL(8,2)) END AS AverageRate,
	CASE WHEN EndOfDayRate='NULL' THEN -1 ELSE CAST(EndOfDayRate AS DECIMAL(8,2)) END AS EndOfDayRate
FROM awp_stg1.Sales_April_1_10
UNION
SELECT DISTINCT 
	CASE WHEN CurrencyRateID1='NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID1,
	CASE WHEN CurrencyRateDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(CurrencyRateDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS CurrencyRateDate,
	CASE WHEN FromCurrencyCode = 'NULL' THEN '-1' ELSE FromCurrencyCode END AS FromCurrencyCode,
	CASE WHEN ToCurrencyCode = 'NULL' THEN '-1' ELSE ToCurrencyCode END AS ToCurrencyCode,
	CASE WHEN AverageRate='NULL' THEN -1 ELSE CAST(AverageRate AS DECIMAL(8,2)) END AS AverageRate,
	CASE WHEN EndOfDayRate='NULL' THEN -1 ELSE CAST(EndOfDayRate AS DECIMAL(8,2)) END AS EndOfDayRate
FROM awp_stg1.Sales_April_1_10_2
UNION
SELECT DISTINCT 
	CASE WHEN CurrencyRateID1='NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID1,
	CASE WHEN CurrencyRateDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(CurrencyRateDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS CurrencyRateDate,
	CASE WHEN FromCurrencyCode = 'NULL' THEN '-1' ELSE FromCurrencyCode END AS FromCurrencyCode,
	CASE WHEN ToCurrencyCode = 'NULL' THEN '-1' ELSE ToCurrencyCode END AS ToCurrencyCode,
	CASE WHEN AverageRate='NULL' THEN -1 ELSE CAST(AverageRate AS DECIMAL(8,2)) END AS AverageRate,
	CASE WHEN EndOfDayRate='NULL' THEN -1 ELSE CAST(EndOfDayRate AS DECIMAL(8,2)) END AS EndOfDayRate
FROM awp_stg1.Sales_April_11_20
UNION
SELECT DISTINCT 
	CASE WHEN CurrencyRateID1='NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID1,
	CASE WHEN CurrencyRateDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(CurrencyRateDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS CurrencyRateDate,
	CASE WHEN FromCurrencyCode = 'NULL' THEN '-1' ELSE FromCurrencyCode END AS FromCurrencyCode,
	CASE WHEN ToCurrencyCode = 'NULL' THEN '-1' ELSE ToCurrencyCode END AS ToCurrencyCode,
	CASE WHEN AverageRate='NULL' THEN -1 ELSE CAST(AverageRate AS DECIMAL(8,2)) END AS AverageRate,
	CASE WHEN EndOfDayRate='NULL' THEN -1 ELSE CAST(EndOfDayRate AS DECIMAL(8,2)) END AS EndOfDayRate
FROM awp_stg1.Sales_April_21_30
UNION
SELECT DISTINCT 
	CASE WHEN CurrencyRateID1='NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID1,
	CASE WHEN CurrencyRateDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(CurrencyRateDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS CurrencyRateDate,
	CASE WHEN FromCurrencyCode = 'NULL' THEN '-1' ELSE FromCurrencyCode END AS FromCurrencyCode,
	CASE WHEN ToCurrencyCode = 'NULL' THEN '-1' ELSE ToCurrencyCode END AS ToCurrencyCode,
	CASE WHEN AverageRate='NULL' THEN -1 ELSE CAST(AverageRate AS DECIMAL(8,2)) END AS AverageRate,
	CASE WHEN EndOfDayRate='NULL' THEN -1 ELSE CAST(EndOfDayRate AS DECIMAL(8,2)) END AS EndOfDayRate
FROM awp_stg1.Sales_May_06_10
UNION
SELECT DISTINCT 
	CASE WHEN CurrencyRateID1='NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID1,
	CASE WHEN CurrencyRateDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(CurrencyRateDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS CurrencyRateDate,
	CASE WHEN FromCurrencyCode = 'NULL' THEN '-1' ELSE FromCurrencyCode END AS FromCurrencyCode,
	CASE WHEN ToCurrencyCode = 'NULL' THEN '-1' ELSE ToCurrencyCode END AS ToCurrencyCode,
	CASE WHEN AverageRate='NULL' THEN -1 ELSE CAST(AverageRate AS DECIMAL(8,2)) END AS AverageRate,
	CASE WHEN EndOfDayRate='NULL' THEN -1 ELSE CAST(EndOfDayRate AS DECIMAL(8,2)) END AS EndOfDayRate
FROM awp_stg1.Sales_May_11_20
UNION
SELECT DISTINCT 
	CASE WHEN CurrencyRateID1='NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID1,
	CASE WHEN CurrencyRateDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(CurrencyRateDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS CurrencyRateDate,
	CASE WHEN FromCurrencyCode = 'NULL' THEN '-1' ELSE FromCurrencyCode END AS FromCurrencyCode,
	CASE WHEN ToCurrencyCode = 'NULL' THEN '-1' ELSE ToCurrencyCode END AS ToCurrencyCode,
	CASE WHEN AverageRate='NULL' THEN -1 ELSE CAST(AverageRate AS DECIMAL(8,2)) END AS AverageRate,
	CASE WHEN EndOfDayRate='NULL' THEN -1 ELSE CAST(EndOfDayRate AS DECIMAL(8,2)) END AS EndOfDayRate
FROM awp_stg1.Sales_May_21_31;

INSERT INTO awp_stg2.Sales_Customer
SELECT DISTINCT 
 CASE WHEN  CustomerID ='NULL' THEN -1 ELSE  CustomerID END AS  CustomerID,
    CASE WHEN  PersonID  = 'NULL' THEN -1 ELSE  PersonID END AS PersonID,
	CASE WHEN  StoreID  = 'NULL'  THEN -1 ELSE  StoreID END AS StoreID,
	CASE WHEN  TerritoryID = 'NULL' THEN -1 ELSE  TerritoryID END AS TerritoryID,
	CASE WHEN AccountNumber = 'NULL' THEN 'N/A' ELSE AccountNumber END AS AccountNumber
FROM  awp_stg1.Customer_Sales;







INSERT INTO awp_stg2.Sales_PersonCreditCard	
SELECT DISTINCT 
    CASE WHEN BusinessEntityID1='NULL' THEN -1 ELSE BusinessEntityID1 END AS  BusinessEntityID,
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID
FROM awp_stg1.Sales
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1='NULL' THEN -1 ELSE BusinessEntityID1 END AS  BusinessEntityID,
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID
FROM awp_stg1.Sales_April_1_10
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1='NULL' THEN -1 ELSE BusinessEntityID1 END AS  BusinessEntityID,
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID
FROM awp_stg1.Sales_April_1_10_2
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1='NULL' THEN -1 ELSE BusinessEntityID1 END AS  BusinessEntityID,
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID
FROM awp_stg1.Sales_April_11_20
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1='NULL' THEN -1 ELSE BusinessEntityID1 END AS  BusinessEntityID,
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID
FROM awp_stg1.Sales_April_21_30
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1='NULL' THEN -1 ELSE BusinessEntityID1 END AS  BusinessEntityID,
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID
FROM awp_stg1.Sales_May_06_10
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1='NULL' THEN -1 ELSE BusinessEntityID1 END AS  BusinessEntityID,
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID
FROM awp_stg1.Sales_May_11_20
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1='NULL' THEN -1 ELSE BusinessEntityID1 END AS  BusinessEntityID,
	CASE WHEN CreditCardID1='NULL' THEN -1 ELSE CreditCardID1 END AS  CreditCardID
FROM awp_stg1.Sales_May_21_31;







INSERT INTO awp_stg2.Sales_SalesOrderDetail
	SELECT DISTINCT
	CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
	CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
	CASE WHEN SalesOrderDetailID = 'NULL' THEN -1 ELSE SalesOrderDetailID END AS SalesOrderDetailID,
	CASE WHEN CarrierTrackingNumber = 'NULL' THEN 'N/A' ELSE CarrierTrackingNumber END AS CarrierTrackingNumber,
	CASE WHEN OrderQty = 'NULL' THEN -1 ELSE OrderQty END AS OrderQty,
	CASE WHEN ProductID1 = 'NULL' THEN -1 ELSE ProductID1 END AS ProductID,
	CASE WHEN SpecialOfferID1 = 'NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID,
	CASE WHEN  UnitPrice = 'NULL' THEN -1 ELSE  CAST(UnitPrice AS DECIMAL(10,2)) END AS UnitPrice,
	CASE WHEN UnitPriceDiscount = 'NULL' THEN -1 ELSE  CAST(UnitPriceDiscount AS DECIMAL(6,2)) END AS UnitPriceDiscount,
	CASE WHEN  LineTotal = 'NULL' THEN -1 ELSE  CAST(LineTotal AS DECIMAL(10,2)) END AS LineTotal
FROM awp_stg1.Sales
	UNION
	SELECT DISTINCT
	CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
	CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
	CASE WHEN SalesOrderDetailID = 'NULL' THEN -1 ELSE SalesOrderDetailID END AS SalesOrderDetailID,
	CASE WHEN CarrierTrackingNumber = 'NULL' THEN 'N/A' ELSE CarrierTrackingNumber END AS CarrierTrackingNumber,
	CASE WHEN OrderQty = 'NULL' THEN -1 ELSE OrderQty END AS OrderQty,
	CASE WHEN ProductID1 = 'NULL' THEN -1 ELSE ProductID1 END AS ProductID,
	CASE WHEN SpecialOfferID1 = 'NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID,
	CASE WHEN  UnitPrice = 'NULL' THEN -1 ELSE  CAST(UnitPrice AS DECIMAL(10,2)) END AS UnitPrice,
	CASE WHEN UnitPriceDiscount = 'NULL' THEN -1 ELSE  CAST(UnitPriceDiscount AS DECIMAL(6,2)) END AS UnitPriceDiscount,
	CASE WHEN  LineTotal = 'NULL' THEN -1 ELSE  CAST(LineTotal AS DECIMAL(10,2)) END AS LineTotal
FROM awp_stg1.Sales_April_1_10
	UNION
	SELECT DISTINCT
	CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
	CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
	CASE WHEN SalesOrderDetailID = 'NULL' THEN -1 ELSE SalesOrderDetailID END AS SalesOrderDetailID,
	CASE WHEN CarrierTrackingNumber = 'NULL' THEN 'N/A' ELSE CarrierTrackingNumber END AS CarrierTrackingNumber,
	CASE WHEN OrderQty = 'NULL' THEN -1 ELSE OrderQty END AS OrderQty,
	CASE WHEN ProductID1 = 'NULL' THEN -1 ELSE ProductID1 END AS ProductID,
	CASE WHEN SpecialOfferID1 = 'NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID,
	CASE WHEN  UnitPrice = 'NULL' THEN -1 ELSE  CAST(UnitPrice AS DECIMAL(10,2)) END AS UnitPrice,
	CASE WHEN UnitPriceDiscount = 'NULL' THEN -1 ELSE  CAST(UnitPriceDiscount AS DECIMAL(6,2)) END AS UnitPriceDiscount,
	CASE WHEN  LineTotal = 'NULL' THEN -1 ELSE  CAST(LineTotal AS DECIMAL(10,2)) END AS LineTotal
FROM awp_stg1.Sales_April_1_10_2
	UNION
	SELECT DISTINCT
	CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
	CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
	CASE WHEN SalesOrderDetailID = 'NULL' THEN -1 ELSE SalesOrderDetailID END AS SalesOrderDetailID,
	CASE WHEN CarrierTrackingNumber = 'NULL' THEN 'N/A' ELSE CarrierTrackingNumber END AS CarrierTrackingNumber,
	CASE WHEN OrderQty = 'NULL' THEN -1 ELSE OrderQty END AS OrderQty,
	CASE WHEN ProductID1 = 'NULL' THEN -1 ELSE ProductID1 END AS ProductID,
	CASE WHEN SpecialOfferID1 = 'NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID,
	CASE WHEN  UnitPrice = 'NULL' THEN -1 ELSE  CAST(UnitPrice AS DECIMAL(10,2)) END AS UnitPrice,
	CASE WHEN UnitPriceDiscount = 'NULL' THEN -1 ELSE  CAST(UnitPriceDiscount AS DECIMAL(6,2)) END AS UnitPriceDiscount,
	CASE WHEN  LineTotal = 'NULL' THEN -1 ELSE  CAST(LineTotal AS DECIMAL(10,2)) END AS LineTotal
FROM awp_stg1.Sales_April_11_20
	UNION
	SELECT DISTINCT
	CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
	CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
	CASE WHEN SalesOrderDetailID = 'NULL' THEN -1 ELSE SalesOrderDetailID END AS SalesOrderDetailID,
	CASE WHEN CarrierTrackingNumber = 'NULL' THEN 'N/A' ELSE CarrierTrackingNumber END AS CarrierTrackingNumber,
	CASE WHEN OrderQty = 'NULL' THEN -1 ELSE OrderQty END AS OrderQty,
	CASE WHEN ProductID1 = 'NULL' THEN -1 ELSE ProductID1 END AS ProductID,
	CASE WHEN SpecialOfferID1 = 'NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID,
	CASE WHEN  UnitPrice = 'NULL' THEN -1 ELSE  CAST(UnitPrice AS DECIMAL(10,2)) END AS UnitPrice,
	CASE WHEN UnitPriceDiscount = 'NULL' THEN -1 ELSE  CAST(UnitPriceDiscount AS DECIMAL(6,2)) END AS UnitPriceDiscount,
	CASE WHEN  LineTotal = 'NULL' THEN -1 ELSE  CAST(LineTotal AS DECIMAL(10,2)) END AS LineTotal
FROM awp_stg1.Sales_April_21_30
	UNION
	SELECT DISTINCT
	CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
	CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
	CASE WHEN SalesOrderDetailID = 'NULL' THEN -1 ELSE SalesOrderDetailID END AS SalesOrderDetailID,
	CASE WHEN CarrierTrackingNumber = 'NULL' THEN 'N/A' ELSE CarrierTrackingNumber END AS CarrierTrackingNumber,
	CASE WHEN OrderQty = 'NULL' THEN -1 ELSE OrderQty END AS OrderQty,
	CASE WHEN ProductID1 = 'NULL' THEN -1 ELSE ProductID1 END AS ProductID,
	CASE WHEN SpecialOfferID1 = 'NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID,
	CASE WHEN  UnitPrice = 'NULL' THEN -1 ELSE  CAST(UnitPrice AS DECIMAL(10,2)) END AS UnitPrice,
	CASE WHEN UnitPriceDiscount = 'NULL' THEN -1 ELSE  CAST(UnitPriceDiscount AS DECIMAL(6,2)) END AS UnitPriceDiscount,
	CASE WHEN  LineTotal = 'NULL' THEN -1 ELSE  CAST(LineTotal AS DECIMAL(10,2)) END AS LineTotal
FROM awp_stg1.Sales_May_06_10
	UNION
	SELECT DISTINCT
	CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
	CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
	CASE WHEN SalesOrderDetailID = 'NULL' THEN -1 ELSE SalesOrderDetailID END AS SalesOrderDetailID,
	CASE WHEN CarrierTrackingNumber = 'NULL' THEN 'N/A' ELSE CarrierTrackingNumber END AS CarrierTrackingNumber,
	CASE WHEN OrderQty = 'NULL' THEN -1 ELSE OrderQty END AS OrderQty,
	CASE WHEN ProductID1 = 'NULL' THEN -1 ELSE ProductID1 END AS ProductID,
	CASE WHEN SpecialOfferID1 = 'NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID,
	CASE WHEN  UnitPrice = 'NULL' THEN -1 ELSE  CAST(UnitPrice AS DECIMAL(10,2)) END AS UnitPrice,
	CASE WHEN UnitPriceDiscount = 'NULL' THEN -1 ELSE  CAST(UnitPriceDiscount AS DECIMAL(6,2)) END AS UnitPriceDiscount,
	CASE WHEN  LineTotal = 'NULL' THEN -1 ELSE  CAST(LineTotal AS DECIMAL(10,2)) END AS LineTotal
FROM awp_stg1.Sales_May_11_20
	UNION
	SELECT DISTINCT
	CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
	CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
	CASE WHEN SalesOrderDetailID = 'NULL' THEN -1 ELSE SalesOrderDetailID END AS SalesOrderDetailID,
	CASE WHEN CarrierTrackingNumber = 'NULL' THEN 'N/A' ELSE CarrierTrackingNumber END AS CarrierTrackingNumber,
	CASE WHEN OrderQty = 'NULL' THEN -1 ELSE OrderQty END AS OrderQty,
	CASE WHEN ProductID1 = 'NULL' THEN -1 ELSE ProductID1 END AS ProductID,
	CASE WHEN SpecialOfferID1 = 'NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID,
	CASE WHEN  UnitPrice = 'NULL' THEN -1 ELSE  CAST(UnitPrice AS DECIMAL(10,2)) END AS UnitPrice,
	CASE WHEN UnitPriceDiscount = 'NULL' THEN -1 ELSE  CAST(UnitPriceDiscount AS DECIMAL(6,2)) END AS UnitPriceDiscount,
	CASE WHEN  LineTotal = 'NULL' THEN -1 ELSE  CAST(LineTotal AS DECIMAL(10,2)) END AS LineTotal
FROM awp_stg1.Sales_May_21_31
	UNION
	SELECT DISTINCT
	CASE WHEN BusinessEntityID = 'NULL' THEN -1 ELSE BusinessEntityID END AS BusinessEntityID,
	CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
	CASE WHEN SalesOrderDetailID1 = 'NULL' THEN -1 ELSE SalesOrderDetailID1 END AS SalesOrderDetailID,
	CASE WHEN CarrierTrackingNumber1 = 'NULL' THEN 'N/A' ELSE CarrierTrackingNumber1 END AS CarrierTrackingNumber,
	CASE WHEN OrderQty1 = 'NULL' THEN -1 ELSE OrderQty1 END AS OrderQty,
	CASE WHEN ProductID1 = 'NULL' THEN -1 ELSE ProductID1 END AS ProductID,
	CASE WHEN SpecialOfferID1 = 'NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID,
	CASE WHEN  UnitPrice1 = 'NULL' THEN -1 ELSE  CAST(UnitPrice1 AS DECIMAL(10,2)) END AS UnitPrice,
	CASE WHEN UnitPriceDiscount1 = 'NULL' THEN -1 ELSE  CAST(UnitPriceDiscount1 AS DECIMAL(6,2)) END AS UnitPriceDiscount,
	CASE WHEN  LineTotal = 'NULL' THEN -1 ELSE  CAST(LineTotal AS DECIMAL(10,2)) END AS LineTotal
FROM awp_stg1.Sales_3_New;








INSERT INTO awp_stg2.Sales_SalesOrderHeader (BusinessEntityID, SalesOrderID, ShipMethodID, SalesPersonID, RevisionNumber, OrderDate, DueDate, ShipDate, Status, OnlineOrderFlag, SalesOrderNumber, PurchaseOrderNumber, AccountNumber, TerritoryID, BillToAddressID, ShipToAddressID, CreditCardID, CreditCardApprovalCode, CurrencyRateID, SubTotal, TaxAmt, Freight, TotalDue)
SELECT DISTINCT
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
CASE WHEN ShipMethodID = 'NULL' THEN -1 ELSE ShipMethodID END AS ShipMethodID,
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS SalesPersonID,
CASE WHEN RevisionNumber = 'NULL' THEN -1 ELSE RevisionNumber END AS RevisionNumber,
CASE WHEN OrderDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(OrderDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS OrderDate,
CASE WHEN DueDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(DueDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS DueDate,
CASE WHEN ShipDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(ShipDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS ShipDate,
CASE WHEN Status = 'NULL' THEN -1 ELSE CAST(Status AS INTEGER) END AS Status,
CASE WHEN OnlineOrderFlag = 'NULL' THEN -1 ELSE CAST(OnlineOrderFlag AS INTEGER) END AS OnlineOrderFlag,
CASE WHEN SalesOrderNumber IS NULL THEN 'N/A' ELSE SalesOrderNumber END AS SalesOrderNumber,
CASE WHEN PurchaseOrderNumber IS NULL THEN 'N/A' ELSE PurchaseOrderNumber END AS PurchaseOrderNumber,
CASE WHEN AccountNumber= 'NULL' THEN 'N/A' ELSE AccountNumber END AS AccountNumber,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN BillToAddressID = 'NULL' THEN -1 ELSE BillToAddressID END AS BillToAddressID,
CASE WHEN ShipToAddressID = 'NULL' THEN -1 ELSE ShipToAddressID END AS ShipToAddressID,
CASE WHEN CreditCardID1 = 'NULL' THEN -1 ELSE CreditCardID1 END AS CreditCardID1,
CASE WHEN CreditCardApprovalCode IS NULL THEN 'N/A' ELSE CreditCardApprovalCode END AS CreditCardApprovalCode,
CASE WHEN CurrencyRateID1 = 'NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID1,
CASE WHEN SubTotal = 'NULL' THEN -1 ELSE  CAST(SubTotal AS DECIMAL(10,2)) END AS SubTotal,
CASE WHEN TaxAmt = 'NULL' THEN -1 ELSE  CAST(TaxAmt AS DECIMAL(10,2)) END AS TaxAmt,
CASE WHEN Freight = 'NULL' THEN -1 ELSE  CAST(Freight AS DECIMAL(10,2)) END AS Freight,
CASE WHEN TotalDue = 'NULL' THEN -1 ELSE  CAST(TotalDue AS DECIMAL(10,2)) END AS TotalDue
FROM awp_stg1.Sales
UNION
--Sales_April_1_10

--INSERT INTO awp_stg2.SalesOrderHeader
SELECT DISTINCT
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
CASE WHEN ShipMethodID = 'NULL' THEN -1 ELSE ShipMethodID END AS ShipMethodID,
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS SalesPersonID,
CASE WHEN RevisionNumber = 'NULL' THEN -1 ELSE RevisionNumber END AS RevisionNumber,
CASE WHEN OrderDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(OrderDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS OrderDate,
CASE WHEN DueDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(DueDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS DueDate,
CASE WHEN ShipDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(ShipDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS ShipDate,
CASE WHEN Status = 'NULL' THEN -1 ELSE CAST(Status AS INTEGER) END AS Status,
CASE WHEN OnlineOrderFlag = 'NULL' THEN -1 ELSE CAST(OnlineOrderFlag AS INTEGER) END AS OnlineOrderFlag,
CASE WHEN SalesOrderNumber IS NULL THEN 'N/A' ELSE SalesOrderNumber END AS SalesOrderNumber,
CASE WHEN PurchaseOrderNumber IS NULL THEN 'N/A' ELSE PurchaseOrderNumber END AS PurchaseOrderNumber,
CASE WHEN AccountNumber= 'NULL' THEN 'N/A' ELSE AccountNumber END AS AccountNumber,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN BillToAddressID = 'NULL' THEN -1 ELSE BillToAddressID END AS BillToAddressID,
CASE WHEN ShipToAddressID = 'NULL' THEN -1 ELSE ShipToAddressID END AS ShipToAddressID,
CASE WHEN CreditCardID1 = 'NULL' THEN -1 ELSE CreditCardID1 END AS CreditCardID1,
CASE WHEN CreditCardApprovalCode IS NULL THEN 'N/A' ELSE CreditCardApprovalCode END AS CreditCardApprovalCode,
CASE WHEN CurrencyRateID1 = 'NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID1,
CASE WHEN  SubTotal = 'NULL' THEN -1 ELSE  CAST(SubTotal AS DECIMAL(10,2)) END AS SubTotal,
CASE WHEN  TaxAmt = 'NULL' THEN -1 ELSE  CAST(TaxAmt AS DECIMAL(10,2)) END AS TaxAmt,
CASE WHEN  Freight = 'NULL' THEN -1 ELSE  CAST(Freight AS DECIMAL(10,2)) END AS Freight,
CASE WHEN  TotalDue = 'NULL' THEN -1 ELSE  CAST(TotalDue AS DECIMAL(10,2)) END AS TotalDue
FROM awp_stg1.Sales_April_1_10
UNION
--Sales_April_1_10_2

--INSERT INTO awp_stg2.SalesOrderHeader
SELECT DISTINCT
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
CASE WHEN ShipMethodID = 'NULL' THEN -1 ELSE ShipMethodID END AS ShipMethodID,
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS SalesPersonID,
CASE WHEN RevisionNumber = 'NULL' THEN -1 ELSE RevisionNumber END AS RevisionNumber,
CASE WHEN OrderDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(OrderDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS OrderDate,
CASE WHEN DueDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(DueDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS DueDate,
CASE WHEN ShipDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(ShipDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS ShipDate,
CASE WHEN Status = 'NULL' THEN -1 ELSE CAST(Status AS INTEGER) END AS Status,
CASE WHEN OnlineOrderFlag = 'NULL' THEN -1 ELSE CAST(OnlineOrderFlag AS INTEGER) END AS OnlineOrderFlag,
CASE WHEN SalesOrderNumber IS NULL THEN 'N/A' ELSE SalesOrderNumber END AS SalesOrderNumber,
CASE WHEN PurchaseOrderNumber IS NULL THEN 'N/A' ELSE PurchaseOrderNumber END AS PurchaseOrderNumber,
CASE WHEN AccountNumber= 'NULL' THEN 'N/A' ELSE AccountNumber END AS AccountNumber,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN BillToAddressID = 'NULL' THEN -1 ELSE BillToAddressID END AS BillToAddressID,
CASE WHEN ShipToAddressID = 'NULL' THEN -1 ELSE ShipToAddressID END AS ShipToAddressID,
CASE WHEN CreditCardID1 = 'NULL' THEN -1 ELSE CreditCardID1 END AS CreditCardID1,
CASE WHEN CreditCardApprovalCode IS NULL THEN 'N/A' ELSE CreditCardApprovalCode END AS CreditCardApprovalCode,
CASE WHEN CurrencyRateID1 = 'NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID1,
CASE WHEN  SubTotal = 'NULL' THEN -1 ELSE  CAST(SubTotal AS DECIMAL(10,2)) END AS SubTotal,
CASE WHEN  TaxAmt = 'NULL' THEN -1 ELSE  CAST(TaxAmt AS DECIMAL(10,2)) END AS TaxAmt,
CASE WHEN  Freight = 'NULL' THEN -1 ELSE  CAST(Freight AS DECIMAL(10,2)) END AS Freight,
CASE WHEN  TotalDue = 'NULL' THEN -1 ELSE  CAST(TotalDue AS DECIMAL(10,2)) END AS TotalDue
FROM awp_stg1.Sales_April_1_10_2
UNION
-- Sales_April_11_20

--INSERT INTO awp_stg2.SalesOrderHeader
SELECT DISTINCT
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
CASE WHEN ShipMethodID = 'NULL' THEN -1 ELSE ShipMethodID END AS ShipMethodID,
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS SalesPersonID,
CASE WHEN RevisionNumber = 'NULL' THEN -1 ELSE RevisionNumber END AS RevisionNumber,
CASE WHEN OrderDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(OrderDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS OrderDate,
CASE WHEN DueDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(DueDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS DueDate,
CASE WHEN ShipDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(ShipDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS ShipDate,
CASE WHEN Status = 'NULL' THEN -1 ELSE CAST(Status AS INTEGER) END AS Status,
CASE WHEN OnlineOrderFlag = 'NULL' THEN -1 ELSE CAST(OnlineOrderFlag AS INTEGER) END AS OnlineOrderFlag,
CASE WHEN SalesOrderNumber IS NULL THEN 'N/A' ELSE SalesOrderNumber END AS SalesOrderNumber,
CASE WHEN PurchaseOrderNumber IS NULL THEN 'N/A' ELSE PurchaseOrderNumber END AS PurchaseOrderNumber,
CASE WHEN AccountNumber= 'NULL' THEN 'N/A' ELSE AccountNumber END AS AccountNumber,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN BillToAddressID = 'NULL' THEN -1 ELSE BillToAddressID END AS BillToAddressID,
CASE WHEN ShipToAddressID = 'NULL' THEN -1 ELSE ShipToAddressID END AS ShipToAddressID,
CASE WHEN CreditCardID1 = 'NULL' THEN -1 ELSE CreditCardID1 END AS CreditCardID1,
CASE WHEN CreditCardApprovalCode IS NULL THEN 'N/A' ELSE CreditCardApprovalCode END AS CreditCardApprovalCode,
CASE WHEN CurrencyRateID1 = 'NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID,
CASE WHEN  SubTotal = 'NULL' THEN -1 ELSE  CAST(SubTotal AS DECIMAL(10,2)) END AS SubTotal,
CASE WHEN  TaxAmt = 'NULL' THEN -1 ELSE  CAST(TaxAmt AS DECIMAL(10,2)) END AS TaxAmt,
CASE WHEN  Freight = 'NULL' THEN -1 ELSE  CAST(Freight AS DECIMAL(10,2)) END AS Freight,
CASE WHEN  TotalDue = 'NULL' THEN -1 ELSE  CAST(TotalDue AS DECIMAL(10,2)) END AS TotalDue
FROM awp_stg1.Sales_April_11_20
UNION
--Sales_April_21_30

SELECT DISTINCT
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
CASE WHEN ShipMethodID = 'NULL' THEN -1 ELSE ShipMethodID END AS ShipMethodID,
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS SalesPersonID,
CASE WHEN RevisionNumber = 'NULL' THEN -1 ELSE RevisionNumber END AS RevisionNumber,
CASE WHEN OrderDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(OrderDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS OrderDate,
CASE WHEN DueDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(DueDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS DueDate,
CASE WHEN ShipDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(ShipDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS ShipDate,
CASE WHEN Status = 'NULL' THEN -1 ELSE CAST(Status AS INTEGER) END AS Status,
CASE WHEN OnlineOrderFlag = 'NULL' THEN -1 ELSE CAST(OnlineOrderFlag AS INTEGER) END AS OnlineOrderFlag,
CASE WHEN SalesOrderNumber IS NULL THEN 'N/A' ELSE SalesOrderNumber END AS SalesOrderNumber,
CASE WHEN PurchaseOrderNumber IS NULL THEN 'N/A' ELSE PurchaseOrderNumber END AS PurchaseOrderNumber,
CASE WHEN AccountNumber= 'NULL' THEN 'N/A' ELSE AccountNumber END AS AccountNumber,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN BillToAddressID = 'NULL' THEN -1 ELSE BillToAddressID END AS BillToAddressID,
CASE WHEN ShipToAddressID = 'NULL' THEN -1 ELSE ShipToAddressID END AS ShipToAddressID,
CASE WHEN CreditCardID1 = 'NULL' THEN -1 ELSE CreditCardID1 END AS CreditCardID1,
CASE WHEN CreditCardApprovalCode IS NULL THEN 'N/A' ELSE CreditCardApprovalCode END AS CreditCardApprovalCode,
CASE WHEN CurrencyRateID1 = 'NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID,
CASE WHEN  SubTotal = 'NULL' THEN -1 ELSE  CAST(SubTotal AS DECIMAL(10,2)) END AS SubTotal,
CASE WHEN  TaxAmt = 'NULL' THEN -1 ELSE  CAST(TaxAmt AS DECIMAL(10,2)) END AS TaxAmt,
CASE WHEN  Freight = 'NULL' THEN -1 ELSE  CAST(Freight AS DECIMAL(10,2)) END AS Freight,
CASE WHEN  TotalDue = 'NULL' THEN -1 ELSE  CAST(TotalDue AS DECIMAL(10,2)) END AS TotalDue
FROM awp_stg1.Sales_April_21_30
UNION
--Sales_May_06_10

SELECT DISTINCT
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
CASE WHEN ShipMethodID = 'NULL' THEN -1 ELSE ShipMethodID END AS ShipMethodID,
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS SalesPersonID,
CASE WHEN RevisionNumber = 'NULL' THEN -1 ELSE RevisionNumber END AS RevisionNumber,
CASE WHEN OrderDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(OrderDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS OrderDate,
CASE WHEN DueDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(DueDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS DueDate,
CASE WHEN ShipDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(ShipDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS ShipDate,
CASE WHEN Status = 'NULL' THEN -1 ELSE CAST(Status AS INTEGER) END AS Status,
CASE WHEN OnlineOrderFlag = 'NULL' THEN -1 ELSE CAST(OnlineOrderFlag AS INTEGER) END AS OnlineOrderFlag,
CASE WHEN SalesOrderNumber IS NULL THEN 'N/A' ELSE SalesOrderNumber END AS SalesOrderNumber,
CASE WHEN PurchaseOrderNumber IS NULL THEN 'N/A' ELSE PurchaseOrderNumber END AS PurchaseOrderNumber,
CASE WHEN AccountNumber= 'NULL' THEN 'N/A' ELSE AccountNumber END AS AccountNumber,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN BillToAddressID = 'NULL' THEN -1 ELSE BillToAddressID END AS BillToAddressID,
CASE WHEN ShipToAddressID = 'NULL' THEN -1 ELSE ShipToAddressID END AS ShipToAddressID,
CASE WHEN CreditCardID1 = 'NULL' THEN -1 ELSE CreditCardID1 END AS CreditCardID1,
CASE WHEN CreditCardApprovalCode IS NULL THEN 'N/A' ELSE CreditCardApprovalCode END AS CreditCardApprovalCode,
CASE WHEN CurrencyRateID1 = 'NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID,
CASE WHEN  SubTotal = 'NULL' THEN -1 ELSE  CAST(SubTotal AS DECIMAL(10,2)) END AS SubTotal,
CASE WHEN  TaxAmt = 'NULL' THEN -1 ELSE  CAST(TaxAmt AS DECIMAL(10,2)) END AS TaxAmt,
CASE WHEN  Freight = 'NULL' THEN -1 ELSE  CAST(Freight AS DECIMAL(10,2)) END AS Freight,
CASE WHEN  TotalDue = 'NULL' THEN -1 ELSE  CAST(TotalDue AS DECIMAL(10,2)) END AS TotalDue
FROM awp_stg1.Sales_May_06_10
UNION

--Sales_May_11_20
SELECT DISTINCT
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
CASE WHEN ShipMethodID = 'NULL' THEN -1 ELSE ShipMethodID END AS ShipMethodID,
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS SalesPersonID,
CASE WHEN RevisionNumber = 'NULL' THEN -1 ELSE RevisionNumber END AS RevisionNumber,
CASE WHEN OrderDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(OrderDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS OrderDate,
CASE WHEN DueDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(DueDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS DueDate,
CASE WHEN ShipDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(ShipDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS ShipDate,
CASE WHEN Status = 'NULL' THEN -1 ELSE CAST(Status AS INTEGER) END AS Status,
CASE WHEN OnlineOrderFlag = 'NULL' THEN -1 ELSE CAST(OnlineOrderFlag AS INTEGER) END AS OnlineOrderFlag,
CASE WHEN SalesOrderNumber IS NULL THEN 'N/A' ELSE SalesOrderNumber END AS SalesOrderNumber,
CASE WHEN PurchaseOrderNumber IS NULL THEN 'N/A' ELSE PurchaseOrderNumber END AS PurchaseOrderNumber,
CASE WHEN AccountNumber= 'NULL' THEN 'N/A' ELSE AccountNumber END AS AccountNumber,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN BillToAddressID = 'NULL' THEN -1 ELSE BillToAddressID END AS BillToAddressID,
CASE WHEN ShipToAddressID = 'NULL' THEN -1 ELSE ShipToAddressID END AS ShipToAddressID,
CASE WHEN CreditCardID1 = 'NULL' THEN -1 ELSE CreditCardID1 END AS CreditCardID1,
CASE WHEN CreditCardApprovalCode IS NULL THEN 'N/A' ELSE CreditCardApprovalCode END AS CreditCardApprovalCode,
CASE WHEN CurrencyRateID1 = 'NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID,
CASE WHEN  SubTotal = 'NULL' THEN -1 ELSE  CAST(SubTotal AS DECIMAL(10,2)) END AS SubTotal,
CASE WHEN  TaxAmt = 'NULL' THEN -1 ELSE  CAST(TaxAmt AS DECIMAL(10,2)) END AS TaxAmt,
CASE WHEN  Freight = 'NULL' THEN -1 ELSE  CAST(Freight AS DECIMAL(10,2)) END AS Freight,
CASE WHEN  TotalDue = 'NULL' THEN -1 ELSE  CAST(TotalDue AS DECIMAL(10,2)) END AS TotalDue
FROM awp_stg1.Sales_May_11_20
UNION

--Sales_May_21_31
SELECT DISTINCT
CASE WHEN BusinessEntityID1 = 'NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
CASE WHEN ShipMethodID = 'NULL' THEN -1 ELSE ShipMethodID END AS ShipMethodID,
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS SalesPersonID,
CASE WHEN RevisionNumber = 'NULL' THEN -1 ELSE RevisionNumber END AS RevisionNumber,
CASE WHEN OrderDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(OrderDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS OrderDate,
CASE WHEN DueDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(DueDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS DueDate,
CASE WHEN ShipDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(ShipDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS ShipDate,
CASE WHEN Status = 'NULL' THEN -1 ELSE CAST(Status AS INTEGER) END AS Status,
CASE WHEN OnlineOrderFlag = 'NULL' THEN -1 ELSE CAST(OnlineOrderFlag AS INTEGER) END AS OnlineOrderFlag,
CASE WHEN SalesOrderNumber IS NULL THEN 'N/A' ELSE SalesOrderNumber END AS SalesOrderNumber,
CASE WHEN PurchaseOrderNumber IS NULL THEN 'N/A' ELSE PurchaseOrderNumber END AS PurchaseOrderNumber,
CASE WHEN AccountNumber= 'NULL' THEN 'N/A' ELSE AccountNumber END AS AccountNumber,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN BillToAddressID = 'NULL' THEN -1 ELSE BillToAddressID END AS BillToAddressID,
CASE WHEN ShipToAddressID = 'NULL' THEN -1 ELSE ShipToAddressID END AS ShipToAddressID,
CASE WHEN CreditCardID1 = 'NULL' THEN -1 ELSE CreditCardID1 END AS CreditCardID1,
CASE WHEN CreditCardApprovalCode IS NULL THEN 'N/A' ELSE CreditCardApprovalCode END AS CreditCardApprovalCode,
CASE WHEN CurrencyRateID1 = 'NULL' THEN -1 ELSE CurrencyRateID1 END AS CurrencyRateID2,
CASE WHEN  SubTotal = 'NULL' THEN -1 ELSE  CAST(SubTotal AS DECIMAL(10,2)) END AS SubTotal,
CASE WHEN  TaxAmt = 'NULL' THEN -1 ELSE  CAST(TaxAmt AS DECIMAL(10,2)) END AS TaxAmt,
CASE WHEN  Freight = 'NULL' THEN -1 ELSE  CAST(Freight AS DECIMAL(10,2)) END AS Freight,
CASE WHEN  TotalDue = 'NULL' THEN -1 ELSE  CAST(TotalDue AS DECIMAL(10,2)) END AS TotalDue
FROM awp_stg1.Sales_May_21_31

UNION

SELECT DISTINCT
CASE WHEN BusinessEntityID = 'NULL' THEN -1 ELSE BusinessEntityID END AS BusinessEntityID,
CASE WHEN SalesOrderID1 = 'NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID1,
CASE WHEN ShipMethodID = 'NULL' THEN -1 ELSE ShipMethodID END AS ShipMethodID,
CASE WHEN SalesPersonID2 = 'NULL' THEN -1 ELSE SalesPersonID2 END AS SalesPersonID,
CASE WHEN RevisionNumber1 = 'NULL' THEN -1 ELSE RevisionNumber1 END AS RevisionNumber,
CASE WHEN OrderDate = 'NULL' THEN CAST('01/01/1900' AS DATE FORMAT 'MM/DD/YYYY') ELSE CAST(SUBSTR(OrderDate,1,10) AS DATE FORMAT 'MM/DD/YYYY') END AS OrderDate,
CASE WHEN DueDate = 'NULL' THEN CAST('01/01/1900' AS DATE FORMAT 'MM/DD/YYYY') ELSE CAST(SUBSTR(DueDate,1,10) AS DATE FORMAT 'MM/DD/YYYY') END AS DueDate,
CASE WHEN ShipDate = 'NULL' THEN CAST('01/01/1900' AS DATE FORMAT 'MM/DD/YYYY') ELSE CAST(SUBSTR(ShipDate,1,10) AS DATE FORMAT 'MM/DD/YYYY') END AS ShipDate,
CASE WHEN Status = 'NULL' THEN -1 ELSE CAST(Status AS INTEGER) END AS Status,
CASE WHEN OnlineOrderFlag = 'NULL' THEN -1 ELSE CAST(OnlineOrderFlag AS INTEGER) END AS OnlineOrderFlag,
CASE WHEN SalesOrderNumber1 IS NULL THEN 'N/A' ELSE SalesOrderNumber1 END AS SalesOrderNumber,
CASE WHEN PurchaseOrderNumber1 IS NULL THEN 'N/A' ELSE PurchaseOrderNumber1 END AS PurchaseOrderNumber,
CASE WHEN AccountNumber= 'NULL' THEN 'N/A' ELSE AccountNumber END AS AccountNumber,
CASE WHEN TerritoryID = 'NULL' THEN -1 ELSE TerritoryID END AS TerritoryID1,
CASE WHEN BillToAddressID = 'NULL' THEN -1 ELSE BillToAddressID END AS BillToAddressID,
CASE WHEN ShipToAddressID = 'NULL' THEN -1 ELSE ShipToAddressID END AS ShipToAddressID,
CASE WHEN CreditCardID = 'NULL' THEN -1 ELSE CreditCardID END AS CreditCardID,
CASE WHEN CreditCardApprovalCode IS NULL THEN 'N/A' ELSE CreditCardApprovalCode END AS CreditCardApprovalCode,
CASE WHEN CurrencyRateID = 'NULL' THEN -1 ELSE CurrencyRateID END AS CurrencyRateID2,
CASE WHEN SubTotal = 'NULL' THEN -1 ELSE  CAST(SubTotal AS DECIMAL(10,2)) END AS SubTotal,
CASE WHEN TaxAmt = 'NULL' THEN -1 ELSE  CAST(TaxAmt AS DECIMAL(10,2)) END AS TaxAmt,
CASE WHEN Freight = 'NULL' THEN -1 ELSE  CAST(Freight AS DECIMAL(10,2)) END AS Freight,
CASE WHEN TotalDue = 'NULL' THEN -1 ELSE  CAST(TotalDue AS DECIMAL(10,2)) END AS TotalDue
FROM awp_stg1.Sales_2;








INSERT INTO awp_stg2.Sales_SalesOrderHeaderSalesReason
SELECT DISTINCT 
    CASE WHEN BusinessEntityID1 ='NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
    CASE WHEN SalesOrderID1 ='NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID,
	CASE WHEN SalesReasonID1 ='NULL' THEN -1 ELSE SalesReasonID1 END AS SalesReasonID
FROM awp_stg1.Sales
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1 ='NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
    CASE WHEN SalesOrderID1 ='NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID,
	CASE WHEN SalesReasonID1 ='NULL' THEN -1 ELSE SalesReasonID1 END AS SalesReasonID
FROM awp_stg1.Sales_April_1_10
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1 ='NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
    CASE WHEN SalesOrderID1 ='NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID,
	CASE WHEN SalesReasonID1 ='NULL' THEN -1 ELSE SalesReasonID1 END AS SalesReasonID
FROM awp_stg1.Sales_April_1_10_2
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1 ='NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
    CASE WHEN SalesOrderID1 ='NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID,
	CASE WHEN SalesReasonID1 ='NULL' THEN -1 ELSE SalesReasonID1 END AS SalesReasonID
FROM awp_stg1.Sales_April_11_20
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1 ='NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
    CASE WHEN SalesOrderID1 ='NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID,
	CASE WHEN SalesReasonID1 ='NULL' THEN -1 ELSE SalesReasonID1 END AS SalesReasonID
FROM awp_stg1.Sales_April_21_30
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1 ='NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
    CASE WHEN SalesOrderID1 ='NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID,
	CASE WHEN SalesReasonID1 ='NULL' THEN -1 ELSE SalesReasonID1 END AS SalesReasonID
FROM awp_stg1.Sales_May_06_10
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1 ='NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
    CASE WHEN SalesOrderID1 ='NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID,
	CASE WHEN SalesReasonID1 ='NULL' THEN -1 ELSE SalesReasonID1 END AS SalesReasonID
FROM awp_stg1.Sales_May_11_20
UNION
SELECT DISTINCT 
	CASE WHEN BusinessEntityID1 ='NULL' THEN -1 ELSE BusinessEntityID1 END AS BusinessEntityID1,
    CASE WHEN SalesOrderID1 ='NULL' THEN -1 ELSE SalesOrderID1 END AS SalesOrderID,
	CASE WHEN SalesReasonID1 ='NULL' THEN -1 ELSE SalesReasonID1 END AS SalesReasonID
FROM awp_stg1.Sales_May_21_31;







--Sales

INSERT INTO awp_stg2.Sales_SalesPerson
SELECT DISTINCT
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS BusinessEntityID2,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN  SalesQuota2 = 'NULL' THEN -1 ELSE  CAST(SalesQuota2 AS DECIMAL(10,2)) END AS SalesQuota,
CASE WHEN  Bonus = 'NULL' THEN -1 ELSE  CAST(Bonus AS DECIMAL(10,2)) END AS Bonus,
CASE WHEN  CommissionPct = 'NULL' THEN -1 ELSE  CAST(CommissionPct AS DECIMAL(10,2)) END AS CommissionPct,
CASE WHEN  SalesYTD2 = 'NULL' THEN -1 ELSE  CAST(SalesYTD2 AS DECIMAL(10,2)) END AS SalesYTD,
CASE WHEN  SalesLastYear1 = 'NULL' THEN -1 ELSE  CAST(SalesLastYear1 AS DECIMAL(10,2)) END AS SalesLastYear
FROM awp_stg1.Sales
UNION
--Sales_April_1_10
--INSERT INTO awp_stg2.SalesPerson
SELECT DISTINCT
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS BusinessEntityID2,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN  SalesQuota2 = 'NULL' THEN -1 ELSE  CAST(SalesQuota2 AS DECIMAL(10,2)) END AS SalesQuota2,
CASE WHEN  Bonus = 'NULL' THEN -1 ELSE  CAST(Bonus AS DECIMAL(10,2)) END AS Bonus,
CASE WHEN  CommissionPct = 'NULL' THEN -1 ELSE  CAST(CommissionPct AS DECIMAL(10,2)) END AS CommissionPct,
CASE WHEN  SalesYTD2 = 'NULL' THEN -1 ELSE  CAST(SalesYTD2 AS DECIMAL(10,2)) END AS SalesYTD,
CASE WHEN  SalesLastYear1 = 'NULL' THEN -1 ELSE  CAST(SalesLastYear1 AS DECIMAL(10,2)) END AS SalesLastYear
FROM awp_stg1.Sales_April_1_10
UNION
--Sales_April_1_10_2
--INSERT INTO awp_stg2.SalesPerson
SELECT DISTINCT
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS BusinessEntityID2,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN  SalesQuota2 = 'NULL' THEN -1 ELSE  CAST(SalesQuota2 AS DECIMAL(10,2)) END AS SalesQuota2,
CASE WHEN  Bonus = 'NULL' THEN -1 ELSE  CAST(Bonus AS DECIMAL(10,2)) END AS Bonus,
CASE WHEN  CommissionPct = 'NULL' THEN -1 ELSE  CAST(CommissionPct AS DECIMAL(10,2)) END AS CommissionPct,
CASE WHEN  SalesYTD2 = 'NULL' THEN -1 ELSE  CAST(SalesYTD2 AS DECIMAL(10,2)) END AS SalesYTD,
CASE WHEN  SalesLastYear1 = 'NULL' THEN -1 ELSE  CAST(SalesLastYear1 AS DECIMAL(10,2)) END AS SalesLastYear
FROM awp_stg1.Sales_April_1_10_2
UNION
--Sales_April_11_201
--INSERT INTO awp_stg2.SalesPerson
SELECT DISTINCT
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS BusinessEntityID2,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN  SalesQuota2 = 'NULL' THEN -1 ELSE  CAST(SalesQuota2 AS DECIMAL(10,2)) END AS SalesQuota2,
CASE WHEN  Bonus = 'NULL' THEN -1 ELSE  CAST(Bonus AS DECIMAL(10,2)) END AS Bonus,
CASE WHEN  CommissionPct = 'NULL' THEN -1 ELSE  CAST(CommissionPct AS DECIMAL(10,2)) END AS CommissionPct,
CASE WHEN  SalesYTD2 = 'NULL' THEN -1 ELSE  CAST(SalesYTD2 AS DECIMAL(10,2)) END AS SalesYTD,
CASE WHEN  SalesLastYear1 = 'NULL' THEN -1 ELSE  CAST(SalesLastYear1 AS DECIMAL(10,2)) END AS SalesLastYear
FROM awp_stg1.Sales_April_11_20
UNION
--Sales_April_21_30
--INSERT INTO awp_stg2.SalesPerson
SELECT DISTINCT
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS BusinessEntityID2,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN  SalesQuota2 = 'NULL' THEN -1 ELSE  CAST(SalesQuota2 AS DECIMAL(10,2)) END AS SalesQuota2,
CASE WHEN  Bonus = 'NULL' THEN -1 ELSE  CAST(Bonus AS DECIMAL(10,2)) END AS Bonus,
CASE WHEN  CommissionPct = 'NULL' THEN -1 ELSE  CAST(CommissionPct AS DECIMAL(10,2)) END AS CommissionPct,
CASE WHEN  SalesYTD2 = 'NULL' THEN -1 ELSE  CAST(SalesYTD2 AS DECIMAL(10,2)) END AS SalesYTD,
CASE WHEN  SalesLastYear1 = 'NULL' THEN -1 ELSE  CAST(SalesLastYear1 AS DECIMAL(10,2)) END AS SalesLastYear
FROM awp_stg1.Sales_April_21_30
UNION
--Sales_May_06_10
--INSERT INTO awp_stg2.SalesPerson
SELECT DISTINCT
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS BusinessEntityID2,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN  SalesQuota2 = 'NULL' THEN -1 ELSE  CAST(SalesQuota2 AS DECIMAL(10,2)) END AS SalesQuota,
CASE WHEN  Bonus = 'NULL' THEN -1 ELSE  CAST(Bonus AS DECIMAL(10,2)) END AS Bonus,
CASE WHEN  CommissionPct = 'NULL' THEN -1 ELSE  CAST(CommissionPct AS DECIMAL(10,2)) END AS CommissionPct,
CASE WHEN  SalesYTD2 = 'NULL' THEN -1 ELSE  CAST(SalesYTD2 AS DECIMAL(10,2)) END AS SalesYTD,
CASE WHEN  SalesLastYear1 = 'NULL' THEN -1 ELSE  CAST(SalesLastYear1 AS DECIMAL(10,2)) END AS SalesLastYear
FROM awp_stg1.Sales_May_06_10
UNION
--Sales_May_11_20
--INSERT INTO awp_stg2.SalesPerson
SELECT DISTINCT
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS BusinessEntityID2,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN  SalesQuota2 = 'NULL' THEN -1 ELSE  CAST(SalesQuota2 AS DECIMAL(10,2)) END AS SalesQuota,
CASE WHEN  Bonus = 'NULL' THEN -1 ELSE  CAST(Bonus AS DECIMAL(10,2)) END AS Bonus,
CASE WHEN  CommissionPct = 'NULL' THEN -1 ELSE  CAST(CommissionPct AS DECIMAL(10,2)) END AS CommissionPct,
CASE WHEN  SalesYTD2 = 'NULL' THEN -1 ELSE  CAST(SalesYTD2 AS DECIMAL(10,2)) END AS SalesYTD,
CASE WHEN  SalesLastYear1 = 'NULL' THEN -1 ELSE  CAST(SalesLastYear1 AS DECIMAL(10,2)) END AS SalesLastYear
FROM awp_stg1.Sales_May_11_20
UNION
--Sales_May_21_31
--INSERT INTO awp_stg2.SalesPerson
SELECT DISTINCT
CASE WHEN BusinessEntityID2 = 'NULL' THEN -1 ELSE BusinessEntityID2 END AS BusinessEntityID2,
CASE WHEN TerritoryID1 = 'NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID1,
CASE WHEN  SalesQuota2 = 'NULL' THEN -1 ELSE  CAST(SalesQuota2 AS DECIMAL(10,2)) END AS SalesQuota,
CASE WHEN  Bonus = 'NULL' THEN -1 ELSE  CAST(Bonus AS DECIMAL(10,2)) END AS Bonus,
CASE WHEN  CommissionPct = 'NULL' THEN -1 ELSE  CAST(CommissionPct AS DECIMAL(10,2)) END AS CommissionPct,
CASE WHEN  SalesYTD2 = 'NULL' THEN -1 ELSE  CAST(SalesYTD2 AS DECIMAL(10,2)) END AS SalesYTD,
CASE WHEN  SalesLastYear1 = 'NULL' THEN -1 ELSE  CAST(SalesLastYear1 AS DECIMAL(10,2)) END AS SalesLastYear
FROM awp_stg1.Sales_May_21_31;







INSERT INTO awp_stg2.Sales_SalesPersonQuotaHistory
SELECT DISTINCT 
    CASE WHEN  BusinessEntityID2 ='NULL' THEN -1 ELSE  BusinessEntityID2 END AS  BusinessEntityID,
    CASE WHEN  SalesQuota1 = 'NULL' THEN -1 ELSE  CAST(SalesQuota1 AS DECIMAL(10,2)) END AS SalesQuota,
	CASE WHEN QuotaDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(QuotaDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS QuotaDate
FROM awp_stg1.Sales
UNION
SELECT DISTINCT 
	CASE WHEN  BusinessEntityID2 ='NULL' THEN -1 ELSE  BusinessEntityID2 END AS  BusinessEntityID,
    CASE WHEN  SalesQuota1 = 'NULL' THEN -1 ELSE  CAST(SalesQuota1 AS DECIMAL(10,2)) END AS SalesQuota,
	CASE WHEN QuotaDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(QuotaDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS QuotaDate
FROM awp_stg1.Sales_April_1_10
UNION
SELECT DISTINCT 
	CASE WHEN  BusinessEntityID2 ='NULL' THEN -1 ELSE  BusinessEntityID2 END AS  BusinessEntityID,
    CASE WHEN  SalesQuota1 = 'NULL' THEN -1 ELSE  CAST(SalesQuota1 AS DECIMAL(10,2)) END AS SalesQuota,
	CASE WHEN QuotaDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(QuotaDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS QuotaDate
FROM awp_stg1.Sales_April_1_10_2
UNION
SELECT DISTINCT 
	CASE WHEN  BusinessEntityID2 ='NULL' THEN -1 ELSE  BusinessEntityID2 END AS  BusinessEntityID,
    CASE WHEN  SalesQuota1 = 'NULL' THEN -1 ELSE  CAST(SalesQuota1 AS DECIMAL(10,2)) END AS SalesQuota,
	CASE WHEN QuotaDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(QuotaDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS QuotaDate
FROM awp_stg1.Sales_April_11_20
UNION
SELECT DISTINCT 
CASE WHEN  BusinessEntityID2 ='NULL' THEN -1 ELSE  BusinessEntityID2 END AS  BusinessEntityID,
    CASE WHEN  SalesQuota1 = 'NULL' THEN -1 ELSE  CAST(SalesQuota1 AS DECIMAL(10,2)) END AS SalesQuota,
	CASE WHEN QuotaDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(QuotaDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS QuotaDate
FROM awp_stg1.Sales_April_21_30
UNION
SELECT DISTINCT 
	CASE WHEN  BusinessEntityID2 ='NULL' THEN -1 ELSE  BusinessEntityID2 END AS  BusinessEntityID,
    CASE WHEN  SalesQuota1 = 'NULL' THEN -1 ELSE  CAST(SalesQuota1 AS DECIMAL(10,2)) END AS SalesQuota,
	CASE WHEN QuotaDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(QuotaDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS QuotaDate
FROM awp_stg1.Sales_May_06_10
UNION
SELECT DISTINCT 
	CASE WHEN  BusinessEntityID2 ='NULL' THEN -1 ELSE  BusinessEntityID2 END AS  BusinessEntityID,
    CASE WHEN  SalesQuota1 = 'NULL' THEN -1 ELSE  CAST(SalesQuota1 AS DECIMAL(10,2)) END AS SalesQuota,
	CASE WHEN QuotaDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(QuotaDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS QuotaDate
FROM awp_stg1.Sales_May_11_20
UNION
SELECT DISTINCT 
	CASE WHEN  BusinessEntityID2 ='NULL' THEN -1 ELSE  BusinessEntityID2 END AS  BusinessEntityID,
    CASE WHEN  SalesQuota1 = 'NULL' THEN -1 ELSE  CAST(SalesQuota1 AS DECIMAL(10,2)) END AS SalesQuota,
	CASE WHEN QuotaDate = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(QuotaDate,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS QuotaDate
FROM awp_stg1.Sales_May_21_31;







INSERT INTO awp_stg2.Sales_SalesReason
SELECT DISTINCT 
	CASE WHEN SalesReasonID1 ='NULL' THEN -1 ELSE SalesReasonID1 END AS SalesReasonID,
	CASE WHEN Name1 = 'NULL' THEN 'N/A' ELSE Name1 END AS Name1,
	CASE WHEN ReasonType = 'NULL' THEN 'N/A' ELSE ReasonType END AS ReasonType
FROM awp_stg1.Sales;







INSERT INTO awp_stg2.Sales_SalesTerritory
SELECT DISTINCT 
    CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN Name3 ='NULL' THEN 'N/A' ELSE Name3 END AS Name3,
	CASE WHEN  CountryRegionCode ='NULL' THEN 'N/A' ELSE  CountryRegionCode END AS  CountryRegionCode,
	CASE WHEN Group1 ='NULL' THEN 'N/A' ELSE Group1 END AS Group1,
	CASE WHEN SalesYtd1 ='NULL' THEN -1 ELSE CAST(SalesYtd1 AS DECIMAL(15,2)) END AS SalesYtd,
	CASE WHEN SalesLastYear1 ='NULL' THEN -1 ELSE CAST(SalesLastYear1 AS DECIMAL(15,2)) END AS SalesLastYear,
	CASE WHEN CostYtd ='NULL' THEN -1 ELSE CAST(CostYtd AS DECIMAL(15,2)) END AS CostYtd,
	CASE WHEN CostLastYear ='NULL' THEN -1 ELSE CAST(CostLastYear AS DECIMAL(15,2)) END AS CostLastYear
FROM awp_stg1.Sales
UNION
SELECT DISTINCT 
	CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN Name3 ='NULL' THEN 'N/A' ELSE Name3 END AS Name1,
	CASE WHEN  CountryRegionCode ='NULL' THEN 'N/A' ELSE  CountryRegionCode END AS  CountryRegionCode,
	CASE WHEN Group1 ='NULL' THEN 'N/A' ELSE Group1 END AS Group1,
	CASE WHEN SalesYtd1 ='NULL' THEN -1 ELSE CAST(SalesYtd1 AS DECIMAL(15,2)) END AS SalesYtd,
	CASE WHEN SalesLastYear1 ='NULL' THEN -1 ELSE CAST(SalesLastYear1 AS DECIMAL(15,2)) END AS SalesLastYear,
	CASE WHEN CostYtd ='NULL' THEN -1 ELSE CAST(CostYtd AS DECIMAL(15,2)) END AS CostYtd,
	CASE WHEN CostLastYear ='NULL' THEN -1 ELSE CAST(CostLastYear AS DECIMAL(15,2)) END AS CostLastYear
FROM awp_stg1.Sales_April_1_10
UNION
SELECT DISTINCT 
	CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN Name3 ='NULL' THEN 'N/A' ELSE Name3 END AS Name1,
	CASE WHEN  CountryRegionCode ='NULL' THEN 'N/A' ELSE  CountryRegionCode END AS  CountryRegionCode,
	CASE WHEN Group1 ='NULL' THEN 'N/A' ELSE Group1 END AS Group1,
	CASE WHEN SalesYtd1 ='NULL' THEN -1 ELSE CAST(SalesYtd1 AS DECIMAL(15,2)) END AS SalesYtd,
	CASE WHEN SalesLastYear1 ='NULL' THEN -1 ELSE CAST(SalesLastYear1 AS DECIMAL(15,2)) END AS SalesLastYear,
	CASE WHEN CostYtd ='NULL' THEN -1 ELSE CAST(CostYtd AS DECIMAL(15,2)) END AS CostYtd,
	CASE WHEN CostLastYear ='NULL' THEN -1 ELSE CAST(CostLastYear AS DECIMAL(15,2)) END AS CostLastYear
FROM awp_stg1.Sales_April_1_10_2
UNION
SELECT DISTINCT 
	CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN Name3 ='NULL' THEN 'N/A' ELSE Name3 END AS Name1,
	CASE WHEN  CountryRegionCode ='NULL' THEN 'N/A' ELSE  CountryRegionCode END AS  CountryRegionCode,
	CASE WHEN Group1 ='NULL' THEN 'N/A' ELSE Group1 END AS Group1,
	CASE WHEN SalesYtd1 ='NULL' THEN -1 ELSE CAST(SalesYtd1 AS DECIMAL(15,2)) END AS SalesYtd,
	CASE WHEN SalesLastYear1 ='NULL' THEN -1 ELSE CAST(SalesLastYear1 AS DECIMAL(15,2)) END AS SalesLastYear,
	CASE WHEN CostYtd ='NULL' THEN -1 ELSE CAST(CostYtd AS DECIMAL(15,2)) END AS CostYtd,
	CASE WHEN CostLastYear ='NULL' THEN -1 ELSE CAST(CostLastYear AS DECIMAL(15,2)) END AS CostLastYear
FROM awp_stg1.Sales_April_11_20
UNION
SELECT DISTINCT 
	CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN Name3 ='NULL' THEN 'N/A' ELSE Name3 END AS Name1,
	CASE WHEN  CountryRegionCode ='NULL' THEN 'N/A' ELSE  CountryRegionCode END AS  CountryRegionCode,
	CASE WHEN Group1 ='NULL' THEN 'N/A' ELSE Group1 END AS Group1,
	CASE WHEN SalesYtd1 ='NULL' THEN -1 ELSE CAST(SalesYtd1 AS DECIMAL(15,2)) END AS SalesYtd,
	CASE WHEN SalesLastYear1 ='NULL' THEN -1 ELSE CAST(SalesLastYear1 AS DECIMAL(15,2)) END AS SalesLastYear,
	CASE WHEN CostYtd ='NULL' THEN -1 ELSE CAST(CostYtd AS DECIMAL(15,2)) END AS CostYtd,
	CASE WHEN CostLastYear ='NULL' THEN -1 ELSE CAST(CostLastYear AS DECIMAL(15,2)) END AS CostLastYear
FROM awp_stg1.Sales_April_21_30
UNION
SELECT DISTINCT 
	CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN Name3 ='NULL' THEN 'N/A' ELSE Name3 END AS Name1,
	CASE WHEN  CountryRegionCode ='NULL' THEN 'N/A' ELSE  CountryRegionCode END AS  CountryRegionCode,
	CASE WHEN Group1 ='NULL' THEN 'N/A' ELSE Group1 END AS Group1,
	CASE WHEN SalesYtd1 ='NULL' THEN -1 ELSE CAST(SalesYtd1 AS DECIMAL(15,2)) END AS SalesYtd,
	CASE WHEN SalesLastYear1 ='NULL' THEN -1 ELSE CAST(SalesLastYear1 AS DECIMAL(15,2)) END AS SalesLastYear,
	CASE WHEN CostYtd ='NULL' THEN -1 ELSE CAST(CostYtd AS DECIMAL(15,2)) END AS CostYtd,
	CASE WHEN CostLastYear ='NULL' THEN -1 ELSE CAST(CostLastYear AS DECIMAL(15,2)) END AS CostLastYear
FROM awp_stg1.Sales_May_06_10
UNION
SELECT DISTINCT 
	CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN Name3 ='NULL' THEN 'N/A' ELSE Name3 END AS Name1,
	CASE WHEN  CountryRegionCode ='NULL' THEN 'N/A' ELSE  CountryRegionCode END AS  CountryRegionCode,
	CASE WHEN Group1 ='NULL' THEN 'N/A' ELSE Group1 END AS Group1,
	CASE WHEN SalesYtd1 ='NULL' THEN -1 ELSE CAST(SalesYtd1 AS DECIMAL(15,2)) END AS SalesYtd,
	CASE WHEN SalesLastYear1 ='NULL' THEN -1 ELSE CAST(SalesLastYear1 AS DECIMAL(15,2)) END AS SalesLastYear,
	CASE WHEN CostYtd ='NULL' THEN -1 ELSE CAST(CostYtd AS DECIMAL(15,2)) END AS CostYtd,
	CASE WHEN CostLastYear ='NULL' THEN -1 ELSE CAST(CostLastYear AS DECIMAL(15,2)) END AS CostLastYear
FROM awp_stg1.Sales_May_11_20
UNION
SELECT DISTINCT 
	CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN Name3 ='NULL' THEN 'N/A' ELSE Name3 END AS Name1,
	CASE WHEN  CountryRegionCode ='NULL' THEN 'N/A' ELSE  CountryRegionCode END AS  CountryRegionCode,
	CASE WHEN Group1 ='NULL' THEN 'N/A' ELSE Group1 END AS Group1,
	CASE WHEN SalesYtd1 ='NULL' THEN -1 ELSE CAST(SalesYtd1 AS DECIMAL(15,2)) END AS SalesYtd,
	CASE WHEN SalesLastYear1 ='NULL' THEN -1 ELSE CAST(SalesLastYear1 AS DECIMAL(15,2)) END AS SalesLastYear,
	CASE WHEN CostYtd ='NULL' THEN -1 ELSE CAST(CostYtd AS DECIMAL(15,2)) END AS CostYtd,
	CASE WHEN CostLastYear ='NULL' THEN -1 ELSE CAST(CostLastYear AS DECIMAL(15,2)) END AS CostLastYear
FROM awp_stg1.Sales_May_21_31;

INSERT INTO awp_stg2.Sales_SalesTaxRate
SELECT DISTINCT 
	CASE WHEN SalesTaxRateID = 'NULL' THEN -1 ELSE SalesTaxRateID END AS  SalesTaxRateID,
	CASE WHEN StateProvinceID = 'NULL' THEN -1 ELSE StateProvinceID END AS  StateProvinceID,
	CASE WHEN TaxType = 'NULL' THEN -1 ELSE CAST(TaxType AS BYTEINT) END AS  TaxType,
	CASE WHEN TaxRate = 'NULL' THEN -1 ELSE CAST(TaxRate AS DECIMAL(4,2)) END AS  TaxRate,
	CASE WHEN "Name" ='NULL' THEN 'N/A' ELSE "Name" END  AS "Name"
FROM awp_stg1.SalesTaxRate_Sales;







INSERT INTO awp_stg2.Sales_SalesTerritoryHistory
SELECT DISTINCT 
    CASE WHEN  BusinessEntityID1 ='NULL' THEN -1 ELSE  BusinessEntityID1 END AS  BusinessEntityID,
    CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate
FROM awp_stg1.Sales
UNION
SELECT DISTINCT 
	CASE WHEN  BusinessEntityID1 ='NULL' THEN -1 ELSE  BusinessEntityID1 END AS  BusinessEntityID,
    CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate
FROM awp_stg1.Sales_April_1_10
UNION
SELECT DISTINCT 
	CASE WHEN  BusinessEntityID1 ='NULL' THEN -1 ELSE  BusinessEntityID1 END AS  BusinessEntityID,
    CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate
FROM awp_stg1.Sales_April_1_10_2
UNION
SELECT DISTINCT 
	CASE WHEN  BusinessEntityID1 ='NULL' THEN -1 ELSE  BusinessEntityID1 END AS  BusinessEntityID,
    CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate
FROM awp_stg1.Sales_April_11_20
UNION
SELECT DISTINCT 
CASE WHEN  BusinessEntityID1 ='NULL' THEN -1 ELSE  BusinessEntityID1 END AS  BusinessEntityID,
    CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate
FROM awp_stg1.Sales_April_21_30
UNION
SELECT DISTINCT 
	CASE WHEN  BusinessEntityID1 ='NULL' THEN -1 ELSE  BusinessEntityID1 END AS  BusinessEntityID,
    CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate
FROM awp_stg1.Sales_May_06_10
UNION
SELECT DISTINCT 
	CASE WHEN  BusinessEntityID1 ='NULL' THEN -1 ELSE  BusinessEntityID1 END AS  BusinessEntityID,
    CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate
FROM awp_stg1.Sales_May_11_20
UNION
SELECT DISTINCT 
	CASE WHEN  BusinessEntityID1 ='NULL' THEN -1 ELSE  BusinessEntityID1 END AS  BusinessEntityID,
    CASE WHEN TerritoryID1 ='NULL' THEN -1 ELSE TerritoryID1 END AS TerritoryID,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate
FROM awp_stg1.Sales_May_21_31;

INSERT INTO awp_stg2.Sales_ShoppingCartItem
SELECT DISTINCT 
	CASE WHEN ShoppingCartItemID = 'NULL' THEN -1 ELSE ShoppingCartItemID END AS  ShoppingCartItemID,
	CASE WHEN ShoppingCartID = 'NULL' THEN -1 ELSE ShoppingCartID END AS ShoppingCartID,
	CASE WHEN Quantity = 'NULL' THEN -1 ELSE Quantity END AS  Quantity,
	CASE WHEN ProductID = 'NULL' THEN -1 ELSE ProductID END AS  ProductID,
	CASE WHEN DateCreated = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(DateCreated,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS DateCreated
FROM awp_stg1.ShoppingCartItem_Sales;







INSERT INTO awp_stg2.Sales_SpecialOffer
SELECT DISTINCT 
    CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
	CASE WHEN Description ='NULL' THEN 'N/A' ELSE Description END AS Description,
	CASE WHEN DiscountPct ='NULL' THEN -1 ELSE CAST(DiscountPct AS DECIMAL(8,2)) END AS DiscountPct,
	CASE WHEN Type1 ='NULL' THEN 'N/A' ELSE Type1 END AS Type1,
	CASE WHEN Category ='NULL' THEN 'N/A' ELSE Category END AS Category,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate,
    CASE WHEN MinQty ='NULL' THEN -1 ELSE MinQty END AS MinQty,
	CASE WHEN MaxQty ='NULL' THEN -1 ELSE MaxQty END AS MaxQty
FROM awp_stg1.Sales
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
	CASE WHEN Description ='NULL' THEN 'N/A' ELSE Description END AS Description,
	CASE WHEN DiscountPct ='NULL' THEN -1 ELSE CAST(DiscountPct AS DECIMAL(8,2)) END AS DiscountPct,
	CASE WHEN Type1 ='NULL' THEN 'N/A' ELSE Type1 END AS Type1,
	CASE WHEN Category ='NULL' THEN 'N/A' ELSE Category END AS Category,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate,
    CASE WHEN MinQty ='NULL' THEN -1 ELSE MinQty END AS MinQty,
	CASE WHEN MaxQty ='NULL' THEN -1 ELSE MaxQty END AS MaxQty
FROM awp_stg1.Sales_April_1_10
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
	CASE WHEN Description ='NULL' THEN 'N/A' ELSE Description END AS Description,
	CASE WHEN DiscountPct ='NULL' THEN -1 ELSE CAST(DiscountPct AS DECIMAL(8,2)) END AS DiscountPct,
	CASE WHEN Type1 ='NULL' THEN 'N/A' ELSE Type1 END AS Type1,
	CASE WHEN Category ='NULL' THEN 'N/A' ELSE Category END AS Category,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate,
    CASE WHEN MinQty ='NULL' THEN -1 ELSE MinQty END AS MinQty,
	CASE WHEN MaxQty ='NULL' THEN -1 ELSE MaxQty END AS MaxQty
FROM awp_stg1.Sales_April_1_10_2
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
	CASE WHEN Description ='NULL' THEN 'N/A' ELSE Description END AS Description,
	CASE WHEN DiscountPct ='NULL' THEN -1 ELSE CAST(DiscountPct AS DECIMAL(8,2)) END AS DiscountPct,
	CASE WHEN Type1 ='NULL' THEN 'N/A' ELSE Type1 END AS Type1,
	CASE WHEN Category ='NULL' THEN 'N/A' ELSE Category END AS Category,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate,
    CASE WHEN MinQty ='NULL' THEN -1 ELSE MinQty END AS MinQty,
	CASE WHEN MaxQty ='NULL' THEN -1 ELSE MaxQty END AS MaxQty
FROM awp_stg1.Sales_April_11_20
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
	CASE WHEN Description ='NULL' THEN 'N/A' ELSE Description END AS Description,
	CASE WHEN DiscountPct ='NULL' THEN -1 ELSE CAST(DiscountPct AS DECIMAL(8,2)) END AS DiscountPct,
	CASE WHEN Type1 ='NULL' THEN 'N/A' ELSE Type1 END AS Type1,
	CASE WHEN Category ='NULL' THEN 'N/A' ELSE Category END AS Category,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate,
    CASE WHEN MinQty ='NULL' THEN -1 ELSE MinQty END AS MinQty,
	CASE WHEN MaxQty ='NULL' THEN -1 ELSE MaxQty END AS MaxQty
FROM awp_stg1.Sales_April_21_30
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
	CASE WHEN Description ='NULL' THEN 'N/A' ELSE Description END AS Description,
	CASE WHEN DiscountPct ='NULL' THEN -1 ELSE CAST(DiscountPct AS DECIMAL(8,2)) END AS DiscountPct,
	CASE WHEN Type1 ='NULL' THEN 'N/A' ELSE Type1 END AS Type1,
	CASE WHEN Category ='NULL' THEN 'N/A' ELSE Category END AS Category,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate,
    CASE WHEN MinQty ='NULL' THEN -1 ELSE MinQty END AS MinQty,
	CASE WHEN MaxQty ='NULL' THEN -1 ELSE MaxQty END AS MaxQty
FROM awp_stg1.Sales_May_06_10
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
	CASE WHEN Description ='NULL' THEN 'N/A' ELSE Description END AS Description,
	CASE WHEN DiscountPct ='NULL' THEN -1 ELSE CAST(DiscountPct AS DECIMAL(8,2)) END AS DiscountPct,
	CASE WHEN Type1 ='NULL' THEN 'N/A' ELSE Type1 END AS Type1,
	CASE WHEN Category ='NULL' THEN 'N/A' ELSE Category END AS Category,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate,
    CASE WHEN MinQty ='NULL' THEN -1 ELSE MinQty END AS MinQty,
	CASE WHEN MaxQty ='NULL' THEN -1 ELSE MaxQty END AS MaxQty
FROM awp_stg1.Sales_May_11_20
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
	CASE WHEN Description ='NULL' THEN 'N/A' ELSE Description END AS Description,
	CASE WHEN DiscountPct ='NULL' THEN -1 ELSE CAST(DiscountPct AS DECIMAL(8,2)) END AS DiscountPct,
	CASE WHEN Type1 ='NULL' THEN 'N/A' ELSE Type1 END AS Type1,
	CASE WHEN Category ='NULL' THEN 'N/A' ELSE Category END AS Category,
	CASE WHEN StartDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(StartDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS StartDate,
	CASE WHEN EndDate1 = 'NULL' THEN CAST('1900-01-01' AS DATE FORMAT 'YYYY-MM-DD') ELSE CAST(SUBSTR(EndDate1,1,10) AS DATE FORMAT 'YYYY-MM-DD') END AS EndDate,
    CASE WHEN MinQty ='NULL' THEN -1 ELSE MinQty END AS MinQty,
	CASE WHEN MaxQty ='NULL' THEN -1 ELSE MaxQty END AS MaxQty
FROM awp_stg1.Sales_May_21_31;







INSERT INTO awp_stg2.Sales_SpecialOfferProduct
SELECT DISTINCT 
    CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
    CASE WHEN ProductID1 ='NULL' THEN -1 ELSE ProductID1 END AS ProductID1
FROM awp_stg1.Sales
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
    CASE WHEN ProductID1 ='NULL' THEN -1 ELSE ProductID1 END AS ProductID1
FROM awp_stg1.Sales_April_1_10
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
    CASE WHEN ProductID1 ='NULL' THEN -1 ELSE ProductID1 END AS ProductID1
FROM awp_stg1.Sales_April_1_10_2
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
    CASE WHEN ProductID1 ='NULL' THEN -1 ELSE ProductID1 END AS ProductID1
FROM awp_stg1.Sales_April_11_20
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
    CASE WHEN ProductID1 ='NULL' THEN -1 ELSE ProductID1 END AS ProductID1
FROM awp_stg1.Sales_April_21_30
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
    CASE WHEN ProductID1 ='NULL' THEN -1 ELSE ProductID1 END AS ProductID1
FROM awp_stg1.Sales_May_06_10
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
    CASE WHEN ProductID1 ='NULL' THEN -1 ELSE ProductID1 END AS ProductID1
FROM awp_stg1.Sales_May_11_20
UNION
SELECT DISTINCT 
	CASE WHEN SpecialOfferID1 ='NULL' THEN -1 ELSE SpecialOfferID1 END AS SpecialOfferID1,
    CASE WHEN ProductID1 ='NULL' THEN -1 ELSE ProductID1 END AS ProductID1
FROM awp_stg1.Sales_May_21_31;

INSERT INTO awp_stg2.Sales_Store	
SELECT DISTINCT 
	CASE WHEN BusinessEntityID='NULL' THEN -1 ELSE BusinessEntityID END AS  BusinessEntityID,
	CASE WHEN SalesPersonID='NULL' THEN -1 ELSE SalesPersonID END AS  SalesPersonID,
	CASE WHEN Name1='NULL' THEN 'N/A' ELSE Name1 END  AS Name1,
	CASE WHEN DEMOGRAPHICS = 'NULL' THEN 'N/A' ELSE DEMOGRAPHICS END AS DEMOGRAPHICS
FROM awp_stg1.Store_Sales;



.LOGOFF