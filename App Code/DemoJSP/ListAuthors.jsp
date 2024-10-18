<%@ page language="java" import="myBean" errorPage="ErrorPage.jsp"%>

<jsp:useBean id="myBean" class="myBean" scope="session"/>

<html>
<head>
 <script language="JavaScript" src="Scripts/script.js"></script>
 <script language="JavaScript" src="Scripts/date.js"> </script>
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
        <script language="javascript">display_date();</script>
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
      <p align="center"><font size="4"><font face="Comic Sans MS" color="#003399" size="5">List 
        of Authors</font></font></p>
      <p align="center">&nbsp;</p>
      <p align="center"></p>
      <div align="center"> 
        <table width="34%" border="1">
          <tr> 
            <td width="53%"> 
              <div align="center"><font color="#003399" face="Comic Sans MS">Last Name</font></div>
            </td>
            <td width="47%"> 
              <div align="center"><font color="#003399" face="Comic Sans MS">First Name</font></div>
            </td>
          </tr>
		  <%= myBean.getListeAuthors() %>
        </table>
      </div>
    </td>
  </tr>
  <tr>
    <td colspan="3" height="1" valign="top">&nbsp;</td>
  </tr>
</table>

</body>
</html>
