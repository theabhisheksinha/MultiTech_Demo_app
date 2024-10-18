#!c:\Perl\bin\perl.exe
print "Content-type: text/html\n\n";

print <<EOP; 

<html>
<head>
<title>
CAST Demo Application</title>
</head>
<body bgcolor="#FFFFFF" background="pageart/bg_orange.gif">
<table cellspacing = "0" cellpadding = "0" border = "0">  
<tr>
     <td width="463" height="12" valign="top"></td>
     <td width="34" height="12" valign="top"></td>
     <td width="174" height="12" valign="top"></td>  
</tr>

<tr>
     <td width="463" height="31" valign="top">
     <img src="pageart/title.gif" width="459" height="31">
     </td>    
     <td width="34" height="31" valign="top">
     </td>
     <td width="174" height="31" valign="bottom">
     <img src="pageart/logo_ani.gif" width="174" height="21">
     </td>  
</tr>

<tr>
     <td width="671" height="27" colspan="3" valign="middle" bgcolor="#FF6600">       
     <div align="right">
     <font face="Arial, Helvetica, sans-serif" size="-2" color="#FFFFFF">
	<SCRIPT LANGUAGE='JavaScript1.2' SRC='date.js'>
	</SCRIPT>
	</font>
	</div>
	</td>
</tr>
<tr>
     <td width="463" height="1" valign="top">
     <img width="463" height="1" src="pageart/transparent.gif">
     </td>
     <td width="34" height="1" valign="top">
     <img width="34" height="1" src="pageart/transparent.gif">
     </td>
     <td width="174" height="1" valign="top">
     <img width="174" height="1" src="pageart/transparent.gif">
     </td>
</tr>
<tr>
     <td width="463" height="1" valign="top">&nbsp;</td>
     <td width="34" height="1" valign="top">&nbsp;</td>
     <td width="174" height="1" valign="top">&nbsp;</td>
</tr>
<tr>
     <td colspan="3" height="20" valign="top"></td>
</tr>

<tr>

    <td colspan="3" height="1" valign="top">
    <center>
    <p><big>
    <font face="Comic Sans MS" color="#003399">CONNECTION TO ORACLE SERVER</font>
    </big></p>
    </center>
    
    <center>
    <form  name=form1 method=post action="listauthors.pl" >
    <br>
    <table border=0 cellpadding=7 cellspacing=3 height=117 style="HEIGHT: 117px" align  =center background="">
<tr>
    <td width="93">
    <font color="#003399" face="Comic Sans MS">Login</font>
    </td>          
    <td width="158">             
    <input id=login name="login" >          
    </td>
</tr>

<tr>
    <td width="93"><font color="#003399" face="Comic Sans MS">Password</font></td>
    <td width="158">
    <input id=password name="password" type=password>
    </td>
</tr>
<tr>
	<td width="93">
	<font color="#003399" face="Comic Sans MS">Server</font></td>
	<td width="158">
	<input id=server name="server">
	</td>
</tr>

<tr>
	<td width="93">&nbsp;
    </td>
    <td width="158">&nbsp;
    </td></tr>
    <td width="93">&nbsp;</td>        
    <td width="158">
    <input id=submit1 name=submit1 type=submit value=Connect>
    </td>
</tr>
</table>
</form>
</center>
	</td>
</tr>
</table>
</body>
</html>

EOP

exit(); # Terminates the script