       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST1.
       AUTHOR. MR HU.
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
       01 COM-NULL-IND         PIC S9(4) COMP.
       01 SQL-STMT             PIC X(256).

           EXEC SQL
               INCLUDE SQLCA
           END-EXEC

       PROCEDURE DIVISION.

       100-MAIN.
           CALL 'MYRF' USING 'TEST1'  
           END-CALL
      *
      *  IMS calls
      *
           EXEC DLI
               SCHD PSB(TEST1)
           END-EXEC 
           EXEC DLI GU
                    USING PCB(1)
                    SEGMENT(AUTHORS)
           END-EXEC          
	   EXEC DLI GN
                    USING PCB(1)
                    SEGMENT(TITLES)
           END-EXEC
           EXEC DLI GNP
                    USING PCB(1)
                    SEGMENT(AUTHORS)
                    SEGMENT(MYRF)
           END-EXEC

      *  declare a cursor so we can check insert
	     MOVE 'DECLARE AUTHORSTBL cursor for
      -         'SELECT * FROM authors WHERE
      -         'AU_LNAME = "MCGRUFF"'
           TO SQL-STMT
           EXEC SQL
              DECLARE AUTHORSTBL cursor for
              SELECT * FROM authors WHERE
              AU_LNAME = "MCGRUFF"
           END-EXEC

      * insert a data into specified table
           MOVE 'INSERT INTO authors
      -         '(AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,
      -         'COUNTRY,POSTALCODE)
      -         'VALUES
      -         '("11","McGruff","Jerry","0164483445",
      -         '"2345 Copeland Dr", "Byzantine",
      -         '"IL","FRANCE","1050")'
           TO SQL-STMT
           EXEC SQL
              INSERT INTO authors
               (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,
                COUNTRY,POSTALCODE)
              VALUES
               ("11","McGruff","Jerry","0164483445",
                "2345 Copeland Dr", "Byzantine",
                "IL","FRANCE","1050")
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'insert ' DISP-CODE

      *    Now let's check if it was inserted

           MOVE 'McGruff' to AU-LNAME

      *    Open the cursor
           MOVE 'OPEN AUTHORSTBL' 
           TO SQL-STMT
           EXEC SQL
                OPEN AUTHORSTBL
           END-EXEC

      *    fetch a data
           MOVE 'FETCH AUTHORSTBL INTO
      -         ':AU-ID,:AU-LNAME,:AU-FNAME,:PHONE,:ADDRESS,:CITY,
      -         ':STATE,:COUNTRY,:POSTALCODE'
           TO SQL-STMT
           EXEC SQL
             FETCH AUTHORSTBL INTO
                :AU-ID,:AU-LNAME,:AU-FNAME,:PHONE,:ADDRESS,:CITY,
                :STATE,:COUNTRY,:POSTALCODE
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'fetch ' DISP-CODE

           DISPLAY 'Last name of record inserted is:  ' AU-LNAME

      *    Close the cursor
           MOVE 'CLOSE AUTHORSTBL' 
           TO SQL-STMT
           EXEC SQL
              CLOSE AUTHORSTBL
           END-EXEC

      *    delete the record inserted using  execute immediate
           MOVE 'SQL EXECUTE IMMEDIATE
      -         '''DELETE FROM authors
      -         '''  WHERE AU-LNAME = "McGruff"''' 
           TO SQL-STMT
           EXEC SQL EXECUTE IMMEDIATE
             'DELETE FROM authors
      -      '  WHERE AU-LNAME = "McGruff"'
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY 'delete ' DISP-CODE

           DISPLAY 'number of rows deleted: ' SQLERRD(3)

           .
       100-EXIT.
           STOP RUN.

      * Copyright (C) 1996-1999 MERANT International Ltd.
      * All rights reserved.

