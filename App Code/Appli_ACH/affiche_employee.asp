<% response.buffer=true%>
<html>
<head>
<title>Affichage des employ�s</title>
<script language="JavaScript" src="time.js"></script>
</head>

<body bgcolor="#FFFFFF" onLoad="MYRF();">
<!-- charge la proc�dure pour afficher la date dans la status barre au demarrage-->

<p>&nbsp;</p>
<p><b><center>Liste des employ�s tri�s par ID</center></b></p>
<p>&nbsp;</p>

<%
dim date
' lien vers un outil java : interp�t� comme un activeX de type unknown
set date=GetObject("java:java.util.Date")
%>
<p>The date is <%=date.tostring()%></p>

<%
' V�rifie que la connection est ouverte sinon ouvre une connection
if session("objconnect")="" then
	session("objconnect").open session("serv"),session("login"),session("password")
end if

' objet temporaire qui ne fait rien mais simplement un appel � un objet ActiveX

set applet=GetObject("java:java.applet.Applet")

' ecrit la requ�te SQL et ex�cute sur le serveur avec l'objet connection d�fini avant
req_sql="select * from titleview order by au_id"
' cr�ation explicite de l'objet recordset qui re�oit les donn�es de la requete sQL
set rstemp=CreateObject("ADODB.recordset")
set rstemp=session("objconnect").execute(req_sql)
%>
<!-- affiche les r�sultats de la requ�te dans un tableau-->
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
' desallocation del'objet r�sultat de la requ�te 
set rstemp=nothing
%>
</table>

<div align="center"><br>
<a href="enregistre_employee.htm">Enregistrer un nouvel employ�</a> - <a href="efface.htm">Efface un employ�</a> - <a href="index.html">Retour au sommaire</a></div>

</body>

</html>
