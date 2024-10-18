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
#$dbname = param("dbname") ;	#nom de la base


print <<EOP; 

<head>
<script language="JavaScript" src="script.js">
</script>
<title>CAST Demo Application</title>
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

EOP
#database=$dbname
$db = new Win32::ODBC("Driver=Microsoft ODBC for Oracle;Server=$server;uid=$login;pwd=$password");
$sql = "SELECT AU_LNAME, AU_FNAME FROM AUTHORS ORDER BY AU_LNAME, AU_FNAME";

if ($db->sql($sql)) 
		{ die "Died on $sql: " . $db->Error(); }

print <<EOP; 

  <tr> 
    <td colspan="3" height="1" valign="top">
      <p align="center"><font size="4"><font face="Comic Sans MS" color="#003399" size="5">List 
        of Authors</font></font></p>
      <p align="center">&nbsp;</p>
      <p align="center"></p>
      <div align="center"> 
        <table width="34%" border="1">
          <tr> 
            <td width="53%"> 
              <div align="center"><font color="#003399" face="Comic Sans MS">Last 
                Name</font></div>
            </td>
            <td width="47%"> 
              <div align="center"><font color="#003399" face="Comic Sans MS">First 
                Name</font></div>
            </td>
          </tr>
                 
EOP


while ($db->FetchRow()) {

# This says "While there are records, fetch
# the next row and then do this loop enclosed
# in these {} braces:".

($lname) = $db->Data('AU_LNAME');
($fname) = $db->Data('AU_FNAME');

print "<tr>";
# This how we actually get the data for the
# row we just fetched. $db->Data() returns
# the values into the variables you specify.

print ("<td><a href=\"listTitles.pl?lname=$lname&amp;fname=$fname&amp;login=$login&amp;password=$password&amp;server=$server&amp;dbname=$dbname&amp;servertype=$servertype\">$lname</td>");
print ("<td><a href=\"listTitles.pl?lname=$lname&amp;fname=$fname&amp;login=$login&amp;password=$password&amp;server=$server&amp;dbname=$dbname&amp;servertype=$servertype\">$fname</td>");
print ("</tr>");

# Make a table row (TR), prints each item
# into a table cell (TD), then close the 
# table row.
#
# Since this is the last command in the 
# loop, it returns to the beginning while 
# there are still records to read. So
# all records are printed in a table row.

}

print "</table></div></td></tr><tr><td colspan=\"3\" height=\"1\" valign=\"top\">&nbsp;</td>";
print "</tr></table></body></html>";

# Close the table and page..

$db->Close(); # Terminate the connection to the DSN

exit(); # Terminates the script

