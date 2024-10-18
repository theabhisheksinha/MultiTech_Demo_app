<html>
<!-- inclu le fichier time.js qui contient la fonction d'affichage de l'heure
dans la status barre-->

<script language="JavaScript" src="time.js"></script>

<head>
</head>

<body onLoad="display_time_in_status_line();">
<!-- #include file="inclu.inc" -->
<%
' Initialise toutes les variables globales nécéssaires à la connection
	session("serv")=request.form("serv")
	session("login")=request.form("usid")
	session("password")=request.form("pwd")
	session("servtyp")=Request.Form("servtyp")
	session("myrf")=Request.Form("MYRF")
	
if session("servtyp")="Serveur Oracle" then 
	driver="DRIVER={Microsoft ODBC for Oracle}"
else driver="DRIVER={SQL Server}"
end if

if not (session("objconnect")="") then 
	session("objconnect").close
end if
session("objconnect").open driver+";UID="+session("login")+";PWD="+session("password")+";SERVER="+session("serv")+";"

' Redirige vers la page nom.asp pour la suite
%>
<script language="Javascript">

//  fixe le nom de la fenêtre principale

var nom=window.name

// créer les variables pour l'ouverture des nouvelles fenêtres

var new_window=window.open("essai1.pl","cgi");
var win_princ=window.open("nom.asp",nom);

// force la fenêtre principale sur le dessus

new_window.blur();
win_princ.focus();
</script>
</body>

</html>
