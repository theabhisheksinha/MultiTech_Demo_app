package com.castsoftware.castpubs;

import javax.ejb.*;
import java.util.*;
import javax.naming.*;

import java.sql.Connection;

import javax.ejb.EJBException;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.sql.DataSource;

/**
 * Session EJB to calculate total sales for an author
 * @stereotype SessionBean
 * @remoteInterface com.castsoftware.castpubs.AuthorSalesBean
 * @homeInterface com.castsoftware.castpubs.AuthorSalesBeanHome
 * @statemode Stateful
 */
public class AuthorSalesBeanEJB implements javax.ejb.SessionBean
{
	public AuthorSalesBeanEJB()
	{
	}

	// ---------------------------------------------------------------
	// SessionBean interface implementation
	public void ejbActivate()
	{
		// to do: code goes here.

	}

	public void ejbPassivate()
	{
		// to do: code goes here.

	}

	public void ejbRemove()
	{
		// to do: code goes here.

	}

	public void setSessionContext(SessionContext ctx)
	{
		this.ctx = ctx;

		// to do: code goes here.

	}

	// ---------------------------------------------------------------
	// create methods
	public void ejbCreate()
	{
		// to do: code goes here.

	}

	// ---------------------------------------------------------------
	// business methods
	public float computeSales(String AU_ID)
	{
		// to do: code goes here.
		String              THE_DATASOURCE  = "MyDS";
		String              theRequest1      =   "select sum(S.qty * T.price) " + 
   		                                        "from titleauthor TA, titles T, salesdetail S " + 
                                                	"where TA.title_id = T.title_id and	S.title_id = TA.title_id and TA.au_id = ? ";
		String              theRequest2      =   "select sum(S.QTY * T.PRICE) " + 
 		                                        "from TITLEAUTHOR TA, TITLES T, SALESDETAIL S " + 
	                                               	"where TA.TITLE_ID = T.TITLE_ID and	S.TITLE_ID = TA.TITLE_ID and TA.AU_ID = ? ";

		Connection          con             = null;
		PreparedStatement   ps              = null;
		float               theResult       = 0;
		Exception           ex              = null;
		
		try {
			// Get a connection to the RDBMS
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup(THE_DATASOURCE);
			con = ds.getConnection();

			// Load from the data base
			if (1==1)
				ps = con.prepareStatement(theRequest1);
			else
				ps = con.prepareStatement(theRequest2);
			ps.setString(1, AU_ID);
			ResultSet rs = ps.executeQuery();
			if (!rs.next()) 
				ex = new FinderException("Record not found");
			else {
				theResult = rs.getFloat(1);
			}
			rs.close();
		}
		catch (EJBException ee) {
			ex = ee;
		}
		catch (SQLException se) {
			ex = new EJBException(se.getMessage());
		}
		catch (Exception ee) {
			ex= new EJBException(ee.getMessage());
		}

		// Clean-up resources
		try {
			ps.close();
			con.close();
		}
		catch (Exception e) {} 

		// Throw exception if error occurred
		/*if (ex != null) {
			if (ex instanceof EJBException) 
				throw (EJBException)ex;
			if (ex instanceof FinderException) 
				throw (FinderException)ex;
		}*/

		return theResult;
	}

	// ---------------------------------------------------------------
	// private fields
	private SessionContext ctx;

}