       IDENTIFICATION DIVISION.
       PROGRAM-ID. MYRF2.
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
       LINKAGE SECTION.
       01  CALL-AREA      PIC X(80).
       PROCEDURE DIVISION USING CALL-AREA.
       01-MYRF.
           MOVE 'MYRF' TO CALL-AREA. 
           CALL CALL-AREA.
           GOBACK.
       END PROGRAM MYRF2.