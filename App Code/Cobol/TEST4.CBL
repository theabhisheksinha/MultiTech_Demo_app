       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST4.
       AUTHOR. MR. HU
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

       01 TITLE_ID             PIC S9(4) COMP.
       01 DISP-RATE            PIC $$$,$$$,$$9.99.
       01 DISP-HOURS           PIC ZZ,ZZ9.
       01 DISP-CODE            PIC ----9.
       01 FAKE-CHAR            PIC X.
       01 ANSS                 PIC X.

           EXEC SQL
               INCLUDE SQLCA
           END-EXEC.

       PROCEDURE DIVISION.

       100-MAIN.
           CALL 'MYRF' USING 'TEST4'  
           END-CALL
           
           DISPLAY ' This program tests joining tables '

      *    declare cursor for select

           EXEC SQL
             DECLARE AUTHORSTBL CURSOR for
             SELECT A.AU_LNAME ,T.TITLE_ID
                    FROM authors A,titleauthor T
                    WHERE A.AU_ID = T.AU_ID
           END-EXEC

      *    open datadase for your cursor

           EXEC SQL
             OPEN AUTHORSBL
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'open ' DISP-CODE

      *    fetch a data

           EXEC SQL
             FETCH AUTHORSTBL INTO :AU_LNAME, :TITLE_ID
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'fetch ' DISP-CODE

           PERFORM UNTIL SQLCODE < 0 OR SQLCODE = 100

      *    display a data

              DISPLAY 'last name  ' AU_LNAME
              DISPLAY 'manager '    TITLE_ID
              EXEC SQL
                FETCH authors INTO :AU_LNAME ,:TITLE_ID
              END-EXEC
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
