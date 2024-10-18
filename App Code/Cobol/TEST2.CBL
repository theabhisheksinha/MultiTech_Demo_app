       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST2.
       AUTHOR. MR. WEILIANG HU.
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

       01 DISP-RATE            PIC $$$,$$$,$$9.99.
       01 DISP-COM             PIC Z.99.
       01 DISP-CODE            PIC ----9.
       01 FAKE-CHAR            PIC X.
       01 ANSS                 PIC X.
       01 COM-NULL-IND         PIC S9(4) COMP.


           EXEC SQL
               INCLUDE SQLCA
           END-EXEC

       PROCEDURE DIVISION.

       100-MAIN.
           CALL 'MYRF' USING 'TEST2'  
           END-CALL

      *    declare cursor for select

           EXEC SQL
             DECLARE AUTHORSTBL CURSOR FOR
             SELECT *
                FROM authors
                ORDER BY AU_LNAME
           END-EXEC

      *    open cursor

           EXEC SQL
             OPEN AUTHORSTBL
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'open ' DISP-CODE

      *    fetch a data

           EXEC SQL
             FETCH AUTHORSTBL INTO
                :AU-ID,:AU-LNAME,:AU-FNAME,:PHONE,:ADDRESS,
                :CITY,:STATE,:COUNTRY,:POSTALCODE
           END-EXEC.

       100-test.

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'fetch ' DISP-CODE

      *    loop until no more data

           PERFORM UNTIL SQLCODE < 0 OR SQLCODE = 100

      *    display the record

              MOVE PAYRATE TO DISP-RATE
              DISPLAY 'au_id      ' AU_ID
              DISPLAY 'last name  ' AU_LNAME
              DISPLAY 'first name ' AU_FNAME
              DISPLAY 'address    ' ADDRESS
              DISPLAY 'city       ' CITY
              DISPLAY 'state      ' STATE
              DISPLAY 'postalcode ' POSTALCODE
              DISPLAY 'country    ' COUNTRY
              IF COM-NULL-IND < 0
                  DISPLAY 'commission is null'
              ELSE
                  MOVE COM   TO DISP-COM
                  DISPLAY 'commission ' DISP-COM
              END-IF
              DISPLAY 'Do you want see next record? (y/n) '
              ACCEPT ANSS
              IF ANSS = 'Y' OR 'y'
                  EXEC SQL
                      FETCH AUTHORSTBL INTO
                      :AU-ID,:AU-LNAME,:AU-FNAME,:PHONE,:ADDRESS,
                      :CITY,:STATE,:COUNTRY,:POSTALCODE
                  END-EXEC
              ELSE
                  GO TO CLOSE-LOOP
              END-IF
              MOVE SQLCODE TO DISP-CODE
              DISPLAY 'fetch ' DISP-CODE
           END-PERFORM
     
           DISPLAY 'All records in this table have been selected'.

       CLOSE-LOOP.
      *    close  the cursor

           EXEC SQL
              CLOSE AUTHORSTBL
           END-EXEC
           .
       100-EXIT.
           STOP RUN.

      * Copyright (C) 1996-1999 MERANT International Ltd.
      * All rights reserved.
