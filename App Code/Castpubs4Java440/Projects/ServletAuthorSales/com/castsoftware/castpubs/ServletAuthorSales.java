package com.castsoftware.castpubs;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import javax.ejb.*;
import javax.naming.*;
import java.util.*;

public class ServletAuthorSales extends HttpServlet
implements SingleThreadModel
{
	static String url = "";
	
	public String getServletInfo()
	{
		return "Servlet returning data on total sales made by an author using an EJB";
	}
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		AuthorSalesBean     the_ejb = null;
		float               fResult = 0;
		
		resp.setContentType("text/html");
		PrintWriter out = new PrintWriter(resp.getOutputStream());

		// get request parameters
		String au_id = "";
		if (req.getParameterValues("au_id") != null) {
			au_id = req.getParameterValues("au_id")[0];
		}

        // "Real code"
		try {
		    // Get the URL to the EJB Server from the HTTP URL
		    url = "t3://" + req.getServerName() + ":7001";
		    
		    // Get a reference to the EJB
		    Context ctx = getInitialContext();
			AuthorSalesBeanHome     home = (AuthorSalesBeanHome) ctx.lookup("AuthorSalesBean");
			
            the_ejb = (AuthorSalesBean)home.create();
            fResult = the_ejb.computeSales( au_id);
        }
        catch (Exception e) {
			e.printStackTrace();
			System.out.println( "Exception : " + e);
		}

		// Generate the HTML Code
		out.println("<BR><B>Beginning of ServletAuthorSales Output</B><BR>");

    	out.println( "ID: " + au_id);
		out.println( ", Total sales: " + fResult);
		
		out.println("<BR><B>End of ServletAuthorSales Output</B><BR>");
		out.close();
	}
	
	public static Context getInitialContext()
	throws NamingException
	{
		/*Properties p = new Properties();
		p.put(Context.INITIAL_CONTEXT_FACTORY, "weblogic.jndi.WLInitialContextFactory");
		p.put(Context.PROVIDER_URL, url);

		if (user != null) {
			p.put(Context.SECURITY_PRINCIPAL, user);
			if (password == null)
				password = "";
			p.put(Context.SECURITY_CREDENTIALS, password);
		}
		return new InitialContext(p);
		*/
		
		Hashtable   env = new Hashtable();
      	env.put(Context.INITIAL_CONTEXT_FACTORY, "weblogic.jndi.WLInitialContextFactory");
      	env.put(Context.PROVIDER_URL, url);
		return new InitialContext( env );
	}

}