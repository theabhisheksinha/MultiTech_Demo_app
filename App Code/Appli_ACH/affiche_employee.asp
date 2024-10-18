<% response.buffer=true%>
<html>
<head>
<title>Affichage des employés</title>
<script language="JavaScript" src="time.js"></script>
</head>

<body bgcolor="#FFFFFF" onLoad="MYRF();">
<!-- charge la procédure pour afficher la date dans la status barre au demarrage-->

<p>&nbsp;</p>
<p><b><center>Liste des employés triés par ID</center></b></p>
<p>&nbsp;</p>

<%
dim date
' lien vers un outil java : interpété comme un activeX de type unknown
set date=GetObject("java:java.util.Date")
%>
<p>The date is <%=date.tostring()%></p>

<%
' Vérifie que la connection est ouverte sinon ouvre une connection
if session("objconnect")="" then
	session("objconnect").open session("serv"),session("login"),session("password")
end if

' objet temporaire qui ne fait rien mais simplement un appel à un objet ActiveX

set applet=GetObject("java:java.applet.Applet")

' ecrit la requète SQL et exécute sur le serveur avec l'objet connection défini avant
req_sql="select * from titleview order by au_id"
' création explicite de l'objet recordset qui reçoit les données de la requete sQL
set rstemp=CreateObject("ADODB.recordset")
set rstemp=session("objconnect").execute(req_sql)
%>
<!-- affiche les résultats de la requète dans un tableau-->
<table border="1">
<tr> 	<%for i=0 to rstemp.Fields.Count-1%>
	<th><%=rstemp(i).name%></th>
	<%next%></th>
<% do while not rstemp.eof%>
<tr>	<%for i=0 to rstemp.fields.count-1%>
	<td><%response.write rstemp(i)%></td>
	<%next%></tr>
<%rstemp.movenext
loop
' desallocation del'objet résultat de la requête 
set rstemp=nothing
%>
</table>

<div align="center"><br>
<a href="enregistre_employee.htm">Enregistrer un nouvel employé</a> - <a href="efface.htm">Efface un employé</a> - <a href="index.html">Retour au sommaire</a></div>

</body>

</html>
