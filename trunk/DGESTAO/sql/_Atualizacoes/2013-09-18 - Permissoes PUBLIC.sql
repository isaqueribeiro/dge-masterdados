/* Server version: WI-V6.3.4.18393 Firebird 2.1 
   SQLDialect: 3. ODS: 11.1. Forced writes: On. Sweep inteval: 20000.
   Page size: 8192. Cache pages: 2048 (16384 Kb). Read-only: False. */
SET CLIENTLIB 'C:\Program Files (x86)\Firebird\Firebird_2_1\bin\fbclient.dll';
SET NAMES ISO8859_2;

SET SQL DIALECT 3;

-- CONNECT 'localhost:NORTEMIX' USER 'SYSDBA' PASSWORD 'masterkey';

SET AUTODDL ON;

/* Create(Add) privilege */
GRANT ALL ON MON$ATTACHMENTS TO PUBLIC;

GRANT ALL ON MON$ATTACHMENTS TO SYSDBA;

GRANT ALL ON MON$CALL_STACK TO PUBLIC;

GRANT ALL ON MON$CALL_STACK TO SYSDBA;

GRANT ALL ON MON$DATABASE TO PUBLIC;

GRANT ALL ON MON$DATABASE TO SYSDBA;

GRANT ALL ON MON$IO_STATS TO PUBLIC;

GRANT ALL ON MON$IO_STATS TO SYSDBA;

GRANT ALL ON MON$RECORD_STATS TO PUBLIC;

GRANT ALL ON MON$RECORD_STATS TO SYSDBA;

GRANT ALL ON MON$STATEMENTS TO PUBLIC;

GRANT ALL ON MON$STATEMENTS TO SYSDBA;

GRANT ALL ON MON$TRANSACTIONS TO PUBLIC;

GRANT ALL ON MON$TRANSACTIONS TO SYSDBA;


