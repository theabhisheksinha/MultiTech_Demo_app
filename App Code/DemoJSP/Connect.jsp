<%@ page language="java" import="java.sql.*,jdbcBean,myBean" errorPage="ErrorPage.jsp"%>
<jsp:useBean id="connection" class="jdbcBean" scope="session"/>
<jsp:useBean id="myBean" class="myBean" scope="session"/>
<%

  connection.setUsr_ORACLE_LOGIN( request.getParameter("login") );
  connection.setUsr_ORACLE_PASSWORD( request.getParameter("password") );
  connection.setServerDbUrl( request.getParameter( "server" )
                           + ":"
                           + request.getParameter( "port" )
                           + ":"
                           + request.getParameter( "sid" ) );
                           
  try
   {
     connection.connect();
   } catch (ClassNotFoundException e)
     {
      out.println("secBean.dbOpenConnection : ClassNotFoundException: " + e);
     } catch (SQLException e)
       {
       out.println("secBean.dbOpenConnection : SQLException: " + e);
       }


  myBean.setJdbcBean( connection );
  response.sendRedirect("ListAuthors.jsp");
%>
