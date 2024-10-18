<%@ page language="java" import="java.sql.*,Author,myBean" errorPage="ErrorPage.jsp" %>

<jsp:useBean id="myBean" class="myBean" scope="session"/>

<html>
<head>
<title>CAST Demonstration Application</title>
<script language="JavaScript" src="Scripts/date.js"> </script>
</head>
<body bgcolor="#FFFFFF" background="pageart/bg_orange.gif">
<%! Author lAuthor = new Author(); %>
	
<% lAuthor.setAu_lname( request.getParameter( "lname" ) );
   lAuthor.setAu_fname( request.getParameter( "fname" ) ); %>

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
      <p align="center"><font size="4"><font face="Comic Sans MS" color="#003399" size="5">Titles 
        written by <%= lAuthor.getAu_fname() %> <%=	lAuthor.getAu_lname() %>
		</font></font></p>
      <form name="form1" id="form1">
        <div align="center">
          <center>
            <table border="0">
<%   try
   {
	 ResultSet rs = myBean.getListeTitlesRs( lAuthor );
    while( rs.next() )
    { %>
	    <tr>
         <td><a href="NewSales.jsp?title=<%=rs.getString("title")%>&titleid=<%=rs.getString("title_id")%>"><img src="pageart/puce.gif" width="13" height="13" border="0"></a></td>
         <td><a href="NewSales.jsp?title=<%=rs.getString("title")%>&titleid=<%=rs.getString("title_id")%>"><%=rs.getString( "Title" )%></a></td>
         </tr> 
<% }
   } catch (SQLException e)
     { out.println("SQLException "+e); } %>
	       </table>
          </center>
        </div>
      </form>
    </td>
  </tr>
</table>
</body>
</html>
