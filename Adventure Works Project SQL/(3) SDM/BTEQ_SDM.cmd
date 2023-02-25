@ECHO OFF
ECHO  -----------------------------------------------------------
ECHO                 Phase: 1 ..... Fastload Start
ECHO  -----------------------------------------------------------

bteq < DP_SDM_DDL.sql > LOG_DP_SDM_DDL.txt
bteq < DP_SDM_DML.sql > LOG_DP_SDM_DML.txt

ECHO  -------------------------------------------------------------------------
ECHO               !!!!!!    SCRIPT COMPLTED COMPLETELY     !!!!!
ECHO                           Press any key to Finish
ECHO  -------------------------------------------------------------------------
pause