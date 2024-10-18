#!c:\Perl\bin\perl.exe
print "Content-type: text/html\n\n";
use Win32::ODBC;
use CGI qw(param);
use MYRF;

$lname = param("lname") ;
$fname = param("fname") ;
$login = param("login") ;	#login
$password = param("password") ;	#password
$server = param("server") ;	#nom du serveur
$servertype = param("servertype") ;	#password
$MYRF=param("MYRF"); #MYRF


print "<html>";

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
 
      <p align="center"><font size="4"><font face="Comic Sans MS" color="#003399" size="5">
	  Titles written by 
EOP

print("$lname ");
print(" $fname");
print <<EOP;
			  </font></font></p>
       
      <p>&nbsp;</p>
      <form name="formbook" id="formbook">
        <div align="center">
          <center>
            <table border="0">
              <tr> 
EOP

$db = new Win32::ODBC("Driver=Microsoft ODBC for Oracle;Server=$server;uid=$login;pwd=$password");
$sql = "SELECT AUTHORS.AU_LNAME, AUTHORS.AU_FNAME, TITLES.TITLE, TITLES.TITLE_ID FROM TITLEAUTHOR, AUTHORS, TITLES WHERE TITLES.TITLE_ID = TITLEAUTHOR.TITLE_ID AND TITLEAUTHOR.AU_ID = AUTHORS.AU_ID AND UPPER(LTRIM(RTRIM(AUTHORS.AU_LNAME))) LIKE UPPER(LTRIM(RTRIM('$lname'))) AND UPPER(LTRIM(RTRIM(AUTHORS.AU_FNAME))) LIKE UPPER(LTRIM(RTRIM('$fname')))";
if ($db->sql($sql)) 
		{ die "Died on $sql: " . $db->Error(); }

while ($db->FetchRow()) 

{

($titleid) = $db->Data('TITLE_ID');
($title) = $db->Data('TITLE');
print("<tr><td><a href=\"createsale.pl?titleid=$titleid&amp;lname=$lname&amp;fname=$fname&amp;login=$login&amp;password=$password&amp;server=$server&amp;dbname=$dbname&amp;servertype=$servertype\"><img src=\"pageart/puce.gif\" width=\"13\" height=\"13\" border=\"0\"></a></td>");
print("<td><a href=\"createsale.pl?titleid=$titleid&amp;lname=$lname&amp;fname=$fname&amp;login=$login&amp;password=$password&amp;server=$server&amp;dbname=$dbname&amp;servertype=$servertype\">$title</a></td></tr>");

}
print("</table></center></div></form></td></tr></table></body></html>");

$db->Close();

exit(); # Terminates the script