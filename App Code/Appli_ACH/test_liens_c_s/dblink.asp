<html>
<body>
<%
	dim connect
	dim cmdTemp
	
	set connect=server.createobject("adodb.connection")
	connect.open "DRIVER={Microsoft ODBC for Oracle};UID=SYSTEM;PWD=MANAGER;SERVER=O816ACH;"
			' Cr�ation d'un objet ActiveX de type ADODB.Command
	set cmdTemp=server.createobject("adodb.command")
		' Ex�cution sur une table via un DB-Link (ORACLE)	
	cmdTemp.CommandText="select * from EMPLOYEE@O2_CWQA1.QA"
		' d�finition du type de command : utilise une stored procedure
	cmdTemp.CommandType=adCmdText
		' indique quelle connection utiliser
	set cmdTemp.ActiveConnection=connect
		' ex�cute la la ligne commandText
	cmdTemp.Execute
%>
</body>
</html>
