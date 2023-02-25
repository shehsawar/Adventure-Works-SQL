.LOGON 192.168.25.128/dbc,dbc;
DATABASE awp_stg2;

--Person Module

CREATE TABLE awp_stg2.Person_Address
(
AddressID INTEGER,
AddressLine1 VARCHAR(100),
AddressLine2 VARCHAR(100),
City VARCHAR(50),
StateProvinceID VARCHAR(100), --changed it to VARCHAR (some alphabets in it) to remove Failure 2620 (fotmat or data containing bad character)
PostalCode VARCHAR(50),
SpatialLocation VARCHAR(200)
)
PRIMARY INDEX(AddressID);

CREATE TABLE awp_stg2.Person_AddressType(
AddressTypeID INTEGER,
Name1 VARCHAR(50)
)
PRIMARY INDEX(AddressTypeID);

CREATE TABLE awp_stg2.Person_BusinessEntity
(
BusinessEntityID INTEGER
)
PRIMARY INDEX(BusinessEntityID);

CREATE TABLE awp_stg2.Person_BusinessEntityAddress(
AddressID INTEGER,
BusinessEntityID INTEGER,
AddressTypeID VARCHAR(50)
)
PRIMARY INDEX(AddressID);

CREATE TABLE awp_stg2.Person_ContactType
(
BusinessEntityID INTEGER,
Name1 VARCHAR(50)
)
PRIMARY INDEX(BusinessEntityID);

CREATE TABLE awp_stg2.Person_CountryRegion
(
CountryRegionCode CHAR(4),
Name1 VARCHAR(50)

)
PRIMARY INDEX(CountryRegionCode);

CREATE TABLE awp_stg2.Person_EmailAddress
(
BusinessEntityID INTEGER,
EmailAddressID INTEGER,
EmailAddress VARCHAR(64)
)
PRIMARY INDEX(BusinessEntityID);

CREATE TABLE awp_stg2.Person_Passwords
(
BusinessEntityID INTEGER,
PasswordHash VARCHAR(256),
PasswordSalt VARCHAR(50)
)
PRIMARY INDEX(BusinessEntityID);

CREATE TABLE awp_stg2.Person_Person
(
           BusinessEntityID INTEGER,
		   PersonType CHAR(2),
		   --NameStyle INTEGER  has nothing only zero so drop it,
		   Title1 CHAR(4),
		   FirstName VARCHAR(50),
		   MiddleName VARCHAR(50),
		   LastName VARCHAR(50),
		   Suffix CHAR(5),
		   EmailPromotion BYTEINT,
		   --AdditionalContactInfo VARCHAR(200) WE DON'T NEED THIS,
		 DemoGraphics1 VARCHAR(200)
)
PRIMARY INDEX (BusinessEntityID);

CREATE TABLE awp_stg2.Person_PhoneNumberType(
PhoneNumberTypeID INTEGER GENERATED ALWAYS AS IDENTITY
(START WITH 1
INCREMENT BY 1
MINVALUE 1
NO CYCLE),
Name1 VARCHAR(50)
)
PRIMARY INDEX(PhoneNumberTypeID);

CREATE TABLE awp_stg2.Person_PersonPhone
(
BusinessEntityID INTEGER,
PhoneNumber VARCHAR(64),
PhoneNumberTypeID INTEGER
)
PRIMARY INDEX(BusinessEntityID);

CREATE TABLE awp_stg2.Person_StateProvince
(
StateProvinceID VARCHAR(100), --changed it to VARCHAR (some alphabets in it) to remove Failure 2620 (fotmat or data containing bad character)
StateProvinceCode VARCHAR(50), --changed it to VARCHAR (some alphabets in it) to remove Failure 2620 (fotmat or data containing bad character)
CountryRegionCode VARCHAR(50), --changed it to VARCHAR (some alphabets in it) to remove Failure 2620 (fotmat or data containing bad character)
isOnlyStateProvinceFlag VARCHAR(300),
Name1 VARCHAR(50),
TerritoryID VARCHAR(50) --changed it to VARCHAR (some alphabets in it) to remove Failure 2620 (fotmat or data containing bad character)
)
PRIMARY INDEX(StateProvinceID);












