       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST5.
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
       01 DISP-HOURS           PIC ZZ,ZZ9.
       01 DISP-CODE            PIC ----9.
       01 FAKE-CHAR            PIC X.
       01 ANSS                 PIC X.

           EXEC SQL
               INCLUDE SQLCA
           END-EXEC

       PROCEDURE DIVISION.

       100-MAIN.
           CALL 'MYRF' USING 'TEST5'  
           END-CALL
      *    prepare insert

           EXEC SQL PREPARE authors-INSERT FROM
              'INSERT INTO authors
      -       '   VALUES (?,?,?,?,?,?,?,?,?,?)'
           END-EXEC
       
           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'prepare' DISP-CODE

           MOVE 99         TO AU_ID
           MOVE 'JOHN'     TO AU_LNAME
           MOVE 'THAO'     TO AU_FNAME
           MOVE 'HYTALLSI' TO CITY
           MOVE 'HAMILTON' TO ADDRESS
           MOVE '89'       TO STATE
           MOVE '12345'    TO POSTALCODE
           
           DISPLAY 'payrate' PAYRATE
      *    execute insert

           EXEC SQL
                EXECUTE authors-INSERT USING
                :AU-ID,:AU-LNAME,:AU-FNAME,:PHONE,:ADDRESS,:CITY,
                :STATE,:COUNTRY,:POSTALCODE
           END-EXEC
           
           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'execute' DISP-CODE
           .
       100-EXIT.
           STOP RUN.

      * Copyright (C) 1996-1999 MERANT International Ltd.
      * All rights reserved.
