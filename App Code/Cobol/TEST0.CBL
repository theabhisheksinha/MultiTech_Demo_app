       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST0.
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

	 01 SQL-STMT             PIC X(256).

           EXEC SQL
               INCLUDE SQLCA
           END-EXEC

       PROCEDURE DIVISION.

       100-MAIN.

      *    delete the record inserted using  execute immediate
           MOVE "SQL EXECUTE IMMEDIATE
      -       """DELETE FROM authors
      -       """  WHERE AU-LNAME = 'McGruff'""" 
           TO SQL-STMT
           EXEC SQL EXECUTE IMMEDIATE
             "DELETE FROM authors
      -      "  WHERE AU_LNAME = 'McGruff'"
           END-EXEC

           EXEC SQL 
             DELETE FROM authors
             WHERE AU_LNAME = 'McGruff'
           END-EXEC

           MOVE SQLCODE TO DISP-CODE
           DISPLAY "delete " DISP-CODE

           DISPLAY "number of rows deleted: " SQLERRD(3)

      *    Call stored procedures 
           EXEC SQL CALL byroyalty(:au_id,:state)
           END-EXEC 
	     EXEC SQL EXECUTE
                BEGIN
                   :return-title := defectspkg.Ctrl_Title(:au_lname);
               END;
           END-EXEC
           .
       100-EXIT.
           STOP RUN.

      * Copyright (C) 1996-1999 MERANT International Ltd.
      * All rights reserved.

