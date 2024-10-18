/******************************************************************************/
/*** ----------------------------------------------------------------------- **/
/*** Release builder 4.2                                  (generated script) **/
/*** ----------------------------------------------------------------------- **/
/******************************************************************************/
/* Server name    : O817LVA                            */
/* Oracle version : 8.1.7.0.0                          */
/* Schema         : IMPACTS                            */
/* Date & Time    : September 27, 2002 at 03:05 PM     */
/*******************************************************/



/******************************************************************************/
/** Generated Script (CREATE): Sequences                                     **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

CREATE SEQUENCE I5_IMP_SEQ
 MINVALUE 1
 MAXVALUE 999999999999999999999999999
 INCREMENT BY 2
 START WITH 9
 NOCACHE
/


/******************************************************************************/
/** Generated Script (CREATE): Synonyms                                      **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

CREATE SYNONYM I2_SYN_TAB1 FOR I2_IMP_TABLE1
/

CREATE SYNONYM I3_SYN_FCT2 FOR I3_CALLFCT2
/

CREATE SYNONYM I3_SYN_TAB1 FOR I3_TABLE1
/

CREATE SYNONYM I4_SYN_FCT2 FOR I4_CALLFCT2
/

CREATE SYNONYM I4_SYN_TAB1 FOR I4_TABLE1
/

CREATE SYNONYM SYN_TAB1 FOR IMP_TABLE1
/


/******************************************************************************/
/** Generated Script (CREATE): Tables                                        **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

CREATE TABLE COLTABLE (
  COL1                                          CHAR(4)             NOT NULL  ,
  COL2                                          NUMBER(10,0)        NOT NULL  ,
  COL3                                          VARCHAR2(30)        NOT NULL  
)

/

CREATE TABLE I2_IMP_TABLE1 (
  T1_COL1                                       NUMBER(10,0)        NOT NULL  ,
  T1_COL2                                       VARCHAR2(255)       NOT NULL  ,
  T1_COL3                                       DATE                NOT NULL  ,
  T1_COL4                                       NUMBER              NULL      
)

/

CREATE TABLE I2_IMP_TABLE2 (
  T2_COL1                                       NUMBER(10,0)        NOT NULL  ,
  T2_COL2                                       VARCHAR2(255)       NOT NULL  
)

/

CREATE TABLE I3_TABLE1 (
  T1_COL1                                       NUMBER(10,0)        NOT NULL  ,
  T1_COL2                                       VARCHAR2(255)       NOT NULL  ,
  T1_COL3                                       DATE                NOT NULL  ,
  T1_COL4                                       NUMBER              NULL      
)

/

CREATE TABLE I3_TABLE2 (
  T2_COL1                                       NUMBER(10,0)        NOT NULL  ,
  T2_COL2                                       VARCHAR2(255)       NOT NULL  
)

/

CREATE TABLE I4_TABLE1 (
  T1_COL1                                       NUMBER(10,0)        NOT NULL  ,
  T1_COL2                                       VARCHAR2(255)       NOT NULL  ,
  T1_COL3                                       DATE                NOT NULL  ,
  T1_COL4                                       NUMBER              NULL      
)

/

CREATE TABLE I4_TABLE2 (
  T2_COL1                                       NUMBER(10,0)        NOT NULL  ,
  T2_COL2                                       VARCHAR2(255)       NOT NULL  
)

/

CREATE TABLE I5_TABLE1 (
  COL                                           NUMBER(10,0)        NOT NULL  
)

/

CREATE TABLE I6_TABLE1 (
  T1_COL1                                       NUMBER(10,0)        NOT NULL  ,
  T1_COL2                                       VARCHAR2(255)       NOT NULL  ,
  T1_COL3                                       DATE                NOT NULL  ,
  T1_COL4                                       NUMBER              NULL      
)

/

CREATE TABLE I7_TABLE1 (
  T1_COL1                                       NUMBER(10,0)        NOT NULL  ,
  T1_COL2                                       VARCHAR2(255)       NOT NULL  ,
  T1_COL3                                       DATE                NOT NULL  ,
  T1_COL4                                       NUMBER              NULL      
)

/

CREATE TABLE I8_TABLE1 (
  T1_COL1                                       NUMBER(10,0)        NOT NULL  ,
  T1_COL2                                       VARCHAR2(255)       NOT NULL  ,
  T1_COL3                                       DATE                NOT NULL  ,
  T1_COL4                                       NUMBER              NULL      
)

/

CREATE TABLE IMP_TABLE1 (
  T1_COL1                                       NUMBER(10,0)        NOT NULL  ,
  T1_COL2                                       VARCHAR2(255)       NOT NULL  ,
  T1_COL3                                       DATE                NOT NULL  ,
  T1_COL4                                       NUMBER              NULL      
)

/

CREATE TABLE IMP_TABLE2 (
  T2_COL1                                       NUMBER(10,0)        NOT NULL  ,
  T2_COL2                                       VARCHAR2(255)       NOT NULL  
)

/


/******************************************************************************/
/** Generated Script (CREATE): Check constraints                             **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

ALTER TABLE I3_TABLE1
ADD CHECK( "T1_COL1" IS NOT NULL )
/

ALTER TABLE I3_TABLE1
ADD CHECK( "T1_COL2" IS NOT NULL )
/

ALTER TABLE I3_TABLE1
ADD CHECK( "T1_COL3" IS NOT NULL )
/

ALTER TABLE I3_TABLE2
ADD CHECK( "T2_COL1" IS NOT NULL )
/

ALTER TABLE I3_TABLE2
ADD CHECK( "T2_COL2" IS NOT NULL )
/

ALTER TABLE I4_TABLE1
ADD CHECK( "T1_COL1" IS NOT NULL )
/

ALTER TABLE I4_TABLE1
ADD CHECK( "T1_COL2" IS NOT NULL )
/

ALTER TABLE I4_TABLE1
ADD CHECK( "T1_COL3" IS NOT NULL )
/

ALTER TABLE I4_TABLE2
ADD CHECK( "T2_COL1" IS NOT NULL )
/

ALTER TABLE I4_TABLE2
ADD CHECK( "T2_COL2" IS NOT NULL )
/

ALTER TABLE I6_TABLE1
ADD CHECK( "T1_COL1" IS NOT NULL )
/

ALTER TABLE I6_TABLE1
ADD CHECK( "T1_COL2" IS NOT NULL )
/

ALTER TABLE I6_TABLE1
ADD CHECK( "T1_COL3" IS NOT NULL )
/

ALTER TABLE I7_TABLE1
ADD CHECK( "T1_COL1" IS NOT NULL )
/

ALTER TABLE I7_TABLE1
ADD CHECK( "T1_COL2" IS NOT NULL )
/

ALTER TABLE I7_TABLE1
ADD CHECK( "T1_COL3" IS NOT NULL )
/

ALTER TABLE I8_TABLE1
ADD CHECK( "T1_COL1" IS NOT NULL )
/

ALTER TABLE I8_TABLE1
ADD CHECK( "T1_COL2" IS NOT NULL )
/

ALTER TABLE I8_TABLE1
ADD CHECK( "T1_COL3" IS NOT NULL )
/


/******************************************************************************/
/** Generated Script (CREATE): Views                                         **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

CREATE OR REPLACE FORCE VIEW I2_VIEWONTAB1
(T1_COL1,T1_COL2,T1_COL3,T1_COL4)
AS
select "T1_COL1","T1_COL2","T1_COL3","T1_COL4" from I2_IMP_TABLE1
/

CREATE OR REPLACE FORCE VIEW I3_VIEWONTAB1
(T1_COL1,T1_COL2,T1_COL3,T1_COL4)
AS
select "T1_COL1","T1_COL2","T1_COL3","T1_COL4" from I3_TABLE1
/

CREATE OR REPLACE FORCE VIEW I4_VIEWONTAB1
(T1_COL1,T1_COL2,T1_COL3,T1_COL4)
AS
select "T1_COL1","T1_COL2","T1_COL3","T1_COL4" from I4_TABLE1
/

CREATE OR REPLACE FORCE VIEW VIEWCOL1
(COL1)
AS
select COL1 from COLTABLE
/

CREATE OR REPLACE FORCE VIEW VIEWCOL2
(COL2)
AS
select COL2 from COLTABLE
/

CREATE OR REPLACE FORCE VIEW VIEWCOL3
(COL3)
AS
select COL3 from COLTABLE
/

CREATE OR REPLACE FORCE VIEW VIEWCOLTABLE
(COL1,COL2,COL3)
AS
select COL1, COL2, COL3 from COLTABLE
/

CREATE OR REPLACE FORCE VIEW VIEWONTAB1
(T1_COL1,T1_COL2,T1_COL3,T1_COL4)
AS
select "T1_COL1","T1_COL2","T1_COL3","T1_COL4" from IMP_TABLE1
/

CREATE OR REPLACE FORCE VIEW VIEWONVIEWCOLTABLE
(COL3)
AS
select COL3 from VIEWCOLTABLE
/


/******************************************************************************/
/** Generated Script (CREATE): Primary/Unique key constraints                **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

ALTER TABLE COLTABLE
ADD CONSTRAINT PK_COLTABLE PRIMARY KEY(COL1)
/

ALTER TABLE I2_IMP_TABLE1
ADD CONSTRAINT PK_I2_IMP_TAB1 PRIMARY KEY(T1_COL1)
/

ALTER TABLE I2_IMP_TABLE2
ADD CONSTRAINT PK_I2_IMP_TABLE2 PRIMARY KEY(T2_COL1)
/

ALTER TABLE I3_TABLE1
ADD CONSTRAINT PK_I3_TABLE1 PRIMARY KEY(T1_COL1)
/

ALTER TABLE I3_TABLE2
ADD CONSTRAINT PK_I3_TABLE2 PRIMARY KEY(T2_COL1)
/

ALTER TABLE I4_TABLE1
ADD CONSTRAINT PK_I4_TABLE1 PRIMARY KEY(T1_COL1)
/

ALTER TABLE I4_TABLE2
ADD CONSTRAINT PK_I4_TABLE2 PRIMARY KEY(T2_COL1)
/

ALTER TABLE I6_TABLE1
ADD CONSTRAINT PK_I6_TABLE1 PRIMARY KEY(T1_COL1)
/

ALTER TABLE I7_TABLE1
ADD CONSTRAINT PK_I7_TABLE1 PRIMARY KEY(T1_COL1)
/

ALTER TABLE I8_TABLE1
ADD CONSTRAINT PK_I8_TABLE1 PRIMARY KEY(T1_COL1)
/

ALTER TABLE IMP_TABLE1
ADD CONSTRAINT PK_IMP_TAB1 PRIMARY KEY(T1_COL1)
/

ALTER TABLE IMP_TABLE2
ADD CONSTRAINT PK_IMP_TABLE2 PRIMARY KEY(T2_COL1)
/


/******************************************************************************/
/** Generated Script (CREATE): Foreign key constraints                       **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

ALTER TABLE IMP_TABLE1
ADD CONSTRAINT IMP_TABLE1_IMP_TABLE2 FOREIGN KEY (T1_COL1) REFERENCES IMP_TABLE2(T2_COL1)
/

ALTER TABLE I2_IMP_TABLE1
ADD CONSTRAINT I2_IMP_TABLE1_I2_IMP_TABLE2 FOREIGN KEY (T1_COL1) REFERENCES I2_IMP_TABLE2(T2_COL1)
/


/******************************************************************************/
/** Generated Script (CREATE): Functions                                     **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

/******************************************************************************/
/** FUNCTION F_ONCOL1                          * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_ONCOL1 
Return  char
Is
	var1 char(4);
Begin
	select COL1 into var1 from COLTABLE;
	return var1;
End;
/

/******************************************************************************/
/** FUNCTION F_ONCOL2                          * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_ONCOL2 
Return number
Is
	var2 number(10);
Begin
	select COL2 into var2 from COLTABLE;
	return var2;
End;
/

/******************************************************************************/
/** FUNCTION F_ONCOL3                          * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_ONCOL3 (
	p_col3 OUT Varchar2
)
Return varchar
Is
Begin
	select COL3 into p_col3 from COLTABLE;
	return p_col3;
End;
/

/******************************************************************************/
/** FUNCTION F_ONFCOL3                         * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_ONFCOL3 (
	par3 OUT varchar2
)
Return varchar2
Is
	var3 varchar2(30);
Begin
	var3 := F_ONCOL3(par3);
	return var3;
End;
/

/******************************************************************************/
/** FUNCTION F_ONFONFCOL3                      * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_ONFONFCOL3 (
	par3 OUT varchar2
)
Return varchar2
Is
	var3 varchar2(30);
Begin
	var3 := F_ONFCOL3(par3);
	return var3;
End;
/

/******************************************************************************/
/** FUNCTION F_ONPCOL3                         * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_ONPCOL3 (
	par3 IN VARCHAR2
)
Return varchar2
Is
	var3 varchar2(30);
Begin
	P_ONPCOL3(par3);
	var3:='P_ONCOL3';
	return var3;
End;
/

/******************************************************************************/
/** FUNCTION F_ONPCOLS                         * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_ONPCOLS (
	par3 IN varchar2
)
Return char
Is
	var1 char(4);
Begin
	P_ONCOL1;
	P_ONCOL2;
	P_ONCOL3(par3);
	var1:='a';
	return var1;
End;
/

/******************************************************************************/
/** FUNCTION F_ONPKCOLS                        * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_ONPKCOLS 
Return number
Is
	var2 number(10);
Begin
	var2 := PK1_ONCOLTABLE.FPK1_ONCOL2;
	PK2_ONCOLTABLE.VARONCOL1 := 'abcd';
	PK3_ONCOLTABLE.PPK_ONCOL3;
	return var2;
End;
/

/******************************************************************************/
/** FUNCTION F_ONPKFCOL3                       * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_ONPKFCOL3 (
	par3 OUT varchar2
)
Return varchar2
Is
	var3 varchar2(30);
Begin
	var3 := PK_ONFCOL3.FPK_ONCOL3(par3);
	return var3;
End;
/

/******************************************************************************/
/** FUNCTION F_ONVIEWCOLS                      * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_ONVIEWCOLS 
Return number
Is
	var2 number(10);
Begin
	select COL2 into var2 from VIEWCOLTABLE;
	return var2;
End;
/

/******************************************************************************/
/** FUNCTION F_RET_COLTYP_T1_COL1              * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_RET_COLTYP_T1_COL1 
Return IMP_TABLE1.T1_COL1%TYPE
Is
Begin
	return null;
End;
/

/******************************************************************************/
/** FUNCTION F_RET_COLTYP_T1_COL1_2            * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_RET_COLTYP_T1_COL1_2 
Return SYN_TAB1.T1_COL1%TYPE
Is
Begin
	return null;
End;
/

/******************************************************************************/
/** FUNCTION F_RET_COLTYP_T1_COL1_3            * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_RET_COLTYP_T1_COL1_3 
Return VIEWONTAB1.T1_COL1%TYPE
Is
Begin
	return null;
End;
/

/******************************************************************************/
/** FUNCTION F_RET_ROWTYP_T1                   * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_RET_ROWTYP_T1 
Return IMP_TABLE1%ROWTYPE
Is
Begin
	return null;
End;
/

/******************************************************************************/
/** FUNCTION F_RET_ROWTYP_T1_2                 * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_RET_ROWTYP_T1_2 
Return SYN_TAB1%ROWTYPE
Is
Begin
	return null;
End;
/

/******************************************************************************/
/** FUNCTION F_RET_ROWTYP_T1_3                 * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_RET_ROWTYP_T1_3 
Return VIEWONTAB1%ROWTYPE
Is
Begin
	return null;
End;
/

/******************************************************************************/
/** FUNCTION F_USE_COLTYP_T1_COL1              * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_USE_COLTYP_T1_COL1 (
	PARAM1 IN IMP_TABLE1.T1_COL1%TYPE
)
Return NUMBER
Is
Begin
	return 1;
End;
/

/******************************************************************************/
/** FUNCTION F_USE_COLTYP_T1_COL1_2            * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_USE_COLTYP_T1_COL1_2 (
	PARAM1 IN SYN_TAB1.T1_COL1%TYPE
)
Return NUMBER
Is
Begin
	return 1;
End;
/

/******************************************************************************/
/** FUNCTION F_USE_COLTYP_T1_COL1_3            * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_USE_COLTYP_T1_COL1_3 (
	PARAM1 IN VIEWONTAB1.T1_COL1%TYPE
)
Return NUMBER
Is
Begin
	return 1;
End;
/

/******************************************************************************/
/** FUNCTION F_USE_ROWTYP_T1_COL1              * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_USE_ROWTYP_T1_COL1 (
	PARAM1 IN IMP_TABLE1%ROWTYPE
)
Return NUMBER
Is
Begin
	return 1;
	NULL;
End;
/

/******************************************************************************/
/** FUNCTION F_USE_ROWTYP_T1_COL1_2            * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_USE_ROWTYP_T1_COL1_2 (
	PARAM1 IN SYN_TAB1%ROWTYPE
)
Return NUMBER
Is
Begin
	return 1;
	NULL;
End;
/

/******************************************************************************/
/** FUNCTION F_USE_ROWTYP_T1_COL1_3            * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION F_USE_ROWTYP_T1_COL1_3 (
	PARAM1 IN VIEWONTAB1%ROWTYPE
)
Return NUMBER
Is
Begin
	return 1;
	NULL;
End;
/

/******************************************************************************/
/** FUNCTION I2_SYN1_ACCESS                    * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I2_SYN1_ACCESS 
Return number
Is
	toto number;
	cursor c is select * from I2_SYN_TAB1;
Begin
	select T1_COL1 into toto from I2_SYN_TAB1 where T1_COL1 = 1;
	return toto;
End;
/

/******************************************************************************/
/** FUNCTION I2_TBL1_ACCESS                    * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I2_TBL1_ACCESS 
Return number
Is
	toto number;
	cursor c is select * from I2_IMP_TABLE1;
Begin
	select T1_COL1 into toto from I2_IMP_TABLE1 where T1_COL1 = 1;
	return toto;
End;
/

/******************************************************************************/
/** FUNCTION I2_VEW1_ACCESS                    * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I2_VEW1_ACCESS 
Return number
Is
	toto number;
	cursor c is select * from I2_VIEWONTAB1;
Begin
	select T1_COL1 into toto from I2_VIEWONTAB1 where T1_COL1 = 1;
	return toto;
End;
/

/******************************************************************************/
/** FUNCTION I3_CALLFCT1                       * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I3_CALLFCT1 (
	PARAM1 OUT NUMBER
)
Return NUMBER
Is
	VAR1 NUMBER;
	VAR2 NUMBER;
Begin
	VAR1:=1;
	return I3_IMP_FONCTION(VAR1,VAR2);
End;
/

/******************************************************************************/
/** FUNCTION I3_CALLFCT2                       * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I3_CALLFCT2 
Return NUMBER
Is
	VAR1 NUMBER;
Begin
	return I3_CALLFCT1(VAR1);
End;
/

/******************************************************************************/
/** FUNCTION I3_FCALLPACK                      * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I3_FCALLPACK 
Return NUMBER
Is
Begin
	return I3_PACKAGE1.F1;
End;
/

/******************************************************************************/
/** FUNCTION I3_IMP_FONCTION                   * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I3_IMP_FONCTION (
	PARAM1 IN NUMBER,
	PARAM2 OUT NUMBER
)
Return NUMBER
Is
	TITI NUMBER;
Begin
	TITI:=1;
	return TITI;
End;
/

/******************************************************************************/
/** FUNCTION I4_CALLFCT2                       * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I4_CALLFCT2 
Return NUMBER
Is
	VAR1 NUMBER;
Begin
	return I4_FCALLPS1(VAR1);
End;
/

/******************************************************************************/
/** FUNCTION I4_FCALLPACK                      * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I4_FCALLPACK 
Return NUMBER
Is
Begin
	return I4_PACKAGE1.F1;
End;
/

/******************************************************************************/
/** FUNCTION I4_FCALLPS1                       * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I4_FCALLPS1 (
	PARAM1 OUT NUMBER
)
Return NUMBER
Is
	VAR2 NUMBER;
Begin
	I4_IMP_PROCEDURE(PARAM1,VAR2);
	return VAR2;
End;
/

/******************************************************************************/
/** FUNCTION I5_CALFCT1                        * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I5_CALFCT1 
Return number
Is
Begin
	return I5_FCT1_SEQ;
End;
/

/******************************************************************************/
/** FUNCTION I5_FCT1_SEQ                       * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I5_FCT1_SEQ 
Return NUMBER
Is
	SQ_VAL number;
Begin
	select I5_IMP_SEQ.NEXTVAL into SQ_VAL from dual;
End;
/

/******************************************************************************/
/** FUNCTION I5_FCT2_PACK                      * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I5_FCT2_PACK 
Return NUMBER
Is
Begin
	return I5_PACKAGE1.CURSEQVAL;
End;
/

/******************************************************************************/
/** FUNCTION I5_F_CALLPACK                     * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I5_F_CALLPACK (
	PARAM1 OUT NUMBER
)
Return NUMBER
Is
Begin
	I5_PACKAGE1.SEQCur(PARAM1);
	return I5_PACKAGE1.GetSEQ;
End;
/

/******************************************************************************/
/** FUNCTION I6_USEPCKDEF                      * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I6_USEPCKDEF (
	ROWS_INSERTED IN I6_IMP_PACKAGE_TYPE_DEFINITION.TYPTABL1
)
Return number
Is
Begin
	null;
End;
/

/******************************************************************************/
/** FUNCTION I6_USEPCKDEF2                     * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I6_USEPCKDEF2 (
	PARAM1 IN NUMBER
)
Return I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_REC
Is
	SingleRec I6_IMP_PACKAGE_TYPE_DEFINITION.REC1;
Begin
	SingleRec.Id:=1;
	SingleRec.Label:='TEST';
End;
/

/******************************************************************************/
/** FUNCTION I6_USEPCKDEF3                     * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I6_USEPCKDEF3 
Return I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_TABLE1
Is
	LIGNE I6_TABLE1%ROWTYPE;
	TABL1 I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_TABLE1; 
Begin
	TABL1(1):= LIGNE;
	return TABL1;
End;
/

/******************************************************************************/
/** FUNCTION I7_USEPCKDEF                      * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I7_USEPCKDEF 
Return number
Is
Begin
	I7_IMP_PACKAGE_VARDEF.VAR1:=1;
	open I7_IMP_PACKAGE_VARDEF.Cur1;
	open I7_IMP_PACKAGE_VARDEF.Cur2 (1);
	return 1;
End;
/

/******************************************************************************/
/** FUNCTION I8_USEPCKDEF                      * Object from Data Dictionary  */
/******************************************************************************/

