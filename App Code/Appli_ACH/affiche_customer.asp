<% response.buffer=true%>
<% function ExecProc
		dim query
			' Lien vers la table authors de castpubs
		 query="select * from authors"

			' Création d'un objet ActiveX de type ADODB.Command
		set cmdTemp=server.createobject("adodb.command")
			' entre le nom de la Stored Procedure à utiliser
			' Dans le cas de la procédure BYROYALTY, le DBMS_OUTPUT ne renvoie pas le texte au browser 
			' -> Pas d'affichage mais la proc est valide et s'exécute normalement
	
		cmdTemp.CommandText="byroyalty"
			' définition du type de command : utilise une stored procedure
		cmdTemp.CommandType=adCmdStoredproc
			' indique quelle connection utiliser
		set cmdTemp.ActiveConnection=session("objconnect")
			' exécute la la ligne commandText
		cmdTemp.Execute
			
			' Utilise une procédure vide pour faire un lien avec une procédure d'un package
			' AUTHORSPKG.listeauthors_proc
		cmdTemp.CommandText="AUTHORSPKG.listeauthors_proc"
			' définition du type de command : utilise une stored procedure
		cmdTemp.CommandType=adCmdStoredproc
			' indique quelle connection utiliser
		set cmdTemp.ActiveConnection=session("objconnect")
			' exécute la la ligne commandText
		cmdTemp.Execute
	
			' Utilise une fonction pour un lien avec MS2000
		cmdTemp.CommandText="Fct_Return_Scalar"
			' définition du type de command : utilise une stored procedure
		cmdTemp.CommandType=adCmdStoredproc
			' indique quelle connection utiliser
		set cmdTemp.ActiveConnection=session("objconnect")
			' exécute la la ligne commandText
		cmdTemp.Execute

			' Désalloue l'objet command	
		set cmdTemp=nothing
  end function
%>
<html>
<head>
<title>Affichage des CUSTOMER MYRF</title>
<script language="JavaScript" src="time.js"></script>
</head>

<body bgcolor="#FFFFFF" onLoad="display_time_in_status_line();">
<!-- charge la procédure pour afficher la date dans la status barre au demarrage-->

<p>&nbsp;</p>
<p><b><center>Liste des Customers</center></b></p>
<p>&nbsp;</p>

<%
' Vérifie que la connection est ouverte sinon ouvre une connection
if session("objconnect")="" then
	session("objconnect").open session("serv"),session("login"),session("password")
end if
' appelle la fonction ExecProc pour exécuter une Stored Procedure sur la base CASTPUBS.
ExecProc()

%>
<div align="center"><br>
<a href="enregistre_employee.htm">Enregistrer un nouvel employé</a> - <a href="efface.htm">Efface un employé</a> - <a href="index.html">Retour au sommaire</a></div>
<a href="MYRF"></a>
</body>

</html>
