package com.castsoftware.test.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

import java.sql.*;
import javax.swing.*;
import java.awt.*;


public class Servlet1 extends HttpServlet {

  /**
   * Initialize global variables
   */
  public void init(ServletConfig config) throws ServletException {
    //super.init(config);
    try{
      Class.forName("oracle.jdbc.driver.OracleDriver");
      //DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
      //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    }catch(ClassNotFoundException e){
      System.err.println("JDBC driver not found: "+e.getMessage());
    }
  }




  /**
   * Process the HTTP Get request
   */
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = new PrintWriter (response.getOutputStream());
    Connection cnt =null;
    Statement stt =null;
    ResultSet rs =null;
    ResultSetMetaData rsmd =null;

    int nbColumn;
    String ColumnName;
    //System.out.println (nbColumn);


    try{
      //cnt = DriverManager.getConnection("jdbc:odbc:test","system","manager");
      cnt = DriverManager.getConnection("jdbc:oci8:O816QAT2","system","manager");
      stt = cnt.createStatement();
      rs = stt.executeQuery("select * from castpubs.authors");
      rsmd = rs.getMetaData();

      rs.close();
      stt.close();
      cnt.close();
    }catch(SQLException ex) {
      System.err.println("SQLException: " + ex.getMessage());
      System.err.println("SQLState: " + ex.getSQLState());
      System.err.println("Error Code: " + ex.getErrorCode());
    }


    out.println("<html>");
    out.println("<head><title>Servlet1</title></head>");
    out.println("<body>Hello From Servlet1 doGet()");
    out.println("<table border=1 width=100%>");
    out.println("<tbody>");
    out.println("<tr><th colSpan=2>Registered Servlets</th></tr>");

    try{
      nbColumn = rsmd.getColumnCount();
      System.out.println (nbColumn);
      for(int i=0; i<nbColumn; i++){
        System.out.println (i);
        System.out.println (rsmd.getColumnName(i+1));
        out.println("<tr><th colSpan=2>"+"ColumnName"+"</th></tr>");
      }
    }catch(SQLException ex) {
      System.err.println("SQLException: " + ex.getMessage());
      System.err.println("SQLState: " + ex.getSQLState());
      System.err.println("Error Code: " + ex.getErrorCode());
	String EJBAccess = "AuthorBean";
    }

  /*
    while (rs.next()){
      String au_id = rs.getString("au_id");
      String au_lname = rs.getString("au_lname");
      String au_fname = rs.getString("au_fname");
      String phone = rs.getString("phone");
      String address = rs.getString("address");
      String city = rs.getString("city");
      String state = rs.getString("state");
      String country = rs.getString("country");
      String postalcode = rs.getString("postalcode");

      System.out.println (" au_id: "+au_id+" au_lname: "+au_lname+" au_fname: "+au_fname+
            " phone: "+phone+" address: "+address+" city: "+city+" state: "+state+" country: "+country+
            " postalcode: "+postalcode);
    }
    */

    out.println("<tr>");
    out.println("</tr></tbody></table>");
    out.println("</body></html>");
    out.close();

  }


  /**
   * Process the HTTP Post request
   */
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = new PrintWriter (response.getOutputStream());
    out.println("<html>");
    out.println("<head><title>Servlet1</title></head>");
    out.println("<body>");
    out.println("</body></html>");
    out.close();
  }

  /**
   * Process the HTTP Put request
   */
  public void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }

  /**
   * Process the HTTP Delete request
   */
  public void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }

  /**
   * Get Servlet information
   * @return java.lang.String
   */
  public String getServletInfo() {
    return "com.castsoftware.test.servlet.Servlet1 Information";
  }
}




