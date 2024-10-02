-- First, connect to the PDB
ALTER SESSION SET CONTAINER = MYPDB;

DECLARE
  v_count NUMBER;
  v_tablespace VARCHAR2(30) := 'USERS';
BEGIN
  -- Check if USERS tablespace exists
  SELECT COUNT(*) INTO v_count FROM dba_tablespaces WHERE tablespace_name = 'USERS';
  
  IF v_count = 0 THEN
    -- USERS tablespace doesn't exist, try to create it
    BEGIN
      EXECUTE IMMEDIATE 'CREATE TABLESPACE USERS DATAFILE ''/opt/oracle/oradata/MYPDB/users01.dbf'' SIZE 100M AUTOEXTEND ON NEXT 50M MAXSIZE UNLIMITED';
    EXCEPTION
      WHEN OTHERS THEN
        -- If we can't create USERS, use the default tablespace
        SELECT property_value INTO v_tablespace
        FROM database_properties
        WHERE property_name = 'DEFAULT_PERMANENT_TABLESPACE';
    END;
  END IF;

  -- Create user PH
  EXECUTE IMMEDIATE 'CREATE USER PH IDENTIFIED BY MySuperPassword2024 DEFAULT TABLESPACE ' || v_tablespace;
  
  -- Grant necessary privileges
  EXECUTE IMMEDIATE 'GRANT CREATE SESSION TO PH';
  EXECUTE IMMEDIATE 'GRANT CREATE TABLE, ALTER ANY TABLE, DROP ANY TABLE TO PH';
  EXECUTE IMMEDIATE 'GRANT INSERT ANY TABLE, UPDATE ANY TABLE, DELETE ANY TABLE TO PH';
  EXECUTE IMMEDIATE 'GRANT SELECT ANY TABLE TO PH';
  EXECUTE IMMEDIATE 'GRANT CREATE SEQUENCE TO PH';
  EXECUTE IMMEDIATE 'GRANT CREATE VIEW TO PH';
  EXECUTE IMMEDIATE 'GRANT UNLIMITED TABLESPACE TO PH';
  EXECUTE IMMEDIATE 'ALTER USER PH QUOTA UNLIMITED ON ' || v_tablespace;

EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -1920 THEN  -- ORA-01920: user name 'PH' conflicts with another user or role name
      RAISE;
    END IF;
END;
/

EXIT;