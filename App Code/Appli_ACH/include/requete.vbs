dim requete1
dim requete2
dim requete3
dim requete4
   
' Liens vers une table
requete1= "select * from Invoice"

' Liens vers une proc
requete2="exec D_Invoice_Line 10,11"

' Liens vers une fonction
requete3="exec Fct_Return_Table"

' Liens vers une vue
requete4="select * from titleview"
