import java.io.*;
import oracle.jdbc.driver.*;
import java.sql.*;
import java.text.*;
import javax.servlet.*;
import javax.servlet.http.*;

import jdbcBean;

public class NewSale extends HttpServlet
{
 private jdbcBean myJdbcBean = new jdbcBean("CASTPUBS","CASTPUBS");
 private ResultSet rs=null;

 public void doGet(HttpServletRequest req,
                   HttpServletResponse res)
   throws IOException
  {
    ServletOutputStream out = res.getOutputStream();

    res.setContentType("text/html");

    out.println("<HTML>");
    out.println("<HEAD><TITLE>CAST fhjkshfjkqhfkq DEMONSTRATION APPLICATION</TITLE></HEAD>");
    out.println("<BODY>");

   try
   {
      myJdbcBean.connect();
   } catch (ClassNotFoundException e)
     {
      out.println("connect() ClassNotFoundException: " + e);
     } catch (SQLException e)
       {
       out.println("connect() SQLException: " + e);
       }

   out.print ("<html>\n<head>\n<title>CAST Demonstration Application</title>\n <script language=\"JavaScript\" src=\"Scripts/date.js\"> </script>\n</head>\n<body bgcolor=\"#FFFFFF\" background=\"pageart/bg_orange.gif\">\n<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n  <tr> \n    <td width=\"463\" height=\"12\" valign=\"top\"></td>\n    <td width=\"34\" height=\"12\" valign=\"top\"></td>\n    <td width=\"174\" height=\"12\" valign=\"top\"></td>\n  </tr>\n  <tr> \n    <td width=\"463\" height=\"31\" valign=\"top\"><img src=\"pageart/title.gif\" width=\"459\" height=\"31\"></td>\n    <td width=\"34\" height=\"31\" valign=\"top\"></td>\n    <td width=\"174\" height=\"31\" valign=\"bottom\"><img src=\"pageart/logo_ani.gif\" width=\"174\" height=\"21\"></td>\n  </tr>\n  <tr> \n    <td width=\"671\" height=\"27\" colspan=\"3\" valign=\"middle\" bgcolor=\"#FF6600\"> \n      <div align=\"right\"><font face=\"Arial, Helvetica, sans-serif\" size=\"-2\" color=\"#FFFFFF\"> \n        <script language=\"javascri
pt\">display_date();</script>\n        </font></div>\n    </td>\n  </tr>\n  <tr> \n    <td width=\"463\" height=\"1\" valign=\"top\"><img width=\"463\" height=\"1\" src=\"pageart/transparent.gif\"></td>\n    <td width=\"34\" height=\"1\" valign=\"top\"><img width=\"34\" height=\"1\" src=\"pageart/transparent.gif\"></td>\n    <td width=\"174\" height=\"1\" valign=\"top\"><img width=\"174\" height=\"1\" src=\"pageart/transparent.gif\"></td>\n  </tr>\n  <tr> \n    <td width=\"463\" height=\"1\" valign=\"top\">&nbsp;</td>\n    <td width=\"34\" height=\"1\" valign=\"top\">&nbsp;</td>\n    <td width=\"174\" height=\"1\" valign=\"top\">&nbsp;</td>\n  </tr>\n  <tr> \n    <td colspan=\"3\" height=\"1\" valign=\"top\">\n      <p align=\"center\">");
   out.print ("<font face=\"Comic Sans MS\" color=\"#003399\">SALE CREATED</font></p>\n      ");
   out.print ("<form method=\"post\" action=\"ListAuthors.jsp\">\n        <div align=center>&nbsp;\n          <input name=Submit type=submit value=Ok>\n        </div>\n      </form>\n    </td>\n  </tr>\n  <tr>\n    <td colspan=\"3\" height=\"1\" valign=\"top\">&nbsp;</td>\n  </tr>\n</table>\n</body>\n</html>\n\n\n");

   try
   {
    myJdbcBean.close();
   } catch (SQLException e)
     {
       out.println("Error while closing" + e);
     }

   out.println("</BODY>");
   out.println("</HTML>");
  }
}
