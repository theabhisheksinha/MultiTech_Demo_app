<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>
<%session("ville")=Request.QueryString("ville")%>
<script language="javascript">
var wind;
wind=window.open("index2.asp","ville","Height=1,Width=230,menubar=no,toolbar=no");
wind.focus();
</script>
<%
dim i
do while i<200000
	i=i+1
	if i=200000-1 then Response.Redirect("index.html")
loop%>
<P>&nbsp;</P>

</BODY>
</HTML>
