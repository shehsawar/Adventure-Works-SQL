@ECHO OFF
ECHO  -----------------------------------------------------------
ECHO                 Phase: 1 ..... Fastload Start
ECHO  -----------------------------------------------------------

bteq < RDM_BTEQ_ALL.sql > Log_STG2_DDL_BTEQS_ALL.txt


ECHO  -------------------------------------------------------------------------
ECHO               !!!!!!    SCRIPT COMPLTED COMPLETELY     !!!!!
ECHO                           Press any key to Finish
ECHO  -------------------------------------------------------------------------
pause