<html>
<head><title>Effacer un employé</title>
<script language="JavaScript" src="time.js"></script>
</head>

<body bgcolor="#FFFFFF" onLoad="display_time_in_status_line();">
<%
' récupère le No de l'employée à effacer
num=request.form("num_employ")
' Vérification que l'employé est bien rentré
if num="" then
	response.write("<center>Effacement impossible. Vous n'avez pas indiqué le numéro de l'employé à effacer<br>")
	response.write("<a href='efface.htm'>Retour au formulaire</a></center>")
else
' lance la requête SQL vers le serveur au moins de l'objet connection 
	req="delete from titles where title_id="&num
	session("objconnect").execute(req)
	response.write("<br><center>suppression effectuée<br>")
	response.write("<a href='affiche_employee.asp'>Retour à la liste des employés</a></center>")
end if
%>

</body>

</html>
