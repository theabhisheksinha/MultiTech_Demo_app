package com.castsoftware.castpubs;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ServletAuthorMain extends HttpServlet
implements SingleThreadModel
{
	public String getServletInfo()
	{
		return "Consolidate results of other servlets for an author";
	}

		
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		resp.setContentType("text/html");
		
        // Include the results of the other servlets
        HttpSession          session = req.getSession(true);
        ServletContext       sc = getServletConfig().getServletContext();
	    RequestDispatcher    rd = sc.getRequestDispatcher( "/ServletAuthor");
	         
        rd.include(req, resp);
	    rd = sc.getRequestDispatcher( "/ServletAuthorSales");
	    rd.include(req, resp);
	     
	}

}