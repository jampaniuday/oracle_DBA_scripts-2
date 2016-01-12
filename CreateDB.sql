SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /export/home/oracle/DBscripts/Creation_Scripts/CreateDB.log append
startup nomount pfile="/export/home/oracle/DBscripts/Creation_Scripts/init.ora";
CREATE DATABASE "catalog"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
DATAFILE '/u01/app/oracle/product/11.2.0/oradata/catalog/system01.dbf' SIZE 700M REUSE AUTOEXTEND ON NEXT  10240K MAXSIZE UNLIMITED
EXTENT MANAGEMENT LOCAL
SYSAUX DATAFILE '/u01/app/oracle/product/11.2.0/oradata/catalog/sysaux01.dbf' SIZE 600M REUSE AUTOEXTEND ON NEXT  10240K MAXSIZE UNLIMITED
SMALLFILE DEFAULT TEMPORARY TABLESPACE TEMP TEMPFILE '/u01/app/oracle/product/11.2.0/oradata/catalog/temp01.dbf' SIZE 20M REUSE AUTOEXTEND ON NEXT  640K MAXSIZE UNLIMITED
SMALLFILE UNDO TABLESPACE "UNDOTBS1" DATAFILE '/u01/app/oracle/product/11.2.0/oradata/catalog/undotbs01.dbf' SIZE 200M REUSE AUTOEXTEND ON NEXT  5120K MAXSIZE UNLIMITED
CHARACTER SET WE8MSWIN1252
NATIONAL CHARACTER SET AL16UTF16
LOGFILE GROUP 1 ('/u01/app/oracle/product/11.2.0/oradata/catalog/redo01.log') SIZE 51200K,
GROUP 2 ('/u01/app/oracle/product/11.2.0/oradata/catalog/redo02.log') SIZE 51200K,
GROUP 3 ('/u01/app/oracle/product/11.2.0/oradata/catalog/redo03.log') SIZE 51200K
USER SYS IDENTIFIED BY "&&sysPassword" USER SYSTEM IDENTIFIED BY "&&systemPassword";
spool off