--Sales

CREATE TABLE awp_stg2.Sales_CreditCard(
		CreditCardID INTEGER,
		CardType VARCHAR(50),
		CardNumber VARCHAR(64),
		ExpMonth SMALLINT,
		ExpYear SMALLINT
		)
		PRIMARY INDEX(CreditCardID);
		
CREATE TABLE awp_stg2.Sales_Currency
	(
		CurrencyCode CHAR(3) NOT NULL ,
		Name1 VARCHAR(64) NOT NULL
	)
		PRIMARY INDEX(CurrencyCode);

CREATE TABLE awp_stg2.Sales_CurrencyRate(
		CurrencyRateID INTEGER,
		CurrencyRateDate DATE FORMAT 'MM/DD/YYYY',
		FromCurrencyCode VARCHAR(50),
		ToCurrencyCode VARCHAR(4),
		AverageRate DECIMAL(8,2),
		EndOfDayRate DECIMAL(8,2) 
		)
		PRIMARY INDEX(CurrencyRateID);

CREATE TABLE awp_stg2.Sales_Customer
	(
	  CustomerID INTEGER,
	  PersonID INTEGER ,
	  StoreID INTEGER,
	  TerritoryID INTEGER,
	  AccountNumber VARCHAR(32)
	 )
PRIMARY INDEX (CustomerID);

	CREATE TABLE awp_stg2.Sales_PersonCreditCard(
	    BusinessEntityID INTEGER,
		CreditCardID INTEGER
		)
		PRIMARY INDEX(BusinessEntityID,CreditCardID);
		
CREATE TABLE awp_stg2.Sales_SalesOrderDetail
	(
		BusinessEntityID INTEGER,
		SalesOrderID INTEGER,
		SalesOrderDetailID INTEGER,
		CarrierTrackingNumber VARCHAR(16),
		 OrderQty INTEGER,
		 ProductID INTEGER,
		 SpecialOfferID INTEGER,
		 UnitPrice DECIMAL(10,2),
		 UnitPriceDiscount  DECIMAL(6,2),
		 LineTotal DECIMAL(10,2)
	 )
	PRIMARY INDEX (SalesOrderDetailID,SalesOrderID,BusinessEntityID);

CREATE TABLE awp_stg2.Sales_SalesOrderHeader
	(
		BusinessEntityID INTEGER,
		SalesOrderID	INTEGER,
		ShipMethodID	INTEGER,
		SalesPersonID   INTEGER,
		RevisionNumber	INTEGER,
		OrderDate		DATE FORMAT 'MM/DD/YYYY',
		DueDate			DATE FORMAT 'MM/DD/YYYY',
		ShipDate		DATE FORMAT 'MM/DD/YYYY',
		Status	BYTEINT,
		OnlineOrderFlag	BYTEINT,
		SalesOrderNumber	VARCHAR(50),
		PurchaseOrderNumber	VARCHAR(50),
		AccountNumber	VARCHAR(50),
		TerritoryID	INTEGER,
		BillToAddressID	INTEGER,
		ShipToAddressID	INTEGER,
		CreditCardID INTEGER,
		CreditCardApprovalCode VARCHAR(50),
		CurrencyRateID	INTEGER,
		SubTotal	DECIMAL (10,2),
		TaxAmt	DECIMAL (10,2),
		Freight	DECIMAL (10,2),
		TotalDue	DECIMAL (10,2)
	)
	PRIMARY INDEX (SalesOrderID,BusinessEntityID);

CREATE TABLE awp_stg2.Sales_SalesOrderHeaderSalesReason
	(
	    BusinessEntityID INTEGER,
		SalesOrderID INTEGER,
		SalesReasonID INTEGER
	)
		PRIMARY INDEX(BusinessEntityID,SalesOrderID,SalesReasonID);

