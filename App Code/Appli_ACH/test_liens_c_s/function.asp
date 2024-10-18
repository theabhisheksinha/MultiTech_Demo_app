<html>
<body>
<%
	dim connect
	dim cmdTemp
	
	set connect=server.createobject("adodb.connection")
	connect.open "DRIVER={Microsoft ODBC for Oracle};UID=SYSTEM;PWD=MANAGER;SERVER=O816ACH;"
			' Création d'un objet ActiveX de type ADODB.Command
	set cmdTemp=server.createobject("adodb.command")
		' Lien vers une fonction (MS/ORACLE)
	if (ORACLE=1) then
		cmdTemp.CommandText="declare var number; begin var:=createnewinvoice; end;"
	else
		cmdTemp.CommandText="declare @var int begin @var:=fnc_return_scalar 'toto' end"
	end if 
		' définition du type de command : utilise une stored procedure
	cmdTemp.CommandType=adCmdText
		' indique quelle connection utiliser
	set cmdTemp.ActiveConnection=connect
		' exécute la la ligne commandText
	cmdTemp.Execute
%>
</body>
</html>