CREATE OR REPLACE FUNCTION I8_USEPCKDEF 
Return number
Is
Begin
	I8_IMP_PACKAGE_OBJ.IMP_PROC(1);
	return I8_IMP_PACKAGE_OBJ.IMP_FNC(1);
End;
/


/******************************************************************************/
/** Generated Script (CREATE): Procedures                                    **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

/******************************************************************************/
/** PROCEDURE CALLPROC1                         * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE CALLPROC1 
Is
	titi IMP_TABLE1%ROWTYPE;
Begin
	USE_ROWTYP_T1_COL1(titi);

End;
/

/******************************************************************************/
/** PROCEDURE CALLPROC1_2                       * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE CALLPROC1_2 
Is
	titi SYN_TAB1%ROWTYPE;
Begin
	USE_ROWTYP_T1_COL1_2(titi);

End;
/

/******************************************************************************/
/** PROCEDURE CALLPROC1_3                       * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE CALLPROC1_3 
Is
	titi VIEWONTAB1%ROWTYPE;
Begin
	USE_ROWTYP_T1_COL1_3(titi);

End;
/

/******************************************************************************/
/** PROCEDURE CALLPROC2                         * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE CALLPROC2 
Is
	titi number;
Begin
	USE_COLTYP_T1_COL1 (titi);
End;
/

/******************************************************************************/
/** PROCEDURE CALLPROC2_2                       * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE CALLPROC2_2 
Is
	titi number;
Begin
	USE_COLTYP_T1_COL1_2 (titi);
End;
/

/******************************************************************************/
/** PROCEDURE CALLPROC2_3                       * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE CALLPROC2_3 
Is
	titi number;
Begin
	USE_COLTYP_T1_COL1_3 (titi);
End;
/

/******************************************************************************/
/** PROCEDURE CALLPROC3                         * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE CALLPROC3 
Is
Begin
	USE_ROWTYP_T1_COL1(F_RET_ROWTYP_T1);
End;
/

/******************************************************************************/
/** PROCEDURE CALLPROC3_2                       * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE CALLPROC3_2 
Is
Begin
	USE_ROWTYP_T1_COL1_2(F_RET_ROWTYP_T1_2);
End;
/

/******************************************************************************/
/** PROCEDURE CALLPROC3_3                       * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE CALLPROC3_3 
Is
Begin
	USE_ROWTYP_T1_COL1_3(F_RET_ROWTYP_T1_3);
End;
/

/******************************************************************************/
/** PROCEDURE CALLPROC4                         * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE CALLPROC4 
Is
Begin
	USE_COLTYP_T1_COL1 (F_RET_COLTYP_T1_COL1);
End;
/

/******************************************************************************/
/** PROCEDURE CALLPROC4_2                       * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE CALLPROC4_2 
Is
Begin
	USE_COLTYP_T1_COL1_2 (F_RET_COLTYP_T1_COL1_2);
End;
/

/******************************************************************************/
/** PROCEDURE CALLPROC4_3                       * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE CALLPROC4_3 
Is
Begin
	USE_COLTYP_T1_COL1_3 (F_RET_COLTYP_T1_COL1_3);
End;
/

/******************************************************************************/
/** PROCEDURE I2_P_SYN1_ACCESS                  * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I2_P_SYN1_ACCESS (
	TOTO OUT NUMBER
)
Is
	cursor c is select * from I2_SYN_TAB1;
Begin
	select T1_COL1 into TOTO from I2_SYN_TAB1 where T1_COL1 = 1;
End;
/

/******************************************************************************/
/** PROCEDURE I2_P_TAB1_ACCESS                  * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I2_P_TAB1_ACCESS (
	TOTO OUT NUMBER
)
Is
	cursor c is select * from I2_IMP_TABLE1;
Begin
	select T1_COL1 into TOTO from I2_IMP_TABLE1 where T1_COL1 = 1;
End;
/

/******************************************************************************/
/** PROCEDURE I2_P_VEW1_ACCESS                  * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I2_P_VEW1_ACCESS (
	TOTO OUT NUMBER
)
Is
	cursor c is select * from I2_VIEWONTAB1;
Begin
	select T1_COL1 into TOTO from I2_VIEWONTAB1 where T1_COL1 = 1;
End;
/

/******************************************************************************/
/** PROCEDURE I3_P_CALLFCT                      * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I3_P_CALLFCT (
	PARAM1 OUT NUMBER
)
Is
	VAR1 number;
	VAR2 number;
	VAR3 number;
Begin
	VAR3:=I3_IMP_FONCTION(VAR1,VAR2);
	PARAM1:=I3_IMP_FONCTION(VAR1,VAR2);
End;
/

/******************************************************************************/
/** PROCEDURE I3_P_CALLFCT2                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I3_P_CALLFCT2 
Is
	VAR1 number;
Begin
	I3_P_CALLFCT(VAR1);
End;
/

/******************************************************************************/
/** PROCEDURE I3_P_CALLFCT3                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I3_P_CALLFCT3 
Is
	VAR1 number;
Begin
	VAR1:=I3_CALLFCT2;
End;
/

/******************************************************************************/
/** PROCEDURE I3_P_CALLFCT4                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I3_P_CALLFCT4 
Is
	VAR1 number;
	VAR2 number;
	VAR3 number;
Begin
	VAR3:=I3_IMP_FONCTION(VAR1,VAR2);
	VAR1:=I3_CALLFCT2;
End;
/

/******************************************************************************/
/** PROCEDURE I3_P_CALLFCT5                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I3_P_CALLFCT5 
Is
	VAR1 number;
	VAR2 number;
	VAR3 number;
Begin
	VAR1:=I3_SYN_FCT2;
End;
/

/******************************************************************************/
/** PROCEDURE I3_P_CALLPACK                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I3_P_CALLPACK 
Is
	toto number;
Begin
	I3_PACKAGE1.P1;
	toto:=I3_PACKAGE1.F1;
	toto:=I3_PACKAGE1.MAIN;
End;
/

/******************************************************************************/
/** PROCEDURE I4_IMP_PROCEDURE                  * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I4_IMP_PROCEDURE (
	PARAM1 IN NUMBER,
	PARAM2 OUT NUMBER
)
Is
Begin
	PARAM2:=PARAM1;	
End;
/

/******************************************************************************/
/** PROCEDURE I4_P_CALLFCT2                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I4_P_CALLFCT2 
Is
	VAR1 number;
Begin
	I4_P_CALLPS(VAR1);
End;
/

/******************************************************************************/
/** PROCEDURE I4_P_CALLFCT3                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I4_P_CALLFCT3 
Is
	VAR1 number;
Begin
	VAR1:=I4_CALLFCT2;
End;
/

/******************************************************************************/
/** PROCEDURE I4_P_CALLPACK                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I4_P_CALLPACK 
Is
	toto number;
Begin
	I4_PACKAGE1.P1;
	toto:=I4_PACKAGE1.F1;
	toto:=I4_PACKAGE1.MAIN;
End;
/

/******************************************************************************/
/** PROCEDURE I4_P_CALLPS                       * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I4_P_CALLPS (
	PARAM1 OUT NUMBER
)
Is
	VAR1 number;
	VAR2 number;
	VAR3 number;
Begin
	I4_IMP_PROCEDURE(VAR1,VAR3);
	I4_IMP_PROCEDURE(VAR1,PARAM1);
End;
/

/******************************************************************************/
/** PROCEDURE I4_P_CALLPS4                      * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I4_P_CALLPS4 
Is
	VAR1 number;
	VAR2 number;
	VAR3 number;
Begin
	I4_IMP_PROCEDURE(VAR1,VAR2);
	VAR3:=I4_CALLFCT2;
End;
/

/******************************************************************************/
/** PROCEDURE I4_P_CALLPS5                      * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I4_P_CALLPS5 
Is
	VAR1 number;
	VAR2 number;
Begin
	VAR1:=1;
	I4_IMP_PROCEDURE(VAR1,VAR2);
End;
/

/******************************************************************************/
/** PROCEDURE I5_PS1_CALLFCT1                   * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I5_PS1_CALLFCT1 (
	PARAM1 OUT number
)
Is
Begin
	PARAM1:=I5_CALFCT1;
End;
/

/******************************************************************************/
/** PROCEDURE I5_PS1_SEQ                        * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I5_PS1_SEQ 
Is
Begin
	insert into I5_TABLE1 values (I5_IMP_SEQ.NEXTVAL);
End;
/

/******************************************************************************/
/** PROCEDURE I5_PS2_SEQ                        * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I5_PS2_SEQ 
Is
	VAR1 number;
Begin
	select I5_IMP_SEQ.CURRVAL into VAR1 from dual; 
End;
/

/******************************************************************************/
/** PROCEDURE I6_PROCUSETYP1                    * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I6_PROCUSETYP1 (
	PARAM1 OUT I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_TABLE1
)
Is
	TABL1 I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_TABLE1;
	ROWVALU I6_TABLE1%ROWTYPE; 
Begin
	TABL1(1):=ROWVALU;
	PARAM1:=TABL1;
End;
/

/******************************************************************************/
/** PROCEDURE I6_PROCUSETYP2                    * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I6_PROCUSETYP2 (
	PARAM1 OUT I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_TABLE1
)
Is
	TABL1 I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_TABLE1;
	ROWVALU I6_TABLE1%ROWTYPE; 
Begin
	TABL1(1):=ROWVALU;
	PARAM1:=TABL1;
End;
/

/******************************************************************************/
/** PROCEDURE I6_PROCUSETYP3                    * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I6_PROCUSETYP3 
Is
	RECSINGLE I6_IMP_PACKAGE_TYPE_DEFINITION.REC1;
	TABLREC I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_REC; 
Begin
	NULL;
End;
/

/******************************************************************************/
/** PROCEDURE I7_PROCUSETYP1                    * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I7_PROCUSETYP1 
Is
Begin
	I7_IMP_PACKAGE_VARDEF.VAR1:=1;
	open I7_IMP_PACKAGE_VARDEF.Cur1;
	open I7_IMP_PACKAGE_VARDEF.Cur2 (1);
	
End;
/

/******************************************************************************/
/** PROCEDURE I8_PROCUSETYP1                    * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE I8_PROCUSETYP1 
Is
	VAR number;
Begin
	VAR:=I8_IMP_PACKAGE_OBJ.IMP_FNC(1);				
	I8_IMP_PACKAGE_OBJ.IMP_PROC(1);
End;
/

/******************************************************************************/
/** PROCEDURE P_ONCOL1                          * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE P_ONCOL1 
Is
	var1 char(4);
Begin
	select COL1 into var1 from COLTABLE;
End;
/

/******************************************************************************/
/** PROCEDURE P_ONCOL2                          * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE P_ONCOL2 
Is
	var2 number(10);
Begin
	select COL2 into var2 from COLTABLE;
End;
/

/******************************************************************************/
/** PROCEDURE P_ONCOL3                          * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE P_ONCOL3 (
	p_col3 IN varchar2
)
Is
	var3 varchar2(30);
Begin
	select COL3 into var3 from COLTABLE;
End;
/

/******************************************************************************/
/** PROCEDURE P_ONFCOLS                         * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE P_ONFCOLS (
	par3 OUT varchar2
)
Is
	var1 char(4);
	var2 number(10);
	var3 varchar2(30);
Begin
	var1 := F_ONCOL1;
	var2 := F_ONCOL2;
	var3 := F_ONCOL3(par3);	
End;
/

/******************************************************************************/
/** PROCEDURE P_ONOBJONVIEW                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE P_ONOBJONVIEW 
Is
	var2 number(10);
	var3 varchar2(30);
Begin
	P_ONVIEWCOLS;
	var2 := F_ONVIEWCOLS;
	select COL3 into var3 from VIEWONVIEWCOLTABLE;
	PK_VIEWCOLS.P_VCOLS2;
End;
/

/******************************************************************************/
/** PROCEDURE P_ONPCOL3                         * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE P_ONPCOL3 (
	par3 IN varchar2
)
Is
Begin
	P_ONCOL3(par3);
End;
/

/******************************************************************************/
/** PROCEDURE P_ONPKPCOL3                       * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE P_ONPKPCOL3 (
	par3 IN VARCHAR2
)
Is
Begin
	PK_ONPCOL3.PPK_ONCOL3(par3);
End;
/

/******************************************************************************/
/** PROCEDURE P_ONVIEWCOL                       * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE P_ONVIEWCOL 
Is
	var1 char(4);
	var2 number(10);
	var3 varchar2(30);
Begin
	select COL1 into var1 from VIEWCOL1;
	select COL2 into var2 from VIEWCOL2;
	select COL3 into var3 from VIEWCOL3;	
End;
/

/******************************************************************************/
/** PROCEDURE P_ONVIEWCOLS                      * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE P_ONVIEWCOLS 
Is
	var1 char(4);
Begin
	select COL1
		into var1
		from VIEWCOLTABLE;
End;
/

/******************************************************************************/
/** PROCEDURE USE_COLTYP_T1_COL1                * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE USE_COLTYP_T1_COL1 (
	PARAM1 IN IMP_TABLE1.T1_COL1%TYPE
)
Is
Begin
	null;
End;
/

/******************************************************************************/
/** PROCEDURE USE_COLTYP_T1_COL1_2              * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE USE_COLTYP_T1_COL1_2 (
	PARAM1 IN SYN_TAB1.T1_COL1%TYPE
)
Is
Begin
	null;
End;
/

/******************************************************************************/
/** PROCEDURE USE_COLTYP_T1_COL1_3              * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE USE_COLTYP_T1_COL1_3 (
	PARAM1 IN VIEWONTAB1.T1_COL1%TYPE
)
Is
Begin
	null;
End;
/

/******************************************************************************/
/** PROCEDURE USE_ROWTYP_T1_COL1                * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE USE_ROWTYP_T1_COL1 (
	PARAM1 IN IMP_TABLE1%ROWTYPE
)
Is
Begin
	null;
End;
/

/******************************************************************************/
/** PROCEDURE USE_ROWTYP_T1_COL1_2              * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE USE_ROWTYP_T1_COL1_2 (
	PARAM1 IN SYN_TAB1%ROWTYPE
)
Is
Begin
	null;
End;
/

/******************************************************************************/
/** PROCEDURE USE_ROWTYP_T1_COL1_3              * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PROCEDURE USE_ROWTYP_T1_COL1_3 (
	PARAM1 IN VIEWONTAB1%ROWTYPE
)
Is
Begin
	null;
End;
/


/******************************************************************************/
/** Generated Script (CREATE): Packages                                      **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

/******************************************************************************/
/** PACKAGE DEF_TYPEON_COLTABLE                 * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE DEF_TYPEON_COLTABLE 
Is
	VARROWTYPE IMP_TABLE1.T1_COL1%TYPE;
	SUBTYPE TAB1STYP is IMP_TABLE1.T1_COL1%TYPE;
	TYPE TAB1TYP is table of IMP_TABLE1.T1_COL1%TYPE;
	Function F_USEROWTYPE (PARAM1 IN IMP_TABLE1.T1_COL1%TYPE) return number;
	Function F_RETROWTYPE return IMP_TABLE1.T1_COL1%TYPE;
	Procedure P_USEROWTYPE (PARAM1 IN IMP_TABLE1.T1_COL1%TYPE);
End;
/

/******************************************************************************/
/** PACKAGE DEF_TYPEON_COLTABLE_2               * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE DEF_TYPEON_COLTABLE_2 
Is
	VARROWTYPE_2 SYN_TAB1.T1_COL1%TYPE;
	SUBTYPE TAB1STYP_2 is SYN_TAB1.T1_COL1%TYPE;
	TYPE TAB1TYP_2 is table of SYN_TAB1.T1_COL1%TYPE;
	Function F_USEROWTYPE_2 (PARAM1 IN SYN_TAB1.T1_COL1%TYPE) return number;
	Function F_RETROWTYPE_2 return SYN_TAB1.T1_COL1%TYPE;
	Procedure P_USEROWTYPE_2 (PARAM1 IN SYN_TAB1.T1_COL1%TYPE);
End;
/

/******************************************************************************/
/** PACKAGE DEF_TYPEON_COLTABLE_3               * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE DEF_TYPEON_COLTABLE_3 
Is
	VARROWTYPE_3 VIEWONTAB1.T1_COL1%TYPE;
	SUBTYPE TAB1STYP_3 is VIEWONTAB1.T1_COL1%TYPE;
	TYPE TAB1TYP_3 is table of VIEWONTAB1.T1_COL1%TYPE;
	Function F_USEROWTYPE_3 (PARAM1 IN VIEWONTAB1.T1_COL1%TYPE) return number;
	Function F_RETROWTYPE_3 return VIEWONTAB1.T1_COL1%TYPE;
	Procedure P_USEROWTYPE_3 (PARAM1 IN VIEWONTAB1.T1_COL1%TYPE);
End;
/

/******************************************************************************/
/** PACKAGE DEF_TYPEON_TABLE                    * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE DEF_TYPEON_TABLE 
Is
	VARROWTYPE IMP_TABLE1%ROWTYPE;
	SUBTYPE TAB1STYP is IMP_TABLE1%ROWTYPE;
	TYPE TAB1TYP is table of IMP_TABLE1%ROWTYPE;
	Function F_USEROWTYPE (PARAM1 IN IMP_TABLE1%ROWTYPE) return number;
	Function F_RETROWTYPE return IMP_TABLE1%ROWTYPE;
	Procedure P_USEROWTYPE (PARAM1 IN IMP_TABLE1%ROWTYPE);
End;
/

/******************************************************************************/
/** PACKAGE DEF_TYPEON_TABLE_2                  * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE DEF_TYPEON_TABLE_2 
Is
	VARROWTYPE_2 SYN_TAB1%ROWTYPE;
	SUBTYPE TAB1STYP_2 is SYN_TAB1%ROWTYPE;
	TYPE TAB1TYP_2 is table of SYN_TAB1%ROWTYPE;
	Function F_USEROWTYPE_2 (PARAM1 IN SYN_TAB1%ROWTYPE) return number;
	Function F_RETROWTYPE_2 return SYN_TAB1%ROWTYPE;
	Procedure P_USEROWTYPE_2 (PARAM1 IN SYN_TAB1%ROWTYPE);
End;
/

/******************************************************************************/
/** PACKAGE DEF_TYPEON_TABLE_3                  * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE DEF_TYPEON_TABLE_3 
Is
	VARROWTYPE_3 VIEWONTAB1%ROWTYPE;
	SUBTYPE TAB1STYP_3 is VIEWONTAB1%ROWTYPE;
	TYPE TAB1TYP_3 is table of VIEWONTAB1%ROWTYPE;
	Function F_USEROWTYPE_3 (PARAM1 IN VIEWONTAB1%ROWTYPE) return number;
	Function F_RETROWTYPE_3 return VIEWONTAB1%ROWTYPE;
	Procedure P_USEROWTYPE_3 (PARAM1 IN VIEWONTAB1%ROWTYPE);
End;
/

/******************************************************************************/
/** PACKAGE I2_PK_TBL1_ACCESS                   * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE I2_PK_TBL1_ACCESS 
Is
	cursor c is select * from I2_IMP_TABLE1;
	cursor c1 is  select * from I2_SYN_TAB1;
	cursor c2 is select * from I2_VIEWONTAB1;
	function F1 return number;
	procedure P1;
End;
/

/******************************************************************************/
/** PACKAGE I3_PACKAGE1                         * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE I3_PACKAGE1 
Is
	MAIN number;
	Procedure P1;
	Function F1 return NUMBER;
End;
/

/******************************************************************************/
/** PACKAGE I4_PACKAGE1                         * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE I4_PACKAGE1 
Is
	MAIN number;
	Procedure P1;
	Function F1 return NUMBER;
End;
/

/******************************************************************************/
/** PACKAGE I5_PACKAGE1                         * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE I5_PACKAGE1 
Is
	INITSEQ number;
	CURSEQVAL number;
	Function GetSEQ return number;
	Procedure SEQCur (VALSEQ OUT number);
End;
/

/******************************************************************************/
/** PACKAGE I6_IMP_PACKAGE_TYPE_DEFINITION      * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE I6_IMP_PACKAGE_TYPE_DEFINITION 
Is
	SUBTYPE TYPTABL1 is I6_TABLE1%ROWTYPE;
	TYPE REC1 is record (Id Number, Label varchar2(255));
	TYPE TABL_OF_REC is table of REC1;
	TYPE TABL_OF_TABLE1 is table of I6_TABLE1%ROWTYPE;
End;
/

/******************************************************************************/
/** PACKAGE I6_PCKUSE1                          * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE I6_PCKUSE1 
Is
	function FCT1 (PARAM1 in I6_IMP_PACKAGE_TYPE_DEFINITION.REC1) return I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_REC;
	procedure PS1 (PARAM2 out I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_TABLE1);
End;
/

/******************************************************************************/
/** PACKAGE I7_IMP_PACKAGE_VARDEF               * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE I7_IMP_PACKAGE_VARDEF 
Is
	VAR1 number;
	cursor Cur1 is select * from I7_TABLE1;
	cursor Cur2(PARAM1 IN NUMBER) is select * from I7_TABLE1 where T1_COL1=PARAM1;
End;
/

/******************************************************************************/
/** PACKAGE I7_PCKUSE1                          * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE I7_PCKUSE1 
Is
	function FCT1 return NUMBER;
	procedure PS1;
End;
/

/******************************************************************************/
/** PACKAGE I8_IMP_PACKAGE_OBJ                  * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE I8_IMP_PACKAGE_OBJ 
Is
	procedure IMP_PROC (PARAM1 in NUMBER);
	function IMP_FNC (PARAM1 in NUMBER) return NUMBER;
End;
/

/******************************************************************************/
/** PACKAGE I8_PCKUSE1                          * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE I8_PCKUSE1 
Is
	function FCT1 return NUMBER;
	procedure PS1;
End;
/

/******************************************************************************/
/** PACKAGE PK1_ONCOLTABLE                      * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE PK1_ONCOLTABLE 
Is

VARONCOL3 COLTABLE.COL3%TYPE;
Procedure PPK1_ONCOL1;
Function FPK1_ONCOL2 return number;

End;
/

/******************************************************************************/
/** PACKAGE PK2_ONCOLTABLE                      * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE PK2_ONCOLTABLE 
Is

VARONCOL1 COLTABLE.COL1%TYPE;
Procedure PPK_ONCOL2;
Function FPK_ONCOL3 return varchar2;

End;
/

/******************************************************************************/
/** PACKAGE PK3_ONCOLTABLE                      * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE PK3_ONCOLTABLE 
Is

VARONCOL2 COLTABLE.COL2%TYPE;
Procedure PPK_ONCOL3;
Function FPK_ONCOL1 return char;

End;
/

/******************************************************************************/
/** PACKAGE PK_ONFCOL3                          * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE PK_ONFCOL3 
Is

Function FPK_ONCOL3 (par3 OUT varchar2) return varchar2;

End;
/

/******************************************************************************/
/** PACKAGE PK_ONPCOL3                          * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE PK_ONPCOL3 
Is 
	procedure PPK_ONCOL3 (par3 IN varchar2);
End;
/

/******************************************************************************/
/** PACKAGE PK_VIEWCOLS                         * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE PK_VIEWCOLS 
Is
	MAVAR VIEWCOLTABLE.COL3%TYPE ;
	Procedure P_VCOLS2;
	Function F_VCOLS1 return char;
End;
/


/******************************************************************************/
/** Generated Script (CREATE): Package bodies                                **/
/** ------------------------------------------------------------------------ **/
/******************************************************************************/

