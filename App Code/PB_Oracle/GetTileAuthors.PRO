create or replace PROCEDURE PUBSPB.GETTITLEAUTHORS (
	P_AUFNAME IN VARCHAR2,
	P_AULNAME IN VARCHAR2,
	RC1 IN OUT GETTITLEAUTHORSPKG.RCT1
)
As
Begin
	
		Open RC1 For
		Select t2.au_lname,  t2.au_fname,  t1.title,  t1.title_id 
		From titles t1, authors t2, titleauthor t3 
		Where t1.title_id = t3.title_id 
		 And t2.au_id = t3.au_id 
		 And Upper(Ltrim(Rtrim(t2.au_lname)))  Like Upper(Ltrim(Rtrim(P_aulname)))   
		 And Upper(Ltrim(Rtrim(t2.au_fname)))  Like Upper(Ltrim(Rtrim(P_aufname)));

End GetTitleAuthors;
