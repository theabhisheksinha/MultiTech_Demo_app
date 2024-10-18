-- Ce fichier CLP a été créé avec DB2LOOK version "10.5" 
-- Unité de temps: 16/04/2017 10:44:05
-- Nom de base de données: DASMSSMD       
-- Version de gestionnaire de bases de données: DB2/NT64 Version 10.5.3       
-- Pages de codes de base de données: 1208
-- La séquence de classement de la base de données est la suivante :: SYSTEM_1252
-- Alternate collating sequence(alt_collate): null
-- varchar2 compatibility(varchar2_compat): OFF


CONNECT TO DASMSSMD USER db2admin;

------------------------------------------------
-- Instructions DDL pour les schémas
------------------------------------------------


CREATE SCHEMA "CASTPUBS" AUTHORIZATION "DB2ADMIN";

---------------------------------------------------------------
-- Instructions DDL pour des types distincts et/ou des types de données abstraits
-- Instructions DDL pour les types de tableau associatif
-- Instructions DDL pour les types de ligne
-- Instructions DDL pour les types de curseur
---------------------------------------------------------------

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE DISTINCT TYPE "CASTPUBS"."ID" AS "SYSIBM  ".VARCHAR(11)
	WITH COMPARISONS;
SET NLS_STRING_UNITS = 'SYSTEM';

CREATE DISTINCT TYPE "CASTPUBS"."TID" AS "SYSIBM  ".VARCHAR(6)
	WITH COMPARISONS;