CREATE TABLE awp_stg2.Sales_SalesPerson(
		BusinessEntityID INTEGER,
		TerritoryID INTEGER,
		SalesQuota DECIMAL(10,2),
		Bonus DECIMAL(10,2) ,
		CommissionPct DECIMAL(10,2),
		SalesYTD DECIMAL(10,2) ,
		SalesLastYear DECIMAL(10,2)
		)
PRIMARY INDEX(BusinessEntityID);

CREATE TABLE awp_stg2.Sales_SalesPersonQuotaHistory
	(
	  BusinessEntityID INTEGER,
	  SalesQuota DECIMAL(10,2),
      QuotaDate DATE FORMAT 'MM/DD/YYYY'
	 )
PRIMARY INDEX (BusinessEntityID,QuotaDate);

CREATE TABLE awp_stg2.Sales_SalesReason
	(
		SalesReasonID INTEGER,
		Name1 VARCHAR(32),
		ReasonType VARCHAR(32) 
	)
		PRIMARY INDEX(SalesReasonID);

CREATE TABLE awp_stg2.Sales_SalesTerritory
	(
	  TerritoryID INTEGER,
      Name1 VARCHAR(40),
      CountryRegionCode CHAR(5),
      Group1 VARCHAR(20),
      SalesYtd DECIMAL(15,2),
      SalesLastYear DECIMAL(15,2),
      CostYtd DECIMAL(10,2),
      CostLastYear DECIMAL(10,2)
	 )
PRIMARY INDEX ( TerritoryID );

CREATE TABLE awp_stg2.Sales_SalesTaxRate
	(
		SalesTaxRateID INTEGER ,
		StateProvinceID INTEGER,
		TaxType BYTEINT,
		TaxRate DECIMAL(4,2),
		Name1 VARCHAR(50) 
	)
		PRIMARY INDEX(SalesTaxRateID);


CREATE TABLE awp_stg2.Sales_SalesTerritoryHistory
	(
	  BusinessEntityID INTEGER,
	  TerritoryID INTEGER,
      StartDate DATE FORMAT 'MM/DD/YYYY',
	  EndDate DATE FORMAT 'MM/DD/YYYY'
	 )
PRIMARY INDEX (BusinessEntityID,TerritoryID,StartDate);

CREATE TABLE awp_stg2.Sales_ShoppingCartItem
	(
		ShoppingCartItemID INTEGER ,
		ShoppingCartID VARCHAR(64),
		Quantity INTEGER,  
		ProductID INTEGER,
		DateCreated DATE  FORMAT 'MM/DD/YYYY'
	)
PRIMARY INDEX(ShoppingCartItemID);
		
CREATE TABLE awp_stg2.Sales_SpecialOffer
	(
		SpecialOfferID INTEGER ,
		Description VARCHAR(256),
		DiscountPct DECIMAL(8,2),
		Type1 VARCHAR(64),
		Category VARCHAR(64),
		StartDate DATE FORMAT 'MM/DD/YYYY',
		EndDate DATE FORMAT 'MM/DD/YYYY',
		MinQty INTEGER,
		MaxQty INTEGER 
	)
PRIMARY INDEX(SpecialOfferID);

CREATE TABLE awp_stg2.Sales_SpecialOfferProduct
	(
		SpecialOfferID INTEGER,
		ProductID INTEGER 
	)
PRIMARY INDEX(SpecialOfferID);

CREATE TABLE awp_stg2.Sales_Store
	(
		BusinessEntityID INTEGER NOT NULL,
		SalesPersonID VARCHAR(50), --changed it to VARCHAR (some alphabets in it) to remove Failure 2620 (fotmat or data containing bad character)
		NAME1 VARCHAR(50),
		DEMOGRAPHICS1 VARCHAR(700)
	)
PRIMARY INDEX(BusinessEntityID);


.LOGOFF