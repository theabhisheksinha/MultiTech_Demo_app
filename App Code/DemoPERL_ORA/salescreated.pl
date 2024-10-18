#!c:\Perl\bin\perl.exe
print "Content-type: text/html\n\n";
use Win32::ODBC;
use CGI qw(:param);
print ("<html>");

$login=param("hidlog");	#login
$password = param("hidpass");	#password
$server = param("hidserv");	#nom du serveur
$titleid = param("hidtit");
$qte = param("qte");
$discount = param("discount");

$db = new Win32::ODBC("Driver=Microsoft ODBC for Oracle;Server=fresu;uid=castpubs;pwd=castpubs");
$sql = "BEGIN salepkg.NewCreateSale('pc888','1','1');END;";
if ($db->sql($sql)) 
		{ die "Died on $sql: " . $db->Error(); }
print ("<html>");

print <<EOP;  

<head>
<title>CAST Demonstration Application</title>
<script language="Perl" src="cgi-lib.pl"></script>
</head>
<body bgcolor="#FFFFFF" background="pageart/bg_orange.gif">
<table cellspacing="0" cellpadding="0" border="0">
  <tr> 
    <td width="463" height="12" valign="top"></td>
    <td width="34" height="12" valign="top"></td>
    <td width="174" height="12" valign="top"></td>
  </tr>
  <tr> 
    <td width="463" height="31" valign="top"><img src="pageart/title.gif" width="459" height="31"></td>
    <td width="34" height="31" valign="top"></td>
    <td width="174" height="31" valign="bottom"><img src="pageart/logo_ani.gif" width="174" height="21"></td>
  </tr>
  <tr> 
    <td width="671" height="27" colspan="3" valign="middle" bgcolor="#FF6600"> 
      <div align="right"><font face="Arial, Helvetica, sans-serif" size="-2" color="#FFFFFF"> 
        <SCRIPT LANGUAGE='JavaScript1.2' SRC='date.js'></SCRIPT>
        </font></div>
    </td>
  </tr>
  <tr> 
    <td width="463" height="1" valign="top"><img width="463" height="1" src="pageart/transparent.gif"></td>
    <td width="34" height="1" valign="top"><img width="34" height="1" src="pageart/transparent.gif"></td>
    <td width="174" height="1" valign="top"><img width="174" height="1" src="pageart/transparent.gif"></td>
  </tr>
  <tr> 
    <td width="463" height="1" valign="top">&nbsp;</td>
    <td width="34" height="1" valign="top">&nbsp;</td>
    <td width="174" height="1" valign="top">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3" height="1" valign="top">
      <p align="center"><font face="Comic Sans MS" color="#003399">SALE CREATED</font></p>
      <form method="post" action="listauthors.pl">
        <div align=center>&nbsp;
EOP

print("<input type=\"hidden\" name=\"login\" value=\"$login\">");
print("<input type=\"hidden\" name=\"password\" value=\"$password\">");
print("<input type=\"hidden\" name=\"server\" value=\"$server\">");
	
print <<EOP;  

          <input name=Submit type=submit value=Ok>
        </div>
      </form>
    </td>
  </tr>
  <tr>
    <td colspan="3" height="1" valign="top">&nbsp;</td>
  </tr>
</table>
EOP
print("</body>");
print("</html>");

$db->Close();
exit(); # Terminates the script