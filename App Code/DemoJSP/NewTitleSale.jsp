<%@ page language="java" import="myBean" errorPage="ErrorPage.jsp"%>

<jsp:useBean id="myBean" class="myBean" scope="session"/>

<%
 int lResu = myBean.InsertNewSale( request.getParameter("titleid"),request.getParameter("Qty2"),request.getParameter("Dsct2") );

 if ( lResu == 0 )
  response.sendRedirect("SalesCreated.htm");
%>
