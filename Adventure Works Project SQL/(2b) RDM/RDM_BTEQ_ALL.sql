.LOGON 192.168.25.128 /dbc,dbc;
DATABASE awp_rdm;

--PERSON MODULE

CREATE MULTISET TABLE awp_rdm.Person_Address AS awp_stg2.Person_Address
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_AddressType AS awp_stg2.Person_AddressType
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_BusinessEntityAddress AS awp_stg2.Person_BusinessEntityAddress
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_Passwords AS awp_stg2.Person_Passwords
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_BusinessEntity AS awp_stg2.Person_BusinessEntity
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_CountryRegion AS awp_stg2.Person_CountryRegion
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_StateProvince AS awp_stg2.Person_StateProvince
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_EmailAddress AS awp_stg2.Person_EmailAddress
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_Person AS awp_stg2.Person_Person
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_PersonPhone AS awp_stg2.Person_PersonPhone
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_PurchaseOrderHeader AS awp_stg2.Person_PurchaseOrderHeader
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_PurchaseOrderDetail AS awp_stg2.Person_PurchaseOrderDetail
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_Vendor AS awp_stg2.Person_Vendor
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_ShipMethod AS awp_stg2.Person_ShipMethod
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Person_PhoneNumberType
(
	PhoneNumberType INTEGER,
	Name1 VARCHAR(8)
)
UNIQUE PRIMARY INDEX (PhoneNumberType);
INSERT INTO awp_rdm.Person_PhoneNumberType
SELECT *
FROM awp_stg2.Person_PhoneNumberType;












--HR MODULE
CREATE MULTISET TABLE awp_rdm.HR_Employee AS awp_stg2.HR_Employee WITH DATA;

CREATE MULTISET TABLE awp_rdm.HR_Department
(
            DepartmentID INTEGER ,
			DepartmentName VARCHAR(32),
			GroupName VARCHAR(32)
)

UNIQUE PRIMARY INDEX (DepartmentID);
INSERT INTO awp_rdm.HR_Department
Select *
From awp_stg2.HR_Department;

CREATE MULTISET TABLE awp_rdm.HR_EmployeeDepartmentHistory AS awp_stg2.HR_EmployeeDepartmentHistory WITH DATA;

CREATE MULTISET TABLE awp_rdm.HR_Shift 
     (
      ShiftID INTEGER ,
      Name1 CHAR(8) CHARACTER SET LATIN NOT CASESPECIFIC,
      StartTime TIME(6),
      EndTime TIME(6)
	  )
UNIQUE PRIMARY INDEX ( ShiftID );

INSERT INTO awp_rdm.HR_Shift
Select *
FROM awp_stg2.HR_Shift;












--Sales Module

CREATE MULTISET TABLE awp_rdm.Sales_ShoppingCartItem AS awp_stg2.Sales_ShoppingCartItem
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_SpecialOffer AS awp_stg2.Sales_SpecialOffer
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_SpecialOfferProduct AS awp_stg2.Sales_SpecialOfferProduct
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_Store AS awp_stg2.Sales_Store
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_SalesOrderHeaderSalesReason AS awp_stg2.Sales_SalesOrderHeaderSalesReason
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_SalesPerson AS awp_stg2.Sales_SalesPerson
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_SalesPersonQuotaHistory AS awp_stg2.Sales_SalesPersonQuotaHistory
WITH DATA;


CREATE MULTISET TABLE awp_rdm.Sales_SalesReason AS awp_stg2.Sales_SalesReason
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_SalesTaxRate AS awp_stg2.Sales_SalesTaxRate
WITH DATA;


CREATE MULTISET TABLE awp_rdm.Sales_SalesTerritory AS awp_stg2.Sales_SalesTerritory
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_SalesTerritoryHistory AS awp_stg2.Sales_SalesTerritoryHistory
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_Currency AS awp_stg2.Sales_Currency
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_CurrencyRate AS awp_stg2.Sales_CurrencyRate
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_Customer AS awp_stg2.Sales_Customer
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_CreditCard AS awp_stg2.Sales_CreditCard
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_PersonCreditCard AS awp_stg2.Sales_PersonCreditCard
WITH DATA;

CREATE MULTISET TABLE awp_rdm.Sales_SalesOrderHeader AS awp_stg2.Sales_SalesOrderHeader
WITH DATA
PRIMARY INDEX(SalesOrderID) 
PARTITION BY RANGE_N  (
   OrderDate BETWEEN DATE '2000-01-01' AND '2019-12-31' EACH INTERVAL '1' MONTH);

CREATE MULTISET TABLE awp_rdm.Sales_SalesOrderDetail AS awp_stg2.Sales_SalesOrderDetail
WITH DATA
PRIMARY INDEX(SalesOrderID) 
PARTITION BY ProductID;






.LOGOFF