/******************************************************************************/
/** PACKAGE BODY DEF_TYPEON_COLTABLE            * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY DEF_TYPEON_COLTABLE 
Is
	Procedure INTERN_PACK(PARAM2 in IMP_TABLE1.T1_COL1%TYPE) is 
	begin
		null;
	end;
	Function F_USEROWTYPE (PARAM1 IN IMP_TABLE1.T1_COL1%TYPE) return number
	is
	begin
		return null;
	end;
	Function F_RETROWTYPE return IMP_TABLE1.T1_COL1%TYPE is  
	begin
		return VARROWTYPE;
	end; 
	Procedure P_USEROWTYPE (PARAM1 IN IMP_TABLE1.T1_COL1%TYPE) is
	begin
		null;
	end;
End;
/

/******************************************************************************/
/** PACKAGE BODY DEF_TYPEON_COLTABLE_2          * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY DEF_TYPEON_COLTABLE_2 
Is
	Procedure INTERN_PACK_2(PARAM2 in SYN_TAB1.T1_COL1%TYPE) is 
	begin
		null;
	end;
	Function F_USEROWTYPE_2 (PARAM1 IN SYN_TAB1.T1_COL1%TYPE) return number
	is
	begin
		return null;
	end;
	Function F_RETROWTYPE_2 return SYN_TAB1.T1_COL1%TYPE is  
	begin
		return VARROWTYPE_2;
	end; 
	Procedure P_USEROWTYPE_2 (PARAM1 IN SYN_TAB1.T1_COL1%TYPE) is
	begin
		null;
	end;
End;
/

/******************************************************************************/
/** PACKAGE BODY DEF_TYPEON_COLTABLE_3          * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY DEF_TYPEON_COLTABLE_3 
Is
	Procedure INTERN_PACK_3(PARAM2 in VIEWONTAB1.T1_COL1%TYPE) is 
	begin
		null;
	end;
	Function F_USEROWTYPE_3 (PARAM1 IN VIEWONTAB1.T1_COL1%TYPE) return number
	is
	begin
		return null;
	end;
	Function F_RETROWTYPE_3 return VIEWONTAB1.T1_COL1%TYPE is  
	begin
		return VARROWTYPE_3;
	end; 
	Procedure P_USEROWTYPE_3 (PARAM1 IN VIEWONTAB1.T1_COL1%TYPE) is
	begin
		null;
	end;
End;
/

/******************************************************************************/
/** PACKAGE BODY DEF_TYPEON_TABLE               * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY DEF_TYPEON_TABLE 
Is
	Procedure INTERN_PACK(PARAM2 in IMP_TABLE1%ROWTYPE) is 
	begin
		null;
	end;
	Function F_USEROWTYPE (PARAM1 IN IMP_TABLE1%ROWTYPE) return number
	is
	begin
		return null;
	end;
	Function F_RETROWTYPE return IMP_TABLE1%ROWTYPE is  
	begin
		return VARROWTYPE;
	end; 
	Procedure P_USEROWTYPE (PARAM1 IN IMP_TABLE1%ROWTYPE) is
	begin
		null;
	end;
End;
/

/******************************************************************************/
/** PACKAGE BODY DEF_TYPEON_TABLE_2             * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY DEF_TYPEON_TABLE_2 
Is
	Procedure INTERN_PACK_2(PARAM2 in SYN_TAB1%ROWTYPE) is 
	begin
		null;
	end;
	Function F_USEROWTYPE_2 (PARAM1 IN SYN_TAB1%ROWTYPE) return number
	is
	begin
		return null;
	end;
	Function F_RETROWTYPE_2 return SYN_TAB1%ROWTYPE is  
	begin
		return VARROWTYPE_2;
	end; 
	Procedure P_USEROWTYPE_2 (PARAM1 IN SYN_TAB1%ROWTYPE) is
	begin
		null;
	end;
End;
/

/******************************************************************************/
/** PACKAGE BODY DEF_TYPEON_TABLE_3             * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY DEF_TYPEON_TABLE_3 
Is
	Procedure INTERN_PACK_3(PARAM2 in VIEWONTAB1%ROWTYPE) is 
	begin
		null;
	end;
	Function F_USEROWTYPE_3 (PARAM1 IN VIEWONTAB1%ROWTYPE) return number
	is
	begin
		return null;
	end;
	Function F_RETROWTYPE_3 return VIEWONTAB1%ROWTYPE is  
	begin
		return VARROWTYPE_3;
	end; 
	Procedure P_USEROWTYPE_3 (PARAM1 IN VIEWONTAB1%ROWTYPE) is
	begin
		null;
	end;
End;
/

/******************************************************************************/
/** PACKAGE BODY I2_PK_TBL1_ACCESS              * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY I2_PK_TBL1_ACCESS 
Is
	function F1 return number is
		cursor fc is select * from I2_IMP_TABLE1;
		cursor fc1 is  select * from I2_SYN_TAB1;
		cursor fc2 is select * from I2_VIEWONTAB1;
	begin
		delete I2_IMP_TABLE1;  
		delete I2_SYN_TAB1;   
	    	delete I2_VIEWONTAB1;
    	return 1;   
	End;
	
	procedure  P1 is
		cursor fc is select * from I2_IMP_TABLE1;
		cursor fc1 is  select * from I2_SYN_TAB1;
		cursor fc2 is select * from I2_VIEWONTAB1;
	begin
		delete I2_IMP_TABLE1;  
		delete I2_SYN_TAB1;   
	    	delete I2_VIEWONTAB1;   
	End;	
end;
/

/******************************************************************************/
/** PACKAGE BODY I3_PACKAGE1                    * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY I3_PACKAGE1 
Is
	Procedure P1 is
		VAR2 NUMBER;
		VAR3 NUMBER;
	begin
		MAIN:=I3_IMP_FONCTION(VAR2,VAR3);
	end;
	Function F1 return NUMBER is
		VAR2 NUMBER;
		VAR3 NUMBER;
	begin
		return I3_IMP_FONCTION(VAR2,VAR3);
	end;
End;
/

/******************************************************************************/
/** PACKAGE BODY I4_PACKAGE1                    * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY I4_PACKAGE1 
Is
	Procedure P1 is
		VAR2 NUMBER;
		VAR3 NUMBER;
	begin
		I4_IMP_PROCEDURE(VAR2,MAIN);
	end;
	Function F1 return NUMBER is
		VAR2 NUMBER;
		VAR3 NUMBER;
	begin
		I4_IMP_PROCEDURE(VAR2,VAR3);
		return VAR3;
	end;
End;
/

/******************************************************************************/
/** PACKAGE BODY I5_PACKAGE1                    * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY I5_PACKAGE1 
Is
	Procedure TEST is
		roro number;
	begin
		roro:=GetSEQ;
	end;
	Function GetSEQ return number is
		VALEUR number;
	begin
		select I5_IMP_SEQ.NEXTVAL into VALEUR from dual;
		select I5_IMP_SEQ.CURRVAL into CURSEQVAL from dual;
		return VALEUR;
	end;
	Procedure SEQCur (VALSEQ OUT number) is
		VALEUR number;
	begin
		if INITSEQ = 1 then
			select I5_IMP_SEQ.CURRVAL into VALEUR from dual;
		else
			VALEUR:= GetSEQ;
		end if;
		VALSEQ:=VALEUR;
	end; 
End;
/

/******************************************************************************/
/** PACKAGE BODY I6_PCKUSE1                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY I6_PCKUSE1 
Is
	function FCT1 (PARAM1 in I6_IMP_PACKAGE_TYPE_DEFINITION.REC1) return I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_REC 
	is
		TABL I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_REC;
	begin
		TABL(1):= PARAM1;
		return TABL;
	end;
	
	procedure PS1 (PARAM2 out I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_TABLE1) 
	is
		TOAST I6_IMP_PACKAGE_TYPE_DEFINITION.TABL_OF_TABLE1;
		LIG I6_TABLE1%ROWTYPE;
	begin
		TOAST(1):= LIG;
		PARAM2:=TOAST;
	end;
End;
/

/******************************************************************************/
/** PACKAGE BODY I7_PCKUSE1                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY I7_PCKUSE1 
Is
	function FCT1 return NUMBER 
	is
	begin
		I7_IMP_PACKAGE_VARDEF.VAR1:=1;
		open I7_IMP_PACKAGE_VARDEF.Cur1;
		open I7_IMP_PACKAGE_VARDEF.Cur2 (1);
		return 1;
	end;
	
	procedure PS1 
	is
	begin
		I7_IMP_PACKAGE_VARDEF.VAR1:=2;
		open I7_IMP_PACKAGE_VARDEF.Cur1;
		open I7_IMP_PACKAGE_VARDEF.Cur2 (1);
	end;
End;
/

/******************************************************************************/
/** PACKAGE BODY I8_IMP_PACKAGE_OBJ             * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY I8_IMP_PACKAGE_OBJ 
Is
	procedure IMP_LOCALE (PARAM1 in NUMBER) 
	is
	begin 
		NULL;
	end;
	procedure IMP_PROC (PARAM1 in NUMBER)
	is 
	begin
		IMP_LOCALE(1);
	end;
	function IMP_FNC (PARAM1 in NUMBER) return NUMBER
	is 
	begin
		IMP_LOCALE(1);
	end ;
End;
/

/******************************************************************************/
/** PACKAGE BODY I8_PCKUSE1                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY I8_PCKUSE1 
Is
	function FCT1 return NUMBER 
	is
	begin
		I8_IMP_PACKAGE_OBJ.IMP_PROC(1);
		return I8_IMP_PACKAGE_OBJ.IMP_FNC(1);
	end;
	
	procedure PS1 
	is
		VAR number;
	begin
		VAR:=I8_IMP_PACKAGE_OBJ.IMP_FNC(1);				
		I8_IMP_PACKAGE_OBJ.IMP_PROC(1);
	end;
End;
/

/******************************************************************************/
/** PACKAGE BODY PK1_ONCOLTABLE                 * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY PK1_ONCOLTABLE 
Is

Procedure PPK1_ONCOL1
is
	var1 char(4);
begin
	select COL1 into var1 from COLTABLE;
end;

Function FPK1_ONCOL2 return number
is
	var2 number(10);
begin
	select COL2 into var2 from COLTABLE;
	return var2 ;
end;

End;
/

/******************************************************************************/
/** PACKAGE BODY PK2_ONCOLTABLE                 * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY PK2_ONCOLTABLE 
Is

Procedure PPK_ONCOL2
is
	var2 number(10);
begin
	select COL2 into var2 from COLTABLE;
end;

Function FPK_ONCOL3 return varchar2
is
	var3 varchar2(30);
begin
	select COL3 into var3 from COLTABLE;
	return var3;
end;

End;
/

/******************************************************************************/
/** PACKAGE BODY PK3_ONCOLTABLE                 * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY PK3_ONCOLTABLE 
Is

Procedure PPK_ONCOL3
is
	var3 varchar2(30);
begin
	select COL3 into var3 from COLTABLE;
end;

Function FPK_ONCOL1 return char
is
	var1 char(4);
begin
	select COL1 into var1 from COLTABLE;
	return var1;
end;


End;
/

/******************************************************************************/
/** PACKAGE BODY PK_ONFCOL3                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY PK_ONFCOL3 
Is

Function FPK_ONCOL3 (par3 OUT varchar2) return varchar2
is
	var3 varchar2(30);
begin
	var3 := F_ONCOL3(par3);
	return var3;
end;

End;
/

/******************************************************************************/
/** PACKAGE BODY PK_ONPCOL3                     * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY PK_ONPCOL3 
Is

Procedure PPK_ONCOL3 (par3 IN varchar2)
is
begin
	P_ONCOL3(par3);
end;

End;
/

/******************************************************************************/
/** PACKAGE BODY PK_VIEWCOLS                    * Object from Data Dictionary */
/******************************************************************************/

CREATE OR REPLACE PACKAGE BODY PK_VIEWCOLS 
Is

Procedure P_VCOLS2
is
	var2 number(10);
begin
	select COL2 into var2 from VIEWCOLTABLE;
end;

Function F_VCOLS1 return char
is
	var1 char(4);
begin
	select COL1 into var1 from VIEWCOLTABLE;
	return var1;
end;

End;
/

