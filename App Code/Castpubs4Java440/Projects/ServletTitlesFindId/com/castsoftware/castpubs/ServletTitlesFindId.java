package com.castsoftware.castpubs;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
import javax.sql.DataSource;
import javax.naming.InitialContext;

public class ServletTitlesFindId extends HttpServlet
implements SingleThreadModel
{
	public String getServletInfo()
	{
		return "Retreive a title id based on the title";
	}
	
	private Connection getConnection()
		throws SQLException {
		// to do: modify datasource below to match your server
		final String DATASOURCE = "MyDS";
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup(DATASOURCE);
			return ds.getConnection();
		}
		catch (Exception ex) {
			throw new SQLException(ex.getMessage());
		}
	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		resp.setContentType("text/html");
		PrintWriter out = new PrintWriter(resp.getOutputStream());

		// get request parameters
		String title_name = "";
		if (req.getParameterValues("title_name") != null) {
			title_name = req.getParameterValues("title_name")[0];
		}

	    Exception           ex          = null;
	    Connection          con         = null;
		PreparedStatement   ps          = null;
		String              title_id    = "";
		
		try {
			con = getConnection();

			// Load from the data base
			ps = con.prepareStatement("select DEFECTSPKG.Ctrl_Title( ? ) from dual");
			ps.setString(1, title_name);
			ResultSet rs = ps.executeQuery();
			if (!rs.next()) 
				ex = new SQLException("Record not found");
			else {
                    title_id = rs.getString(1);
			    }
			rs.close();
		}
		catch (SQLException se) {
			ex = new ServletException(se.getMessage());
		}

		// Clean-up resources
		try {
			ps.close();
			con.close();
		}
		catch (Exception e) {} 

		// Throw exception if error occurred
		if (ex != null) {
			throw (ServletException)ex;
		}
		
		out.println("<BR><B>ServletTitlesFindId Output</B><BR>");
		out.println("Title ID for " + title_name + " : " + title_id);
		out.close();
	}

}