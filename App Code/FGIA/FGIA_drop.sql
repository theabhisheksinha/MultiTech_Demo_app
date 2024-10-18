/******************************************************************************/
/*** ----------------------------------------------------------------------- **/
/*** Release builder 4.1                                  (generated script) **/
/*** ----------------------------------------------------------------------- **/
/******************************************************************************/
/* Server name    : O90QA5                             */
/* Oracle version : 9.0.1.1.1                          */
/* Schema         : FGIA                               */
/* Date & Time    : April 02, 2002 at 03:05 PM         */
/*******************************************************/



/******************************************************************************/
/** Generated Script (DROP): Triggers                                        **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

DROP TRIGGER DELTITLE
/

DROP TRIGGER ON_DELETE_AUTHORS
/

DROP TRIGGER TOTALSALES_TRIG
/

DROP TRIGGER TRG_TEST
/

DROP TRIGGER UPDTITLES
/


/******************************************************************************/
/** Generated Script (DROP): Package bodies                                  **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

DROP PACKAGE BODY AUTHORSPKG
/

DROP PACKAGE BODY DEFECTSPKG
/

DROP PACKAGE BODY PACK_COMP
/

DROP PACKAGE BODY PACK_DEBUG
/

DROP PACKAGE BODY PK1
/

DROP PACKAGE BODY SALEPKG
/

DROP PACKAGE BODY SALESMANAGEMENTPKG
/

DROP PACKAGE BODY STOCKPKG
/

DROP PACKAGE BODY STOREPKG
/

DROP PACKAGE BODY TITLEPKG
/


/******************************************************************************/
/** Generated Script (DROP): Packages                                        **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

DROP PACKAGE AUTHORSPKG
/

DROP PACKAGE BYROYALTYPKG
/

DROP PACKAGE CREATENEWORDERLINEPKG
/

DROP PACKAGE DEFECTSPKG
/

DROP PACKAGE DELIVERORDERLINEPKG
/

DROP PACKAGE DISCOUNT_PROCPKG
/

DROP PACKAGE GETALLTITLESPKG
/

DROP PACKAGE GETAUTHORSPKG
/

DROP PACKAGE HISTORY_PROCPKG
/

DROP PACKAGE PACK_COMP
/

DROP PACKAGE PACK_DEBUG
/

DROP PACKAGE PK1
/

DROP PACKAGE SALEPKG
/

DROP PACKAGE SALESMANAGEMENTPKG
/

DROP PACKAGE STOCKPKG
/

DROP PACKAGE STOREPKG
/

DROP PACKAGE TITLEPKG
/


/******************************************************************************/
/** Generated Script (DROP): Procedures                                      **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

DROP PROCEDURE BYROYALTY
/

DROP PROCEDURE DISCOUNT_PROC
/

DROP PROCEDURE GETAUTHORS
/

DROP PROCEDURE HISTORY_PROC
/

DROP PROCEDURE P1AP
/

DROP PROCEDURE P1SP
/

DROP PROCEDURE P2SP
/

DROP PROCEDURE PPP_COMP
/

DROP PROCEDURE PP_COMP
/

DROP PROCEDURE PP_OBJ
/

DROP PROCEDURE PROC2_COMP
/

DROP PROCEDURE PROC3_COMP
/

DROP PROCEDURE PROC_COMP
/

DROP PROCEDURE PROC_DEBUG
/

DROP PROCEDURE PROC_DEFECTS
/

DROP PROCEDURE PROC_OBJ
/

DROP PROCEDURE PROC_SYN_PPP_COMP
/

DROP PROCEDURE P_ADD_DEFECTS
/

DROP PROCEDURE P_COMP
/

DROP PROCEDURE P_SYN_DEBUG
/


/******************************************************************************/
/** Generated Script (DROP): Functions                                       **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

DROP FUNCTION CREATENEWINVOICE
/

DROP FUNCTION CREATENEWINVOICELINES
/

DROP FUNCTION CREATENEWORDERLINE
/

DROP FUNCTION CREATENEWORDERS
/

DROP FUNCTION CREATEORDERSINVOICE
/

DROP FUNCTION DELETEALLINVOICE
/

DROP FUNCTION DELETEALLORDERS
/

DROP FUNCTION DELIVERORDER
/

DROP FUNCTION DELIVERORDERLINE
/

DROP FUNCTION D_INVOICE_LINE
/

DROP FUNCTION F1AP
/

DROP FUNCTION F1SP
/

DROP FUNCTION F2SP
/

DROP FUNCTION FCT4_COMP
/

DROP FUNCTION FCT_COMP
/

DROP FUNCTION FCT_DEFECTS
/

DROP FUNCTION FCT_OBJ
/

DROP FUNCTION FF_COMP
/

DROP FUNCTION FONCTION_DEBUG
/

DROP FUNCTION I_INVOICE
/

DROP FUNCTION I_INVOICE_LINE
/

DROP FUNCTION I_ORDERS
/

DROP FUNCTION I_ORDER_LINE
/


/******************************************************************************/
/** Generated Script (DROP): Views                                           **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

DROP VIEW AUTHORIDCODES
/

DROP VIEW AVAILABLE_DELIVERY
/

DROP VIEW COMPOSITE
/

DROP VIEW STOREIDVIEW
/

DROP VIEW TITLEVIEW
/

DROP VIEW VIEWTITLEAUTHOR
/


/******************************************************************************/
/** Generated Script (DROP): Indexes                                         **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

DROP INDEX AUNMIND
/

DROP INDEX PK_INVOICE_LINE
/

DROP INDEX PK_ORDER_LINE
/

DROP INDEX ROYTITIDIND
/

DROP INDEX SALESDETAILIND
/

DROP INDEX SALTITIDIND
/

DROP INDEX TAUTIDIND
/

DROP INDEX TITLEAUTHO_8125299281
/

DROP INDEX TITLEIDIND
/

DROP INDEX TITLEIND
/


/******************************************************************************/
/** Generated Script (DROP): Foreign key constraints                         **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

ALTER TABLE DEFECTS
DROP CONSTRAINT DEFECTS_TITLES
/

ALTER TABLE DISCOUNTS
DROP CONSTRAINT FK__DISCOUNTS__STOR___5AEE82B9
/

ALTER TABLE ROYSCHED
DROP CONSTRAINT FK__ROYSCHED__TITLE___59FA5E80
/

ALTER TABLE SALESDETAIL
DROP CONSTRAINT FK__SALESDETAIL__5535A963
/

ALTER TABLE STOCK_LINE
DROP CONSTRAINT FK__STOCK_LIN__STOR___571DF1D5
/

ALTER TABLE STOCK_LINE
DROP CONSTRAINT FK__STOCK_LIN__TITLE__5812160E
/

ALTER TABLE STOCK
DROP CONSTRAINT FK__STOCK__STOR_ID__5629CD9C
/

ALTER TABLE TITLEAUTHOR
DROP CONSTRAINT FK__TITLEAUTH__AU_ID__534D60F1
/

ALTER TABLE TITLEAUTHOR
DROP CONSTRAINT FK__TITLEAUTH__TITLE__5441852A
/

ALTER TABLE TITLES
DROP CONSTRAINT FK__TITLES__PUB_ID__59063A47
/

ALTER TABLE INVOICE_LINE
DROP CONSTRAINT INVOICE_LINE_INVOICE
/

ALTER TABLE INVOICE_LINE
DROP CONSTRAINT INVOICE_LINE_TITLES
/

ALTER TABLE INVOICE
DROP CONSTRAINT INVOICE_SALES
/

ALTER TABLE ORDER_LINE
DROP CONSTRAINT ORDER_LINE_ORDER
/

ALTER TABLE ORDER_LINE
DROP CONSTRAINT ORDER_LINE_TITLES
/

ALTER TABLE SALESDETAIL
DROP CONSTRAINT SALESDETAIL_TITLES
/


/******************************************************************************/
/** Generated Script (DROP): Primary/Unique key constraints                  **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

ALTER TABLE AUTHORS
DROP CONSTRAINT AUIDIND
/

ALTER TABLE DISCOUNTS
DROP CONSTRAINT DISCOUNTS_1481955782
/

ALTER TABLE DEFECTS
DROP PRIMARY KEY
/

ALTER TABLE INVOICE
DROP CONSTRAINT PK_INVOICE
/

ALTER TABLE ORDERS
DROP CONSTRAINT PK_ORDERS
/

ALTER TABLE PUBLISHERS
DROP CONSTRAINT PK_PUBLISHERS
/

ALTER TABLE SALES
DROP CONSTRAINT PK_SALES
/

ALTER TABLE STOCK
DROP CONSTRAINT PK_STOCK
/

ALTER TABLE STOCK_LINE
DROP CONSTRAINT PK_STOCK_LINE
/

ALTER TABLE STORES
DROP CONSTRAINT PK_STORES
/

ALTER TABLE TITLES
DROP CONSTRAINT PK_TITLES
/

ALTER TABLE TEST_DEBUG
DROP CONSTRAINT UNQ_ID
/


/******************************************************************************/
/** Generated Script (DROP): Check constraints                               **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

ALTER TABLE PUBLISHERS
DROP CONSTRAINT RUL_PUBLISHERS_PUB_ID
/


/******************************************************************************/
/** Generated Script (DROP): Tables                                          **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

DROP TABLE AUTHORS CASCADE CONSTRAINTS
/

DROP TABLE DEFECTS CASCADE CONSTRAINTS
/

DROP TABLE DISCOUNTS CASCADE CONSTRAINTS
/

DROP TABLE INVOICE CASCADE CONSTRAINTS
/

DROP TABLE INVOICE_LINE CASCADE CONSTRAINTS
/

DROP TABLE ORDERS CASCADE CONSTRAINTS
/

DROP TABLE ORDER_LINE CASCADE CONSTRAINTS
/

DROP TABLE PUBLISHERS CASCADE CONSTRAINTS
/

DROP TABLE ROYSCHED CASCADE CONSTRAINTS
/

DROP TABLE SALES CASCADE CONSTRAINTS
/

DROP TABLE SALESDETAIL CASCADE CONSTRAINTS
/

DROP TABLE STOCK CASCADE CONSTRAINTS
/

DROP TABLE STOCK_LINE CASCADE CONSTRAINTS
/

DROP TABLE STORES CASCADE CONSTRAINTS
/

DROP TABLE TEST_DEBUG CASCADE CONSTRAINTS
/

DROP TABLE TITLEAUTHOR CASCADE CONSTRAINTS
/

DROP TABLE TITLES CASCADE CONSTRAINTS
/


/******************************************************************************/
/** Generated Script (DROP): Synonyms                                        **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

DROP SYNONYM SYN_PPP_COMP
/

DROP SYNONYM SYN_TEST_DEBUG
/


/******************************************************************************/
/** Generated Script (DROP): Sequences                                       **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

DROP SEQUENCE SEQ_DEFECTS
/


/******************************************************************************/
/** Generated Script (DROP): Types                                           **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

DROP TYPE OBJ_FGIA FORCE
/

