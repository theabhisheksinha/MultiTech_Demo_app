Create Proc dbo.GetAuthors
As
  Begin
/**********************************************************
*Procedure  Name: GetAuthors
*Database: CASTpubs
*Server: LONDON_SERVER_O
*CAST SQL-Builder  R3.7
*
*Business Function : Retourne la liste des auteurs
*Author BF: SYS		Date BF: 02/28/2000
*
*Author: SYS          Date: 02/28/2000
*  Comment: creation
*********************************************************/

Select 
	t1.au_id, 
	t1.au_lname, 
	t1.au_fname
From   
	authors t1
Order By  
		t1.au_lname  Asc, 
		t1.au_fname  Asc


end     