------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."AUTHORS"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."AUTHORS"  (
		  "AU_ID" "CASTPUBS"."ID" NOT NULL , 
		  "AU_LNAME" VARCHAR(40 OCTETS) NOT NULL , 
		  "AU_FNAME" VARCHAR(20 OCTETS) NOT NULL , 
		  "PHONE" CHAR(12 OCTETS) NOT NULL WITH DEFAULT 'XX-XX-XX-XX-' , 
		  "ADDRESS" VARCHAR(40 OCTETS) , 
		  "CITY" VARCHAR(20 OCTETS) , 
		  "STATE" CHAR(2 OCTETS) , 
		  "COUNTRY" VARCHAR(12 OCTETS) , 
		  "POSTALCODE" CHAR(10 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 

COMMENT ON TABLE "CASTPUBS"."AUTHORS" IS 'List of authors';

COMMENT ON COLUMN "CASTPUBS"."AUTHORS"."ADDRESS" IS 'Adress where live the author';

COMMENT ON COLUMN "CASTPUBS"."AUTHORS"."AU_FNAME" IS 'First name';

COMMENT ON COLUMN "CASTPUBS"."AUTHORS"."AU_ID" IS 'Internal identifier';

COMMENT ON COLUMN "CASTPUBS"."AUTHORS"."AU_LNAME" IS 'Last name';

COMMENT ON COLUMN "CASTPUBS"."AUTHORS"."CITY" IS 'City where live the author';

COMMENT ON COLUMN "CASTPUBS"."AUTHORS"."COUNTRY" IS 'Country';

COMMENT ON COLUMN "CASTPUBS"."AUTHORS"."PHONE" IS 'Phone number';

COMMENT ON COLUMN "CASTPUBS"."AUTHORS"."POSTALCODE" IS 'Postal Code';

COMMENT ON COLUMN "CASTPUBS"."AUTHORS"."STATE" IS 'State Code';





-- Instructions DDL pour les contraintes uniques sur la table "CASTPUBS"."AUTHORS"


ALTER TABLE "CASTPUBS"."AUTHORS" 
	ADD CONSTRAINT "AUIDIND" UNIQUE
		("AU_ID");


-- Instructions DDL pour les index sur la table "CASTPUBS"."AUTHORS"

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CASTPUBS"."AUNMIND" ON "CASTPUBS"."AUTHORS" 
		("AU_LNAME" ASC,
		 "AU_FNAME" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."STORES"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."STORES"  (
		  "STOR_ID" CHAR(4 OCTETS) NOT NULL , 
		  "STOR_NAME" VARCHAR(40 OCTETS) , 
		  "STOR_ADDRESS" VARCHAR(40 OCTETS) , 
		  "CITY" VARCHAR(20 OCTETS) , 
		  "STATE" CHAR(2 OCTETS) , 
		  "COUNTRY" VARCHAR(12 OCTETS) , 
		  "POSTALCODE" CHAR(10 OCTETS) , 
		  "PAYTERMS" VARCHAR(12 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





-- Instructions DDL pour les contraintes uniques sur la table "CASTPUBS"."STORES"


ALTER TABLE "CASTPUBS"."STORES" 
	ADD CONSTRAINT "PK_STORES" UNIQUE
		("STOR_ID");


------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."DISCOUNTS"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."DISCOUNTS"  (
		  "DISCOUNTTYPE" VARCHAR(40 OCTETS) NOT NULL , 
		  "STOR_ID" CHAR(4 OCTETS) NOT NULL , 
		  "LOWQTY" SMALLINT , 
		  "HIGHQTY" SMALLINT , 
		  "DISCOUNT" DOUBLE NOT NULL )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- Instructions DDL pour la clé principale sur la table "CASTPUBS"."DISCOUNTS"

ALTER TABLE "CASTPUBS"."DISCOUNTS" 
	ADD CONSTRAINT "PK_DISCOUNTS" PRIMARY KEY
		("DISCOUNTTYPE",
		 "STOR_ID");



------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."SALES"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."SALES"  (
		  "STOR_ID" CHAR(4 OCTETS) NOT NULL , 
		  "ORD_NUM" VARCHAR(20 OCTETS) NOT NULL , 
		  "DATE" DATE NOT NULL )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 

COMMENT ON TABLE "CASTPUBS"."SALES" IS 'Container of sales';

COMMENT ON COLUMN "CASTPUBS"."SALES"."DATE" IS 'DAte of the sale';

COMMENT ON COLUMN "CASTPUBS"."SALES"."ORD_NUM" IS 'Number of the order';

COMMENT ON COLUMN "CASTPUBS"."SALES"."STOR_ID" IS 'Internal identifier';





-- Instructions DDL pour les contraintes uniques sur la table "CASTPUBS"."SALES"


ALTER TABLE "CASTPUBS"."SALES" 
	ADD CONSTRAINT "PK_SALES" UNIQUE
		("STOR_ID",
		 "ORD_NUM");


------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."INVOICE"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."INVOICE"  (
		  "INVOICE_ID" CHAR(8 OCTETS) NOT NULL , 
		  "STOR_ID" CHAR(4 OCTETS) NOT NULL , 
		  "ORD_NUM" VARCHAR(20 OCTETS) NOT NULL , 
		  "DT_INVOICE" DATE NOT NULL , 
		  "TOTAL_SALES" INTEGER NOT NULL )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





-- Instructions DDL pour les contraintes uniques sur la table "CASTPUBS"."INVOICE"


ALTER TABLE "CASTPUBS"."INVOICE" 
	ADD CONSTRAINT "PK_INVOICE" UNIQUE
		("INVOICE_ID");


------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."INVOICE_LINE"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."INVOICE_LINE"  (
		  "INV_LINE_ID" DECIMAL(10,0) NOT NULL GENERATED ALWAYS AS IDENTITY (  
		    START WITH +1  
		    INCREMENT BY +1  
		    MINVALUE +1  
		    MAXVALUE +9999999999  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "INVOICE_ID" CHAR(8 OCTETS) NOT NULL , 
		  "TITLE_ID" "CASTPUBS"."TID" NOT NULL , 
		  "QTY" INTEGER NOT NULL )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 






-- Instructions DDL pour les index sur la table "CASTPUBS"."INVOICE_LINE"

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE UNIQUE INDEX "CASTPUBS"."PK_INVOICE_LINE" ON "CASTPUBS"."INVOICE_LINE" 
		("INV_LINE_ID" ASC,
		 "INVOICE_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."ORDERS"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."ORDERS"  (
		  "ORDER_ID" INTEGER NOT NULL , 
		  "STOR_ID" CHAR(4 OCTETS) NOT NULL , 
		  "ORDER_NUM" CHAR(10 OCTETS) NOT NULL , 
		  "DT_ISSUE" DATE NOT NULL , 
		  "DT_REC" DATE NOT NULL )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





-- Instructions DDL pour les contraintes uniques sur la table "CASTPUBS"."ORDERS"


ALTER TABLE "CASTPUBS"."ORDERS" 
	ADD CONSTRAINT "PK_ORDERS" UNIQUE
		("ORDER_ID");


------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."ORDER_LINE"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."ORDER_LINE"  (
		  "ORD_LINE_ID" DECIMAL(10,0) NOT NULL GENERATED ALWAYS AS IDENTITY (  
		    START WITH +1  
		    INCREMENT BY +1  
		    MINVALUE +1  
		    MAXVALUE +9999999999  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "ORDER_ID" INTEGER NOT NULL , 
		  "TITLE_ID" "CASTPUBS"."TID" NOT NULL , 
		  "QTY" INTEGER NOT NULL )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 






-- Instructions DDL pour les index sur la table "CASTPUBS"."ORDER_LINE"

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE UNIQUE INDEX "CASTPUBS"."PK_ORDER_LINE" ON "CASTPUBS"."ORDER_LINE" 
		("ORD_LINE_ID" ASC,
		 "ORDER_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."PUBLISHERS"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."PUBLISHERS"  (
		  "PUB_ID" CHAR(4 OCTETS) NOT NULL , 
		  "PUB_NAME" VARCHAR(40 OCTETS) , 
		  "CITY" VARCHAR(20 OCTETS) , 
		  "STATE" CHAR(2 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





-- Instructions DDL pour les contraintes uniques sur la table "CASTPUBS"."PUBLISHERS"


ALTER TABLE "CASTPUBS"."PUBLISHERS" 
	ADD CONSTRAINT "PK_PUBLISHERS" UNIQUE
		("PUB_ID");


------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."ROYSCHED"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."ROYSCHED"  (
		  "TITLE_ID" "CASTPUBS"."TID" NOT NULL , 
		  "LORANGE" INTEGER , 
		  "HIRANGE" INTEGER , 
		  "ROYALTY" INTEGER )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 






-- Instructions DDL pour les index sur la table "CASTPUBS"."ROYSCHED"

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CASTPUBS"."ROYTITIDIND" ON "CASTPUBS"."ROYSCHED" 
		("TITLE_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."SALESDETAIL"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."SALESDETAIL"  (
		  "STOR_ID" CHAR(4 OCTETS) NOT NULL , 
		  "ORD_NUM" VARCHAR(20 OCTETS) NOT NULL , 
		  "TITLE_ID" "CASTPUBS"."TID" NOT NULL , 
		  "QTY" SMALLINT NOT NULL , 
		  "DISCOUNT" REAL NOT NULL )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 

COMMENT ON TABLE "CASTPUBS"."SALESDETAIL" IS 'Details of sales';

COMMENT ON COLUMN "CASTPUBS"."SALESDETAIL"."ORD_NUM" IS 'Number of the order';

COMMENT ON COLUMN "CASTPUBS"."SALESDETAIL"."QTY" IS 'Discount';

COMMENT ON COLUMN "CASTPUBS"."SALESDETAIL"."STOR_ID" IS 'Internal identifier';

COMMENT ON COLUMN "CASTPUBS"."SALESDETAIL"."TITLE_ID" IS 'Identifier of the title';






-- Instructions DDL pour les index sur la table "CASTPUBS"."SALESDETAIL"

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CASTPUBS"."SALESDETAILIND" ON "CASTPUBS"."SALESDETAIL" 
		("STOR_ID" ASC,
		 "ORD_NUM" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

-- Instructions DDL pour les index sur la table "CASTPUBS"."SALESDETAIL"

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CASTPUBS"."SALTITIDIND" ON "CASTPUBS"."SALESDETAIL" 
		("TITLE_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."STOCK"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."STOCK"  (
		  "STOR_ID" CHAR(4 OCTETS) NOT NULL , 
		  "STOCK_QTY" INTEGER NOT NULL , 
		  "STOCK_HIGH_LEVEL" INTEGER NOT NULL , 
		  "STOCK_LOW_LEVEL" INTEGER NOT NULL , 
		  "STOCK_EMERGENCY" CHAR(1 OCTETS) FOR BIT DATA NOT NULL )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- Instructions DDL pour la clé principale sur la table "CASTPUBS"."STOCK"

ALTER TABLE "CASTPUBS"."STOCK" 
	ADD CONSTRAINT "PK_STOCK" PRIMARY KEY
		("STOR_ID");



------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."STOCK_LINE"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."STOCK_LINE"  (
		  "STOCK_LINE_ID" INTEGER NOT NULL , 
		  "STOR_ID" CHAR(4 OCTETS) NOT NULL , 
		  "TITLE_ID" "CASTPUBS"."TID" NOT NULL , 
		  "QTY" INTEGER NOT NULL , 
		  "LINE_HIGH_LEVEL" INTEGER NOT NULL , 
		  "LINE_LOW_LEVEL" INTEGER NOT NULL )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- Instructions DDL pour la clé principale sur la table "CASTPUBS"."STOCK_LINE"

ALTER TABLE "CASTPUBS"."STOCK_LINE" 
	ADD CONSTRAINT "PK_STOCK_LINE" PRIMARY KEY
		("STOCK_LINE_ID",
		 "STOR_ID");



------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."T172_SOS_PRJ_ITM"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."T172_SOS_PRJ_ITM"  (
		  "E161_PRJ_NBR" INTEGER NOT NULL , 
		  "T024_ITM_NBR" INTEGER NOT NULL , 
		  "T172_ITM_SEQ_NBR" INTEGER NOT NULL , 
		  "P028_VND_NBR" INTEGER NOT NULL , 
		  "P008_CUS_NBR" INTEGER NOT NULL WITH DEFAULT 0 , 
		  "ITM_DES_TXT" VARCHAR(250 OCTETS) NOT NULL , 
		  "VND_PRD_ID" CHAR(20 OCTETS) NOT NULL WITH DEFAULT ' ' , 
		  "T028_ITM_TYP_CD" SMALLINT NOT NULL , 
		  "T197_UNT_PAK_CD" SMALLINT NOT NULL , 
		  "T096_SEL_SHF_CD" SMALLINT NOT NULL , 
		  "E024_DLV_TYP_CD" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "SUG_SEL_AMT" DECIMAL(19,4) NOT NULL , 
		  "ITM_CST_AMT" DECIMAL(19,4) NOT NULL , 
		  "LCT_CST_AMT" DECIMAL(19,4) NOT NULL WITH DEFAULT 0 , 
		  "SEL_PRC_AMT" DECIMAL(19,4) NOT NULL , 
		  "ITM_LIS_AMT" DECIMAL(19,4) NOT NULL , 
		  "T048_DFL_PRC_CD" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "DFL_SEL_AMT" DECIMAL(19,4) NOT NULL WITH DEFAULT 0 , 
		  "T048_ITM_PRC_CD" SMALLINT NOT NULL , 
		  "ULK_RSN_CD" SMALLINT NOT NULL , 
		  "T178_TAX_ITM_NBR" INTEGER NOT NULL , 
		  "ORD_QTY" INTEGER NOT NULL , 
		  "E118_FRG_TYP_CD" SMALLINT NOT NULL , 
		  "EST_ITM_FRG_AMT" DECIMAL(19,4) NOT NULL WITH DEFAULT 0 , 
		  "CST_CNF_NME" CHAR(30 OCTETS) NOT NULL , 
		  "VND_LED_TM_CNT" SMALLINT NOT NULL , 
		  "PRC_UNT_QTY" SMALLINT NOT NULL , 
		  "P082_TMP_VND_IDC" CHAR(1 OCTETS) NOT NULL , 
		  "E100_PO_NBR" INTEGER NOT NULL , 
		  "TNS_RTR_QTY" INTEGER NOT NULL , 
		  "TOT_RTR_QTY" INTEGER NOT NULL , 
		  "CUS_RCV_QTY" INTEGER NOT NULL , 
		  "T383_PHS_ITM_CD" SMALLINT NOT NULL , 
		  "E077_LIN_NBR" INTEGER NOT NULL , 
		  "STK_OUT_IDC" CHAR(1 OCTETS) NOT NULL , 
		  "TAX_ITM_IDC" CHAR(1 OCTETS) NOT NULL , 
		  "DCR_PRC_AMT" DECIMAL(19,4) NOT NULL , 
		  "RCV_QTY" INTEGER NOT NULL , 
		  "TNS_RFN_QTY" INTEGER NOT NULL , 
		  "TOT_RFN_QTY" INTEGER NOT NULL , 
		  "EST_FRG_CST_AMT" DECIMAL(19,4) NOT NULL , 
		  "TOT_EXC_QTY" INTEGER NOT NULL , 
		  "TNS_EXC_QTY" INTEGER NOT NULL , 
		  "TNS_CUS_RTR_QTY" INTEGER NOT NULL , 
		  "TOT_CUS_RTR_QTY" INTEGER NOT NULL , 
		  "RTR_RSN_CD" SMALLINT NOT NULL , 
		  "ADD_DT" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "UPD_ID" CHAR(8 OCTETS) NOT NULL WITH DEFAULT ' ' , 
		  "UPD_DM" TIMESTAMP NOT NULL WITH DEFAULT CURRENT TIMESTAMP , 
		  "EDI_IDC" CHAR(1 OCTETS) NOT NULL WITH DEFAULT ' ' , 
		  "CFG_ITM_IDC" CHAR(1 OCTETS) NOT NULL WITH DEFAULT 'N' , 
		  "SCN_ID" SMALLINT NOT NULL WITH DEFAULT 0 , 
		  "BAR_CD_ID" CHAR(30 OCTETS) NOT NULL WITH DEFAULT ' ' , 
		  "ULK_MGR_ID" CHAR(8 OCTETS) NOT NULL WITH DEFAULT ' ' , 
		  "ULK_DT" TIMESTAMP NOT NULL WITH DEFAULT '1901-01-01-00.00.00.000000' , 
		  "ULK_SAL_PNL_ID" CHAR(8 OCTETS) NOT NULL WITH DEFAULT ' ' , 
		  "OMS_ORD_LIN_ID" INTEGER NOT NULL WITH DEFAULT 0 )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 






-- Instructions DDL pour les index sur la table "CASTPUBS"."T172_SOS_PRJ_ITM"

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE UNIQUE INDEX "CASTPUBS"."T172I0" ON "CASTPUBS"."T172_SOS_PRJ_ITM" 
		("E161_PRJ_NBR" ASC,
		 "T024_ITM_NBR" ASC,
		 "T172_ITM_SEQ_NBR" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

-- Instructions DDL pour les index sur la table "CASTPUBS"."T172_SOS_PRJ_ITM"

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CASTPUBS"."T172I1" ON "CASTPUBS"."T172_SOS_PRJ_ITM" 
		("E100_PO_NBR" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."TITLEAUTHOR"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."TITLEAUTHOR"  (
		  "AU_ID" "CASTPUBS"."ID" NOT NULL , 
		  "TITLE_ID" "CASTPUBS"."TID" NOT NULL , 
		  "AU_ORD" SMALLINT , 
		  "ROYALTYPER" INTEGER )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 

COMMENT ON TABLE "CASTPUBS"."TITLEAUTHOR" IS 'Links between titles and authors';






-- Instructions DDL pour les index sur la table "CASTPUBS"."TITLEAUTHOR"

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CASTPUBS"."TAUTIDIND" ON "CASTPUBS"."TITLEAUTHOR" 
		("AU_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

-- Instructions DDL pour les index sur la table "CASTPUBS"."TITLEAUTHOR"

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE UNIQUE INDEX "CASTPUBS"."TITLEAUTHIND" ON "CASTPUBS"."TITLEAUTHOR" 
		("AU_ID" ASC,
		 "TITLE_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

-- Instructions DDL pour les index sur la table "CASTPUBS"."TITLEAUTHOR"

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CASTPUBS"."TITLEIDIND" ON "CASTPUBS"."TITLEAUTHOR" 
		("TITLE_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

------------------------------------------------
-- Instructions DDL pour une table "CASTPUBS"."TITLES"
------------------------------------------------
 

CREATE TABLE "CASTPUBS"."TITLES"  (
		  "TITLE_ID" "CASTPUBS"."TID" NOT NULL , 
		  "TITLE" VARCHAR(80 OCTETS) NOT NULL , 
		  "TYPE" CHAR(12 OCTETS) NOT NULL WITH DEFAULT 'UNDECIDED' , 
		  "PUB_ID" CHAR(4 OCTETS) , 
		  "PRICE" DECIMAL(19,4) , 
		  "ADVANCE" DECIMAL(19,4) , 
		  "TOTAL_SALES" INTEGER , 
		  "NOTES" VARCHAR(200 OCTETS) , 
		  "PUBDATE" DATE WITH DEFAULT CURRENT DATE , 
		  "CONTRACT" CHAR(1 OCTETS) FOR BIT DATA )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 

COMMENT ON TABLE "CASTPUBS"."TITLES" IS 'List of titles';

COMMENT ON COLUMN "CASTPUBS"."TITLES"."ADVANCE" IS 'Advance gave for this title';

COMMENT ON COLUMN "CASTPUBS"."TITLES"."CONTRACT" IS 'Type of contract';

COMMENT ON COLUMN "CASTPUBS"."TITLES"."NOTES" IS 'Notes';

COMMENT ON COLUMN "CASTPUBS"."TITLES"."PUBDATE" IS 'Date of publication';

COMMENT ON COLUMN "CASTPUBS"."TITLES"."PUB_ID" IS 'Identifier of the publisher';

COMMENT ON COLUMN "CASTPUBS"."TITLES"."TITLE" IS 'Title of the book';

COMMENT ON COLUMN "CASTPUBS"."TITLES"."TITLE_ID" IS 'Internal identifier';

COMMENT ON COLUMN "CASTPUBS"."TITLES"."TOTAL_SALES" IS 'Number of sales';

COMMENT ON COLUMN "CASTPUBS"."TITLES"."TYPE" IS 'Type of publication';


-- Instructions DDL pour la clé principale sur la table "CASTPUBS"."TITLES"

ALTER TABLE "CASTPUBS"."TITLES" 
	ADD CONSTRAINT "PK_TITLES" PRIMARY KEY
		("TITLE_ID");



-- Instructions DDL pour les index sur la table "CASTPUBS"."TITLES"

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CASTPUBS"."TITLEIND" ON "CASTPUBS"."TITLES" 
		("TITLE" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

-- Instructions DDL pour les clés externes sur la table "CASTPUBS"."DISCOUNTS"

ALTER TABLE "CASTPUBS"."DISCOUNTS" 
	ADD CONSTRAINT "FK_DISCOUNTS_STORE" FOREIGN KEY
		("STOR_ID")
	REFERENCES "CASTPUBS"."STORES"
		("STOR_ID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- Instructions DDL pour les clés externes sur la table "CASTPUBS"."INVOICE"

ALTER TABLE "CASTPUBS"."INVOICE" 
	ADD CONSTRAINT "FK_INVOICE_SALES" FOREIGN KEY
		("STOR_ID",
		 "ORD_NUM")
	REFERENCES "CASTPUBS"."SALES"
		("STOR_ID",
		 "ORD_NUM")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- Instructions DDL pour les clés externes sur la table "CASTPUBS"."INVOICE_LINE"

ALTER TABLE "CASTPUBS"."INVOICE_LINE" 
	ADD CONSTRAINT "FK_INVOI_L_INVOICE" FOREIGN KEY
		("INVOICE_ID")
	REFERENCES "CASTPUBS"."INVOICE"
		("INVOICE_ID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- Instructions DDL pour les clés externes sur la table "CASTPUBS"."ORDER_LINE"

ALTER TABLE "CASTPUBS"."ORDER_LINE" 
	ADD CONSTRAINT "FK_ORD_L_ORD" FOREIGN KEY
		("ORDER_ID")
	REFERENCES "CASTPUBS"."ORDERS"
		("ORDER_ID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- Instructions DDL pour les contraintes de vérification sur la table "CASTPUBS"."PUBLISHERS"

SET NLS_STRING_UNITS = 'SYSTEM';

ALTER TABLE "CASTPUBS"."PUBLISHERS" 
	ADD CONSTRAINT "PUB_IDRULE" CHECK 
		(PUB_ID in ('1389', '0736', '0877', '1622', '1756', '1789') or PUB_ID like
'99[0-9][0-9]')
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- Instructions DDL pour les clés externes sur la table "CASTPUBS"."SALESDETAIL"

ALTER TABLE "CASTPUBS"."SALESDETAIL" 
	ADD CONSTRAINT "FK_SALESDETAIL_ST" FOREIGN KEY
		("STOR_ID",
		 "ORD_NUM")
	REFERENCES "CASTPUBS"."SALES"
		("STOR_ID",
		 "ORD_NUM")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- Instructions DDL pour les clés externes sur la table "CASTPUBS"."STOCK"

ALTER TABLE "CASTPUBS"."STOCK" 
	ADD CONSTRAINT "FK_STOCK_STOR_ID" FOREIGN KEY
		("STOR_ID")
	REFERENCES "CASTPUBS"."STORES"
		("STOR_ID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- Instructions DDL pour les clés externes sur la table "CASTPUBS"."STOCK_LINE"

ALTER TABLE "CASTPUBS"."STOCK_LINE" 
	ADD CONSTRAINT "FK_STOCK_L_STOR" FOREIGN KEY
		("STOR_ID")
	REFERENCES "CASTPUBS"."STOCK"
		("STOR_ID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- Instructions DDL pour les clés externes sur la table "CASTPUBS"."TITLES"

ALTER TABLE "CASTPUBS"."TITLES" 
	ADD CONSTRAINT "FK_TIT_PUB_ID" FOREIGN KEY
		("PUB_ID")
	REFERENCES "CASTPUBS"."PUBLISHERS"
		("PUB_ID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- Instructions DDL pour les contraintes de vérification sur la table "CASTPUBS"."TITLES"

SET NLS_STRING_UNITS = 'SYSTEM';

ALTER TABLE "CASTPUBS"."TITLES" 
	ADD CONSTRAINT "TITLE_IDRULE" CHECK 
		( SUBSTR(cast(TITLE_ID as varchar(6)),1,2)='BU' and INT(SUBSTR(cast(TITLE_ID
as varchar(6)),3,1)) between 0 and 9 and INT(SUBSTR(cast(TITLE_ID as varchar(6)),4,1))
between 0 and 9 and INT(SUBSTR(cast(TITLE_ID as varchar(6)),5,1)) between
0 and 9 and INT(SUBSTR(cast(TITLE_ID as varchar(6)),6,1)) between 0 and
9)
	ENFORCED
	ENABLE QUERY OPTIMIZATION;






----------------------------

-- Instructions DDL pour des affichages

----------------------------
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";
CREATE VIEW "CASTPUBS"."AUTHORIDCODES" (AU_ID ) AS select distinct au_id
from CASTPUBS.titleauthor;


SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";
CREATE VIEW "CASTPUBS"."STOREIDVIEW" (STOR_ID, ORD_NUM ) AS Select S.stor_id,
S.ord_num From CASTPUBS.sales S, CASTPUBS.salesdetail Det Where S.stor_id
= Det.stor_id And S.ord_num = Det.ord_num;




---------------------------------
-- Instructions DDL pour les procédures stockées
---------------------------------

SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."BYROYALTY"
 (IN PERCENTAGE INTEGER
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  RESULT SETS 1
  LANGUAGE SQL
  ------------------------------------------------------------------------
-- SQL Stored Procedure 
------------------------------------------------------------------------
P1: BEGIN

declare byr_curs cursor with return for
SELECT au_id FROM CASTPUBS.titleauthor
WHERE royaltyper = percentage;--

open byr_curs;--

END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."I_INVOICE"
 (IN INVOICE_ID CHARACTER(8),
  IN STOR_ID CHARACTER(4),
  IN ORD_NUM VARCHAR(20),
  IN DT_INVOICE DATE,
  IN TOTAL_SALES INTEGER
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN 

Declare SQLCODE int default 0; --
Declare SqlError int default 0; --
Declare exit handler for SQLSTATE '23503' resignal SQLSTATE '23503' 
set message_text='Integrity Constraint violation'; --

Declare continue handler for NOT FOUND, SQLWARNING, SQLEXCEPTION set SqlError=SQLCODE; --

Insert Into CASTPUBS.Invoice 
( invoice_id, stor_id, ord_num, dt_invoice, total_sales ) 
Values ( I_Invoice.invoice_id, I_Invoice.stor_id, I_Invoice.ord_num, I_Invoice.dt_invoice, I_Invoice.total_sales ) ; --
return Sqlerror; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."CREATENEWINVOICELINES"
 (IN INVOICID CHARACTER(8),
  IN NUMB INTEGER
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN 
 
Declare Error int default 0; --
Declare SQLCODE int default 0; --
 
Declare continue handler for SQLWARNING, NOT FOUND, SQLEXCEPTION Set Error = SQLCODE; --
 
Insert into CASTPUBS.Invoice_Line ( invoice_id, title_id, qty ) 
Select invoicid, t1.title_id, Numb*10 + Numb 
From CASTPUBS.titles t1; --
Return Error; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."CREATENEWINVOICE" ( )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  RESULT SETS 1
  LANGUAGE SQL
  P1: BEGIN 
 
Declare ret_proc int default 0; --
Declare local_stor_id char(4); --
Declare local_ord_num varchar(20); --
Declare numb int; Declare invoice_id char(8); --
Declare dt_invoice date; Declare total_sales int; --
Declare at_end int default 0; --

 
Declare sales_curs Cursor with return for 
	Select s.stor_id, s.ord_num 
	From CASTPUBS.sales s for read only; --

 
Declare continue handler for NOT FOUND set at_end=1; --
Declare Exit handler for SQLSTATE '99999' 
begin 
	ROLLBACK TO SAVEPOINT; --
	resignal SQLSTATE '99999' 
	set message_text='Stored Procedure Call failed !!!'; --
end; --

Declare Exit handler for sqlstate '24504' 
begin 
	ROLLBACK TO SAVEPOINT; --
	resignal SQLSTATE '99998' 
	set message_text='Problem with the cursor !!!'; --
	set at_end=1; --
end; --
 
SAVEPOINT glob_tran unique on rollback retain cursors; --
SAVEPOINT glob_tran unique on rollback retain cursors; --
Open sales_curs; --

Fetch sales_curs Into local_stor_id, local_ord_num; --
Set numb = 1; --

While (at_end = 0) do 
	Set invoice_id = rtrim(char(numb))||'_'||local_stor_id||'12'; --
	Set dt_invoice = current date; --
	Set total_sales = numb * 10 + numb; --
	call CASTPUBS.I_Invoice ( invoice_id , local_stor_id , local_ord_num , dt_invoice, total_sales); --
	get diagnostics ret_proc = RETURN_STATUS; --
	If ret_proc<0 then 
		signal SQLSTATE '99999'; --
	end if; --
	
	Call CASTPUBS.CreateNewInvoiceLines ( invoice_id , numb ); --
	get diagnostics ret_proc = RETURN_STATUS; --
	
	If ret_proc <0 then 
		signal SQLSTATE '99999'; --
	end if; --

	Set numb = numb + 1; --
	Fetch sales_curs Into local_stor_id, local_ord_num; --

End While; --
Close sales_curs; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."CREATENEWORDERLINE"
 (IN ORDERID INTEGER
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  RESULT SETS 1
  LANGUAGE SQL
  P1: BEGIN 
 
 
Declare Error int; --
Declare SQLCODE int default 0; --
Declare SqlError int default 0; --
Declare rwcnt integer; --
Declare stor_curs cursor with return for 
Select * From CASTPUBS.stores; --
Declare continue handler for NOT FOUND, SQLWARNING, SQLEXCEPTION 
begin 
	set Error=SQLCODE; --
	if (Error=-530) then 
		Resignal SQLSTATE '23503' 
		set message_text='This order does not exist'; --
		end if; --
end; --
 
open stor_curs; --
Insert into CASTPUBS.Order_Line ( order_id, title_id, qty ) 
Select orderid, T.title_id, orderid * 10 
From CASTPUBS.titles T; --
get diagnostics rwcnt=row_count; --
close stor_curs; --
Return Error; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."D_INVOICE_LINE"
 (IN INV_LINEID DECIMAL(10,0),
  IN INVOICEID CHARACTER(8)
 )

  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN Declare SQLCODE int default 0; --
Declare Error int default 0; --
Declare exit handler for SQLEXCEPTION 
begin 
	set Error=SQLCODE; --
	ROLLBACK TO SAVEPOINT; --
end; --
Declare continue handler for NOT FOUND resignal SQLSTATE '02000' 
set message_text='No Row was deleted!!!'; --
SAVEPOINT DEL_IVL ON ROLLBACK RETAIN CURSORS; --
delete from CASTPUBS.Invoice_Line where inv_line_id = inv_lineid and invoice_id = invoiceid; --
RELEASE SAVEPOINT DEL_IVL; --
return Error; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."DECL_TMP_DELIV" ( )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  ------------------------------------------------------------------------
-- SQL Stored Procedure 
------------------------------------------------------------------------
P1: BEGIN
declare global temporary table tmp_Available_Delivery as
(Select 
	O.order_id ,
	O.stor_id,
        cast (SL.title_id as varchar(6)) as title_id,

	SL.qty	
From   
	CASTPUBS.Orders O, 
	CASTPUBS.Order_Line OL, 
	CASTPUBS.Stock_Line SL )
definition only INCLUDING COLUMN DEFAULTS INCLUDING IDENTITY COLUMN ATTRIBUTES 
not logged;--

END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."DELETEALLINVOICE" ( )

  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN 
Declare SQLCODE int default 0; --
Declare Error int default 0; --
Declare exit handler for SQLEXCEPTION 
begin 
	set Error=SQLCODE; --
	ROLLBACK TO SAVEPOINT; --
end; --
SAVEPOINT DEL_ALLIV ON ROLLBACK RETAIN CURSORS; --
If (0<(select count(*) from CASTPUBS.Invoice)) then 
	begin 
	delete from CASTPUBS.Invoice_Line; --
	delete from CASTPUBS.Invoice; --
	end; --
end if; --
RELEASE SAVEPOINT DEL_ALLIV; --
return error; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."DELETEALLORDERS" ( )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN 
Declare SQLCODE int default 0; --
Declare Error int default 0; --
Declare exit handler for SQLEXCEPTION 
begin 
	set Error=SQLCODE; --
	ROLLBACK TO SAVEPOINT; --
end; --
SAVEPOINT DEL_ALLORD ON ROLLBACK RETAIN CURSORS; --
If (0<(select count(*) from CASTPUBS.Orders)) then 
	begin 
	delete from CASTPUBS.Order_Line; --
	delete from CASTPUBS.Orders; --
	end; --
end if; --
RELEASE SAVEPOINT DEL_ALLORD; --
return error; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."DISCOUNT_PROC" ( )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN 
 
Declare ret_code integer default 0; --
Declare SQLCODE integer default 0; --
Declare disc_curs cursor with return for 
Select discounttype, stor_id, lowqty, highqty, discount 
From CASTPUBS.discounts; --
Declare continue handler for NOT FOUND, SQLWARNING, SQLEXCEPTION 
	set ret_code=SQLCODE; --

 
open disc_curs; --
get diagnostics ret_code= RETURN_STATUS; --
return ret_code; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."DROP_TMP_DELIVER" ( )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  ------------------------------------------------------------------------
-- SQL Stored Procedure 
------------------------------------------------------------------------
P1: BEGIN
Drop table Session.tmp_Available_Delivery;--
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."E_STOCK"
 (OUT LINECOUNT INTEGER,
  IN STORID CHARACTER(4)
 )
  SPECIFIC CASTPUBS.SQL011108134223030
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  ------------------------------------------------------------------------
-- SQL Stored Procedure 
------------------------------------------------------------------------
P1: BEGIN

Declare continue handler for SQLException, SQLWarning, NOT FOUND
signal SQLSTATE '99999' set message_text=' Procedure Failed !!!';--


select count(*) into linecount 
from CASTPUBS.Stock
where
stor_id = storid;--
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."EX_GENER"
 (IN WHICHQUERY INTEGER,
  OUT SQLSTATE_OUT CHARACTER(5),
  OUT SQLCODE_OUT INTEGER
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  RESULT SETS 1
  LANGUAGE SQL
  P1: BEGIN 
DECLARE SQLSTATE CHAR(5) DEFAULT '00000'; --
DECLARE SQLCODE INT DEFAULT 0; --
DECLARE cursor1 CURSOR WITH RETURN FOR 
SELECT PROCSCHEMA, PROCNAME FROM SYSCAT.PROCEDURES; --
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
IF ( 1 = 1 ) THEN 
	SET SQLSTATE_OUT = SQLSTATE; --
	SET SQLCODE_OUT = SQLCODE; --
END IF; --
CASE whichQuery WHEN 0 THEN OPEN cursor1; --
END CASE; --
SET SQLSTATE_OUT = SQLSTATE; --
SET SQLCODE_OUT = SQLCODE; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."EX_RWCNT"
 (IN LASTNAME VARCHAR(40),
  IN FIRSTNAME VARCHAR(20),
  INOUT RWCOUNT INTEGER
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  ------------------------------------------------------------------------
-- SQL Stored Procedure 
------------------------------------------------------------------------
P1: BEGIN

declare continue handler for SQLSTATE '42710'
resignal SQLSTATE '42710' set message_text='TABLE TEMPO DEJA CREEE';--
declare exit handler for SQLSTATE '42727'
resignal SQLSTATE '42727' set message_text='Problème d autorisation pour utiliser le table space'; --

declare global temporary table TMP_TA        
(col1 varchar(40), col2 varchar(20), col3 varchar (80), col4 varchar(6)) not logged ;--

insert into SESSION.TMP_TA    
Select  
	t2.au_lname, 
	t2.au_fname,
	t1.title,
	t1.title_id
From   
	castpubs.titles t1, 
	castpubs.authors t2, 
	castpubs.titleauthor t3
Where  
	 cast(t1.title_id as varchar(6)) = cast(t3.title_id as varchar(6))
	And  castpubs.varchar(t2.au_id) =  castpubs.varchar(t3.au_id)
	and upper(ltrim(rtrim(t2.au_lname))) like upper(ltrim(rtrim(lastname)))
	and upper(ltrim(rtrim(t2.au_fname))) like upper(ltrim(rtrim(firstname)));--


get diagnostics rwcount=row_count;--
drop table session.tmp_ta;--

END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."GETALLSALES" ( )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  ------------------------------------------------------------------------
-- SQL Stored Procedure 
------------------------------------------------------------------------
P1: BEGIN
Declare Allsales cursor with return for 
Select 
	t3.title_id, 
	t3.title,
        t2.ord_num,
        t2.stor_id,
	t2.qty, 
	t2.discount
From   
	CASTPUBS.sales t1, 
	CASTPUBS.salesdetail t2, 
	CASTPUBS.titles t3
Where  
	t1.stor_id = t2.stor_id
	And 
        t1.ord_num = t2.ord_num
	And cast (t2.title_id as varchar(6) ) = cast (t3.title_id as varchar(6))
	        ;--

open Allsales;--

END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."GETAUTHORS" ( )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  RESULT SETS 1
  LANGUAGE SQL
  ------------------------------------------------------------------
-- SQL Stored Procedure 
------------------------------------------------------------------
P1: BEGIN
declare auth_curs cursor with return for
Select 
	t1.au_id, 
	t1.au_lname, 
	t1.au_fname
From   
	CASTPUBS.authors t1
Order By  
		t1.au_lname  Asc, 
		t1.au_fname  Asc;--

open auth_curs;--

END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."GETTITLEAUTHORS"
 (IN LASTNAME VARCHAR(40),
  IN FIRSTNAME VARCHAR(20)
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  RESULT SETS 1
  LANGUAGE SQL
  P1: BEGIN 
 
 
Declare SQLCODE int default 0; --
Declare Sql_Code int default 0; --
Declare Do_Gtran smallint default 1; --
 
declare TA cursor with hold with return to caller for 
Select t2.au_lname, t2.au_fname, t1.title, t1.title_id 
From CASTPUBS.titles t1, CASTPUBS.authors t2, CASTPUBS.titleauthor t3 
Where cast (t1.title_id as varchar(6)) = cast(t3.title_id as varchar(6)) 
And cast(t2.au_id as varchar(11)) = cast(t3.au_id as varchar(11)) 
and upper(ltrim(rtrim(t2.au_lname))) like upper(ltrim(rtrim(lastname))) 
and upper(ltrim(rtrim(t2.au_fname))) like upper(ltrim(rtrim(firstname)));  --
Declare CONTINUE HANDLER FOR SQLEXCEPTION 
Begin 
	SET Sql_Code = SQLCODE; --
	if (Sql_Code = -20112) then 
		set Do_Gtran = 0; --
		set Sql_Code = 0; --
	end if; --
End; --
 
Savepoint S1 Unique on rollback retain cursors; --
 
open TA; --
if (Sql_Code < 0) then 
	Goto GTRAN; --
else 
	Set Sql_Code = SQLCODE; --
end if; --
 
GTRAN: 
if (Do_Gtran = 1) then 
	if (Sql_Code = 0) then Commit; --
	else 
	begin 
		signal sqlstate '99999' 
		set message_text=' SP GetTitleAuthors failed !!!'; 		Rollback; --
		end; --
	end if; --
end if; --
Return (Sql_Code); --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."HISTORY_PROC"
 (IN STORID CHARACTER(4)
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  RESULT SETS 1
  LANGUAGE SQL
  P1: BEGIN 
 
declare errcode integer default 0; --
declare SQLCODE integer default 0; --
declare hist_curs cursor with return for 
select date, T1.ord_num, qty, T2.title_id, discount, price, qty * price * (1 - discount/100) 
from CASTPUBS.sales T1, CASTPUBS.salesdetail T2, CASTPUBS.titles T3
where T1.stor_id = storid 
and T1.ord_num = T2.ord_num 
and cast(T3.title_id as varchar(6)) = cast(T2.title_id as varchar(6)) 
order by date desc, T1.ord_num; --

declare continue handler for sqlwarning, sqlexception, not found 
set errcode=SQLCODE; --
 
open hist_curs; --
return errcode; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."I_ORDER_LINE"
 (IN ORDERID INTEGER,
  IN TITLEID VARCHAR(6),
  IN QTTY INTEGER
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN 
 
Declare SQLCODE int default 0; --
Declare Error int default 0; --
Declare continue handler for NOT FOUND, SQLWARNING, SQLEXCEPTION 
begin 
	set Error=SQLCODE; --
	if(Error=-530) then 
		resignal SQLSTATE '23503' 
		set message_text='No id matches with this order_id or title_id!!!'; --
	end if; --
end; --
 
insert into CASTPUBS.Order_Line ( order_id, title_id, qty ) 
values ( orderid, titleid, qtty ) ; --
return Error; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."I_STOCK"
 (IN STORID CHARACTER(4),
  IN STOCKQTY INTEGER,
  IN STOCK_HIGHLEVEL INTEGER,
  IN STOCK_LOWLEVEL INTEGER,
  IN STOCKEMERGENCY CHARACTER(1)
 )

  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN 
 
Declare SQLCODE int default 0; --
Declare Error int default 0; --
Declare continue handler for NOT FOUND, SQLWARNING, SQLEXCEPTION 
begin 
	set Error=SQLCODE; --
	if(Error=-530) then 
		resignal SQLSTATE '23503' 
		set message_text='No id matches with this stor_id!!!'; --
	end if; --
	if(Error=-803) then 
		resignal SQLSTATE '23505' 
		set message_text='A Stock already exists for this store!!!'; --
	end if; --
end; --
 
insert into CASTPUBS.Stock ( stor_id, stock_qty, stock_high_level, stock_low_level, stock_emergency ) 
values ( storid, stockqty, stock_highlevel, stock_lowlevel, stockemergency ); --
return Error; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."I_STOCK_LINE"
 (IN STOCK_LINEID INTEGER,
  IN STORID CHARACTER(4),
  IN TITLEID VARCHAR(6),
  IN QTTY INTEGER
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN 
 
Declare SQLCODE int default 0; --
Declare Error int default 0; --
Declare continue handler for NOT FOUND, SQLWARNING, SQLEXCEPTION 
begin 
	set Error=SQLCODE; --
	if(Error=-530) then 
		resignal SQLSTATE '23503' 
		set message_text='No id matches this stor_id or title_id!!!'; --
	end if; --
	if(Error=-803) then 
		resignal SQLSTATE '23505' 
		set message_text='This Stock Line ID has already been defined for this Store!!!'; --
	end if; --
end; --
 
insert into CASTPUBS.Stock_Line ( Stock_Line_id, stor_id, title_id, qty, line_high_level, line_low_level ) 
values ( Stock_Lineid, storid, titleid, qtty, 0, 0 ); --
return Error; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."INSERT_SALES_PROC"
 (IN STORID CHARACTER(4),
  IN ORDERNUM VARCHAR(20),
  IN ORDERDATE VARCHAR(40),
  OUT RWCNT INTEGER
 )

  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  ------------------------------------------------------------------------
-- SQL Stored Procedure 
------------------------------------------------------------------------
P1: BEGIN
declare continue handler for sqlstate '22007' 
    resignal sqlstate '22007' set message_text='Invalid date format';--

Insert into castpubs.sales
Values(storid, ordernum, orderdate);--
get diagnostics rwcnt=row_count;--

END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."INSERT_SALES_PROC"
 (IN STORID CHARACTER(4),
  IN ORDERNUM VARCHAR(20),
  IN ORDERDATE DATE
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN 
 
Declare Ret int; --
 
Declare SQLCODE int default 0; --
Declare Sql_Code int default 0; --
Declare Do_Gtran smallint default 1; --
 
 
Declare CONTINUE HANDLER FOR SQLEXCEPTION 
Begin 
	SET Sql_Code = SQLCODE; --
	if (Sql_Code = -20112) then 
		set Do_Gtran = 0; --
		set Sql_Code = 0; --
	end if; --
End; --
 
Savepoint S1 Unique on rollback retain cursors; --
 
Insert into CASTPUBS.sales Values(storid, ordernum, orderdate); --
if (Sql_Code < 0) then 
	Goto GTRAN; --
else 
	Set Sql_Code = SQLCODE; --
end if; --
 
GTRAN: 
if (Do_Gtran = 1) then 
	if (Sql_Code = 0) then 
		Commit; --
	else 
		Rollback; --
	end if; --
end if; --
Return (Sql_Code); --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."INSERT_SALESDETAIL_PROC"
 (IN STORID CHARACTER(4),
  IN ORDNUM VARCHAR(20),
  IN TITLEID VARCHAR(6),
  IN QTTY INTEGER,
  IN DISC DOUBLE
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN 
 
Declare Ret int; --
 
Declare SQLCODE int default 0; --
Declare Sql_Code int default 0; --
Declare Do_Gtran smallint default 1; --
 
 
Declare CONTINUE HANDLER FOR SQLEXCEPTION 
Begin 
	SET Sql_Code = SQLCODE; --
	if (Sql_Code = -20112) then 
		set Do_Gtran = 0; --
		set Sql_Code = 0; --
	end if; --
End; --
 
Savepoint S1 Unique on rollback retain cursors; --
 
Insert into castpubs.salesdetail 
Values(storid, ordnum, titleid, qtty, disc); --
if (Sql_Code < 0) then 
	Goto GTRAN; --
else 
	Set Sql_Code = SQLCODE; --
end if; --
 
GTRAN: 
if (Do_Gtran = 1) then 
	if (Sql_Code = 0) then 
		Commit; --
	else 
		Rollback; --
	end if; --
end if; --
Return (Sql_Code); --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."NEWCREATESALE"
 (IN TITLE_ID VARCHAR(6),
  IN QTY INTEGER,
  IN DISCOUNT DOUBLE
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN 
 
Declare ret int default 0; --
Declare storid varchar(4); --
Declare ord_num varchar(20); --
Declare dat date; --
 
Declare SQLCODE int default 0; --
Declare Sql_Code int default 0; --
Declare Do_Gtran smallint default 1; --

 
Declare CONTINUE HANDLER FOR SQLEXCEPTION 
Begin 
	SET Sql_Code = SQLCODE; --
	if (Sql_Code = -20112) then 
		set Do_Gtran = 0; --
		set Sql_Code = 0; --
	end if; --
End; --
 
Savepoint S1 Unique on rollback retain cursors; --
 
select char(max(int(stor_id))+ 1) into storid from CASTPUBS.sales; --
set storid=coalesce(storid,char(1)); --
set dat = current date; --
set ord_num = rtrim(storid)|| varchar(dat); --
Call CASTPUBS.INSERT_SALES_PROC(storid, ord_num, dat); --
Get diagnostics Ret = RETURN_STATUS; --
if (Ret < 0) then 
	Set Sql_Code = Ret; --
	goto GTRAN; --
end if; --
Call CASTPUBS.INSERT_SALESDETAIL_PROC (storid, ord_num, title_id, qty, discount); --
if (Sql_Code < 0) then 
	Goto GTRAN; --
else 
	Set Sql_Code = SQLCODE; --
end if; --
 
GTRAN: 
if (Do_Gtran = 1) then 
	if (Sql_Code = 0) then 
		Commit; --
	else 
		Rollback; --
	end if; --
end if; --
Return (Sql_Code); --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."STOREID_PROC"
 (IN STORID CHARACTER(4)
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  RESULT SETS 1
  LANGUAGE SQL
  P1: BEGIN 
 
declare errcode integer default 0; --
declare SQLCODE integer default 0; --
Declare stor_curs cursor with return for 
	select stor_name, stor_id, stor_address, city, state, postalcode, country 
	from CASTPUBS.stores 
	where stor_id = storid; --
declare continue handler for sqlwarning, sqlexception, not found set errcode=SQLCODE; --
 
open stor_curs; --
return errcode; --
 
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."STORENAME_PROC"
 (IN STORNAME VARCHAR(6)
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN 
 
declare lowered_name varchar(40); --
declare errcode integer default 0; --
declare SQLCODE integer default 0; --
declare stor_curs cursor with return for 
select stor_name, stor_id, stor_address, city, state, postalcode, country from CASTPUBS.stores 
where lower(stor_name) like lowered_name; --
declare continue handler for sqlwarning, sqlexception, not found set errcode=SQLCODE; --
 
set lowered_name = lower(storname)|| '%'; --
open stor_curs; --
return errcode; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."TITLE_PROC"
 (IN TIT VARCHAR(80),
  OUT ERRCODE INTEGER
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  P1: BEGIN 
 
declare tit2 varchar(80); --
declare errcode integer default 0; --
declare SQLCODE integer default 0; --
declare tit_cur cursor with return for 
select title, title_id, price 
from CASTPUBS.titles 
where lower(title) like tit2; --
declare continue handler for sqlwarning, sqlexception, not found set errcode=SQLCODE; --
 
set tit2 = concat(lower( tit ),'%'); --
open tit_cur; --
get diagnostics errcode=RETURN_STATUS; --
return errcode; --
END P1;
SET CURRENT SCHEMA = "CASTPUBS";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE "CASTPUBS"."TITLEID_PROC"
 (INOUT TITLEID VARCHAR(80),
  OUT ROWCOUNT INTEGER
 )
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  CALLED ON NULL INPUT
  LANGUAGE SQL
  ------------------------------------------------------------------------
-- SQL Stored Procedure 
------------------------------------------------------------------------
P1: BEGIN

declare titid cursor with return for
Select  title, title_id, price
From    CASTPUBS.titles
Where   Lower(cast (title_id as varchar(6) )) Like titleid;--

Set titleid = Lower(titleid )||'%';--

open titid;--

-- get diagnostics rowcount= row_count;--


END P1;

COMMIT WORK;

CONNECT RESET;

TERMINATE;

