ALTER SYSTEM SET SHARED_POOL_SIZE='100M' SCOPE=spfile;

SHUTDOWN IMMEDIATE

STARTUP

CREATE TABLESPACE APEX DATAFILE '/u01/app/oracle/oradata/XE/apex01.dbf' SIZE 300M AUTOEXTEND ON NEXT 5M;

@apexins.sql APEX APEX TEMP /i/