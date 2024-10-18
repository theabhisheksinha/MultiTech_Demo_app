/*  fichier de test de liens avec le code scan fait sur la base du schéma castpubs de O817QA5 */

/* objets serveurs en commentaires */

// titles
/* titleview, deltitle, sproc_debug, seq_defects
' byroyalty, CREATESALEPKG, E_Stock, Fct_Return_InLine_Table */

// objets serveurs dans des string */

"authors"
"DeliverOrder"
"getauthorspkg"
"CreateSale"
"SEQ_303_1"
"sbonus"
"UPDTITLES"
"viewtitleauthor"
"MYRF"

'fonction storename_proc'
'package discount_procpkg'
'procédure history_proc'
'sequence Seq_Defects'
'synonym SBONUS'
'table Invoice'
'trigger on_delete_authors'
'view Available_Delivery'
'Fct_Return_Scalar'

// objets serveurs en embedded SQL

SELECT * FROM AuthorIdCodes;
DELETE on_delete_authors;
INSERT into salesdetail;
UPDATE sAuthorIdCodes SET odrghiqemr =zkef;
SELECT s_304_1;
SELECT GetAllSales ;
SELECT defectspkg.ctrl_defect(vartitleid);
SELECT I_Stock;
EXECUTE dbo.Fct_Return_Table;