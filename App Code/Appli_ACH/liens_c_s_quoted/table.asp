<html>
<body>
<%
	dim connect
	dim cmdTemp
	
	set connect=server.createobject("adodb.connection")
	connect.open "DRIVER={Microsoft ODBC for Oracle};UID=SYSTEM;PWD=MANAGER;SERVER=O816ACH;"
			' Création d'un objet ActiveX de type ADODB.Command
	set cmdTemp=server.createobject("adodb.command")
		' Exécution sur une table (MS/ORACLE)
	if (MICROSOFT=1) then
		cmdTemp.CommandText="select * from [quoted_base].[dbo].[tab§¨?specials]"
	else
		cmdTemp.CommandText="select * from  ""quoted base"".""tab}right{brace"""
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


