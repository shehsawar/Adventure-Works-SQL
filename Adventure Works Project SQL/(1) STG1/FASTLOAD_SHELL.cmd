@ECHO OFF
ECHO  -----------------------------------------------------------
ECHO                 Phase: 1 ..... Fastload Start
ECHO  -----------------------------------------------------------

fastload < 15_Customer_Sales.fld			> Log_15_Customer_Sales.txt
fastload < 16_SalesTaxRate_Sales.fld			> Log_16_SalesTaxRate_Sales.txt
fastload < 17_ShoppingCartItem_Sales.fld		> Log_17_ShoppingCartItem_Sales.txt
fastload < 18_Store_Sales.fld				> Log_18_Store_Sales.txt
fastload < Person.fld				> Log_Person.txt
fastload < Sales2.fld				> Log_Sales2.txt
fastload < Sales3new.fld				> Log_Sales3new.txt
fastload < Sales.fld					> Log_Sales.txt
fastload < Sales_April1_10.fld			> Log_Sales_April1_10.txt
fastload < Sales_April1_10_2.fld			> Log_Sales_April1_10_2.txt
fastload < Sales_April11_20.fld			> Log_Sales_April11_20.txt
fastload < Sales_April21_30.fld			> Log_Sales_April21_30.txt
fastload < Sales_May06_10.fld			> Log_Sales_May06_10.txt
fastload < Sales_May11_20.fld			> Log_Sales_May11_20.txt
fastload < Sales_May21_31.fld			> Log_Sales_May21_31.txt

ECHO  -------------------------------------------------------------------------
ECHO               !!!!!!    SCRIPT COMPLTED COMPLETELY     !!!!!
ECHO                           Press any key to Finish
ECHO  -------------------------------------------------------------------------
pause