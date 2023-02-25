.LOGON 192.168.229.128 /dbc,dbc; 
DATABASE DB;

drop table DB.SpecialOfferProduct;
CREATE TABLE DB.SpecialOfferProduct
	(
		SpecialOfferID INTEGER,
		ProductID INTEGER 
	)
PRIMARY INDEX(SpecialOfferID);


SEL COALESCE(dept_no, 99999) AS dptno,COALESCE(department_name, 'Unkown'  ) FROM DB.Department_table;




		

.LOGOFF

8:13 AM 6/12/2021
