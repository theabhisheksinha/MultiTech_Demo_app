#!c:\Perl\bin\perl.exe
print "Content-type: text/html\n\n";
use Win32::ODBC;
use CGI qw(param);
print "<html>";

# The intermediate variables below make your script more readable
# but somewhat less efficient since they are not really necessary.
# If you do not want to use these variables, clear the
# Intermediate Variables checkbox in the Tools | Options dialog box, CGI Wizard tab.

$login = param("login") ;	#login
$password = param("password") ;	#password
$server = param("server") ;	#nom du serveur
$titleid = param("titleid");
$MYRF = param("MYRF");

print <<EOP; 

<head>
<title>CAST Demonstration Application</title>

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
    <td colspan="3" height="1" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3" height="1" valign="top">
      <form  name=form1 method=post action="salescreated.pl" >
        <center>
          <p> 
          <table border=0 cellpadding=1 cellspacing=1 height=27 
style="HEIGHT: 25px; WIDTH: 650px" width="92.02%">
            <tr> 
              <td align=middle nowrap> 
                <div align="center"><font face="Comic Sans MS" color="#003399">SALES 
                  OF THE BOOK: </font> </div>
              </td>
            </tr>
          </table>
        </center>
        &nbsp; 
        <p></p>
        <p>&nbsp;</p>
        <center>
          <table border=0 cellpadding=1 cellspacing=1 height=27 
style="HEIGHT: 25px; WIDTH: 650px" width=548>
            <tr> 
              <th align=left width="141"> 
                <p align=right> 
                <p align="right"><font color="#003399">Quantity:</font></p>
              </th>
              <p></p>
              <td width="120"> 
                <p align=center> 
                  <input id=qte name=qte align = 
            center tabindex=2 size="15">
                </p>
              </td>
              <td align=right width="274"> 
              </td>
            </tr>
            <tr> 
              <th align=left width="141"> 
                <p align=right><font color="#003399">Discount:</font> 
              </th>
              <p></p>
              <td width="120"> 
                <p align=center> 
                  <input id=discount name=discount align = 
            center tabindex=3 size="15">
                </p>
              </td>
              <td align=right width="274">
                <p align=center> 
EOP

print("<input type=\"hidden\" name=\"hidlog\" value=\"$login\">");
print("<input type=\"hidden\" name=\"hidpass\" value=\"$password\">");
print("<input type=\"hidden\" name=\"hidserv\" value=\"$server\">");
print("<input type=\"hidden\" name=\"hidtit\" value=\"$titleid\">");

print("<input id=submit1 name=submit12 type=submit value=\"OK\" style=\"HEIGHT: 24px; WIDTH: 125px\" tabindex=4>");

print("</p></td></tr></table></center></form></td></tr></table></body></html>");

          

exit(); # Terminates the script