<html>
<head>
<title>Document sans-titre</title>
<script language="JavaScript" src="time.js"></script>
</head>

<body bgcolor="#FFFFFF" onLoad="display_time_in_status_line();">
<%
' r�cup�re les param�tres pour ins�rer un employ� dans la table castpubs.authors
employee_id=request.form("employee_id")
last_name=request.form("last_name")
first_name=request.form("first_name")
middle_initial=request.form("middle_initial")
job_id=request.form("job_id")
manager_id=request.form("manager_id")
hire_date=request.form("hire_date")
salary=request.form("salary")
commission=request.form("commission")
department_id=request.form("department_id")

if last_name="" then%>
<form><input type="BUTTON" value="RETOUR" onClick="window.history.back();"></form>
<%
else
	'pr�paration des variables pour affecter � authors
	' RQ : la requete ne fonctionne pas mais fait un lien vers authors
	dim phone
	phone=CInt(middle_initial)

' envoie la requ�te SQL au serveur
	req_sql="INSERT INTO authors (au__id,au_lname,au_fname,phone,address,city,state,country,postalcode) VALUES ('"&employee_id&"','"&last_name&"','"&first_name&"','"&middle_initial&"','"&job_id&"','"&manager_id&"','"&hire_date&"','"&salary&"','"&commission&"')"
	session("objconnect").execute(req_sql)
	response.write("<center>Enregistrement effectu�</center>")
end if
%>
<a href="index.html">Retour au sommaire g�n�ral</a> - <a href="affiche_employee.asp">Affiche la liste des employ�s</a>

</body>

</html>
