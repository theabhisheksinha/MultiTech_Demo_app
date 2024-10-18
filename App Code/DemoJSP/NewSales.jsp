<%@ page language="java" errorPage="ErrorPage.jsp" %>
<html>
<head>
<title>CAST Demonstration Application</title>
 <script language="JavaScript" src="Scripts/date.js"> </script>
 <script language="JavaScript" src="Scripts/tests.js"> </script>
</head>
<body bgcolor="#FFFFFF" background="pageart/bg_orange.gif" onload="MYRF()">
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
    <td colspan="3" height="1" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3" height="1" valign="top">
      <form  name=form1 method=get action="NewTitleSale.jsp" > <!-- /servlets/NewSale -->
        <center>
          <p> 
          <table border=0 cellpadding=1 cellspacing=1 height=27 style="HEIGHT: 25px; WIDTH: 650px" width="92.02%">
            <tr> 
              <td align=middle nowrap> 
                <div align="center"><font face="Comic Sans MS" color="#003399">SALES 
                  OF THE BOOK: <%=request.getParameter("title")%></font> </div>
              </td>
            </tr>
          </table>
        </center>
        &nbsp; 
        <p></p>
        <p>&nbsp;</p>
        <center>
          <table border=0 cellpadding=1 cellspacing=1 height=27 style="HEIGHT: 25px; WIDTH: 650px" width=548>
		  <input type="hidden" name="titleid" value="<%=request.getParameter("titleid")%>">
            <tr> 
              <th align=left width="141"> 
                <p align=right> 
                <p align="right"><font color="#003399">MYRF:</font></p>
              </th>
              <p></p>
              <td width="120"> 
                <p align=center> 
                  <input id=text1 name=Qty2 align=center tabindex=2 size="15">
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
                  <input id=text2 name=Dsct2 align=center tabindex=3 size="15">
                </p>
              </td>
              <td align=right width="274">
                <p align=center> 
                  <input id=submit1 name=submit12 type=button onClick="JavaScript:test_sales_form( this.form );" value="OK" style="HEIGHT: 24px; WIDTH: 125px" tabindex=4>
                </p>
              </td>
            </tr>
          </table>
        </center>
      </form>
   </td>
  </tr>
</table>
</body>
</html>
