<html>
<head><title>Effacer un employ�</title>
<script language="JavaScript" src="time.js"></script>
</head>

<body bgcolor="#FFFFFF" onLoad="display_time_in_status_line();">
<%
' r�cup�re le No de l'employ�e � effacer
num=request.form("num_employ")
' V�rification que l'employ� est bien rentr�
if num="" then
	response.write("<center>Effacement impossible. Vous n'avez pas indiqu� le num�ro de l'employ� � effacer<br>")
	response.write("<a href='efface.htm'>Retour au formulaire</a></center>")
else
' lance la requ�te SQL vers le serveur au moins de l'objet connection 
	req="delete from titles where title_id="&num
	session("objconnect").execute(req)
	response.write("<br><center>suppression effectu�e<br>")
	response.write("<a href='affiche_employee.asp'>Retour � la liste des employ�s</a></center>")
end if
%>

</body>

</html>
