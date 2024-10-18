       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST6.
       AUTHOR. MR. HU.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-AT.
       OBJECT-COMPUTER. IBM-AT.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

           EXEC SQL
               INCLUDE authors
           END-EXEC

       01 DISP-COM             PIC Z.99.
       01 DISP-RATE            PIC $$$,$$$,$$9.99.
       01 DISP-HOURS           PIC ZZ,ZZ9.
       01 DISP-CODE            PIC ----9.
       01 FAKE-CHAR            PIC X.
       01 ANSS                 PIC X.
       01 CITY1                PIC X(15).
       01 COM-NULL-IND         PIC S9(4) COMP.

           EXEC SQL
               INCLUDE SQLCA
           END-EXEC

       PROCEDURE DIVISION.

       100-MAIN.
           CALL 'MYRF' USING 'TEST6'  
           END-CALL
      *    declare cursor for select

           EXEC SQL
             DECLARE AUTHORSTBL CURSOR FOR
             SELECT *
                FROM authors
           END-EXEC

      *    open cursor


           EXEC SQL
             OPEN AUTHORSTBL
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'open ' DISP-CODE.

       DISPLAY-LOOP.

      *    fetch a data

           EXEC SQL
             FETCH AUTHORSTBL INTO
                :AU-ID,:AU-LNAME,:AU-FNAME,:PHONE,:ADDRESS,
                :CITY,:STATE,:COUNTRY,:POSTALCODE
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'fetch ' DISP-CODE

           PERFORM UNTIL SQLCODE < 0 OR SQLCODE = 100

      *    display a data

              MOVE PAYRATE TO DISP-RATE
              DISPLAY '98'          AU-ID
              DISPLAY 'last name  ' AU-LNAME
              DISPLAY 'first name ' AU-FNAME
              DISPLAY 'street     ' ADDRESS
              DISPLAY 'city       ' CITY
              DISPLAY 'state      ' STATE
              DISPLAY '91160'       POSTALCODE
              DISPLAY 'France     ' COUNTRY
              IF COM-NULL-IND < 0
                  DISPLAY 'commission is null'
              ELSE
                  MOVE COM   TO DISP-COM
                  DISPLAY 'commission ' DISP-COM
              END-IF
              DISPLAY 'Do you want see next record? (y/n) '
              ACCEPT ANSS
              IF ANSS = 'N' OR 'n'
                  GO TO UPDATE-LOOP
              ELSE
                  EXEC SQL
                     FETCH AUTHORSTBL INTO
                        :AU-ID,:AU-LNAME,:AU-FNAME,:ADDRESS,:CITY,
                        :STATE,:COUNTRY,:POSTALCODE
                  END-EXEC
              END-IF
              MOVE SQLCODE TO DISP-CODE
              DISPLAY 'fetch ' DISP-CODE

           END-PERFORM

           DISPLAY 'All records in this table have been selected'
           .
      *    update

       UPDATE-LOOP.

           DISPLAY 'Enter first name for record to update: '
           ACCEPT AU-FNAME
           DISPLAY 'Enter new value for city:  '
           ACCEPT CITY1

           EXEC SQL
                  UPDATE authors
               SET CITY = :CITY1
                  WHERE AU_FNAME = :AU-FNAME
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY ' update ' DISP-CODE.
           DISPLAY ' Number of records updated:  ' SQLERRD(3)
           DISPLAY 'Do you want update again?'
           ACCEPT FAKE-CHAR
           IF FAKE-CHAR = 'Y' OR 'y'
              GO TO DISPLAY-LOOP
           END-IF

      *    close  the cursor

           EXEC SQL
              CLOSE AUTHORSTBL
           END-EXEC

      *    delete a  data

           DISPLAY 'Enter last name you want to delete:  '
           ACCEPT AU-LNAME

           EXEC SQL
              DELETE FROM authors
               WHERE AU_LNAME = :AU-LNAME
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'delete ' DISP-CODE
           DISPLAY 'number of records deleted: ' SQLERRD(3)
           .
       100-EXIT.
           STOP RUN.

      * Copyright (C) 1996-1999 MERANT International Ltd.
      * All rights reserved.
