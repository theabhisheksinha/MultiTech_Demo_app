<HTML>
<%@ Language=VBScript %>

<HEAD>
<title>Nom</title>
<SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript src="time.js"></script>
<script language="javascript">
function button1_onclick() {
/* affiche la suite dans la fenetre courante avec une instruction open*/
	var nom=window.name;
	open('index.html',nom);
}
</SCRIPT>
<script language="JavaScript" src="browserid.js"></script>
</HEAD>
<BODY onLoad="display_time_in_status_line();">

<P>Welcome <%= session("login")%>         , you are connected to <%= session("serv")%></p>
<script>document.write('Vous utilisez <B>',browserID(),'.</B> Bonne continuation!');</script><p></p>
<p align="center"><strong>SERVER VARIABLES</strong></p>
<p><strong><u>remote_addr</u> : </strong><%=Request.ServerVariables("remote_addr")%></p>
<p><strong><u>remote_host</u> : </strong><%=Request.ServerVariables("remote_host")%></p>
<p><strong><u>request_method</u> : </strong><%=Request.ServerVariables("request_method")%></p>
<p><strong><u>server_name</u> : </strong><%=Request.ServerVariables("server_name")%></p>
<p><strong><u>server_software</u> : </strong><%=Request.ServerVariables("server_software")%></p>
<P>
</P>
<center>&nbsp;</center>
<CENTER>&nbsp;</CENTER>
<CENTER><INPUT id=button1 name=button1 type=button value=CONTINUER LANGUAGE=javascript onclick="button1_onclick();"></CENTER>
</BODY>
</HTML>
