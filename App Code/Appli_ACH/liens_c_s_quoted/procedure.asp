<html>
<body>
<%
	dim connect
	dim cmdTemp
	
	set connect=server.createobject("adodb.connection")
	connect.open "DRIVER={Microsoft ODBC for Oracle};UID=SYSTEM;PWD=MANAGER;SERVER=O816ACH;"
			' Cr�ation d'un objet ActiveX de type ADODB.Command
	set cmdTemp=server.createobject("adodb.command")
		' Ex�cution sur une procedure pour (oracle/MS)	
	if (ORACLE=1) then
		cmdTemp.CommandText="declare per number; para2 varchar2(255); begin per:=1; para2:='toto'; ""quoted base"".""insert_��_��"" (per,para2); end;"
	else
		cmdTemp.CommandText="declare @p_int int declare @p_char varchar(25) int begin exec dbo.""insert &�(-�_��)"" @p_int, @p_char end"
	end if
		' d�finition du type de command : utilise une stored procedure
	cmdTemp.CommandType=adCmdText
		' indique quelle connection utiliser
	set cmdTemp.ActiveConnection=connect
		' ex�cute la la ligne commandText
	cmdTemp.Execute
%>
</body>
</html>
