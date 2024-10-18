       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST3.
       AUTHOR. Mr  HU.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-AT.
       OBJECT-COMPUTER. IBM-AT.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 MGR                  PIC X(7).

       01 DISP-RATE            PIC $$$,$$$,$$9.99.
       01 DISP-HOURS           PIC ZZ,ZZ9.
       01 DISP-CODE            PIC ----9.
       01 ANSS                 PIC X.

           EXEC SQL
               INCLUDE SQLCA
           END-EXEC

       PROCEDURE DIVISION.

       100-MAIN.
           CALL 'MYRF' USING 'TEST3'  
           END-CALL
           
      *     create a table

           EXEC SQL
               CREATE TABLE PLANE
             ( PLANENAME CHAR (20),
                PLANETYPE CHAR (8))
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'CREATE TABLE' DISP-CODE

      * insert a data into specified table

           EXEC SQL
              INSERT INTO authors
               (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,
                COUNTRY,POSTALCODE)
              VALUES
               ("11","McGruff","Jerry","0164483445",
                "2345 Copeland Dr", "Byzantine",
                "IL","FRANCE","91160")
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'insert ' DISP-CODE

      *   alter a table

           EXEC SQL
               ALTER TABLE  authors
               ADD MAGE CHAR 3,WORKYEAR CHAR 3
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'alter ' DISP-CODE

      *   create an index on a table

           EXEC SQL
              CREATE INDEX NAMEDX ON authors (AU_LNAME)
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'create index ' DISP-CODE

           EXEC SQL
               UPDATE authors
                   SET CITY = "Takoma Pk"
                   WHERE AU_FNAME ="John"
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY ' update ' DISP-CODE.
           DISPLAY 'Number of rows updated:  ' SQLERRD(3)

      *    delete data

           EXEC SQL
              DELETE FROM authors
               WHERE AU_LNAME = "McGruff"
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY ' delete ' DISP-CODE
           DISPLAY 'Number of rows deleted:  ' SQLERRD(3)

      *    drop the index

           EXEC SQL
              DROP INDEX NAMEDX
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'drop index ' DISP-CODE

      *    alter table delete field

           EXEC SQL
              ALTER TABLE authors DELETE MAGE,WORKYEAR
           END-EXEC
           MOVE SQLCODE TO DISP-CODE
           DISPLAY ' alter table delete field ' DISP-CODE

      *    drop a table

           EXEC SQL
              DROP TABLE PLANE
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'drop table ' DISP-CODE
           .
       100-EXIT.
           STOP RUN.

      * Copyright (C) 1996-1999 MERANT International Ltd.
      * All rights reserved.
