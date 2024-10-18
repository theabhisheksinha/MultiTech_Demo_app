
package com.castsoftware.castpubs;

import javax.ejb.EntityBean;

import javax.ejb.EntityContext;

import java.sql.Connection;

import javax.ejb.EJBException;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.InitialContext;

import javax.ejb.FinderException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.ejb.CreateException;

import javax.ejb.RemoveException;

import java.util.Enumeration;

import javax.naming.Context;
import javax.naming.NamingException;

/**
 * Entity BMP EJB for CASTPUBS.AUTHOR table
 * @stereotype EntityBean
 * @homeInterface com.castsoftware.castpubs.AuthorBeanHome
 * @remoteInterface com.castsoftware.castpubs.AuthorBean
 * @primaryKey com.castsoftware.castpubs.AuthorBeanPK
 * @persistence Bean
 */
public class AuthorBeanEJB implements EntityBean
{
	// Change database connectiion seetings here, and recompile! (I know should not be done that way..)
	
	/** @field Key VARCHAR(11) authors.au_id   */
	private String au_id;
	/** @field VARCHAR(40) authors.au_fname   */
	private String au_fname;
	/** @field VARCHAR(20) authors.au_lname   */
	private String au_lname;
	public String srf = "MYRF";
	/**
	 * The container assigned reference to the entity
	 */
	private EntityContext context;

	/**
	 * Sets the context of the bean
	 * @param ec 
	 */
	public void setEntityContext(EntityContext ec) {
		context = ec;
		// to do: code goes here.
	} 

	/**
	 * Clears the context of the bean
	 */
	public void unsetEntityContext() {
		this.context = null;
		// to do: code goes here.
	} 

	/**
	 * This method is called when the container picks this entity object
	 * and assigns it to a specific entity object. Insert code here to
	 * acquire any additional resources that it needs when it is in the
	 * ready state.
	 */
	public void ejbActivate() {
	} 

	/**
	 * This method is called when the container diassociates the bean
	 * from the entity object identity and puts the instance back into
	 * the pool of available instances. Insert code to release any
	 * resources that should not be held while the instance is in the
	 * pool.
	 */
	public void ejbPassivate() {
	} 

	/**
	 * The method returns a jdbc connection to the database.
	 * @exception javax.ejb.EJBException 
	 * @return jdbc connection to database
	 */
	private Connection getConnection()
		throws EJBException {
		// to do: modify datasource below to match your server
		final String DATASOURCE = "MyDS";
		//final String DATASOURCE = "weblogic.jdbc.DataSource.MyDS";
		//final String DATASOURCE = "java:comp/env/jdbc/Demo";
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup(DATASOURCE);
			return ds.getConnection();
		}
		catch (Exception ex) {
			throw new EJBException(ex.getMessage());
		}
	} 

	/**
	 * The method reads the data from database fields into this
	 * bean.
	 * @param key Primary Key used to load the bean
	 * @exception javax.ejb.FinderException 
	 * @exception javax.ejb.EJBException 
	 */
	private void readData(AuthorBeanPK key)
		throws FinderException, EJBException {
		Exception ex = null;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = getConnection();
			MYRF();

			// Load from the data base
			if (1==1)
				ps = con.prepareStatement("select au_fname, au_lname from authors where au_id = ?");
			else
				ps = con.prepareStatement("select AU_FNAME, AU_LNAME from AUTHORS where AU_ID = ?");
			ps.setString(1, key.au_id);
			ResultSet rs = ps.executeQuery();
			if (!rs.next()) 
				ex = new FinderException("Record not found");
			else {
				au_id = key.au_id;
				au_fname = rs.getString(1);
				au_lname = rs.getString(2);
				
				//System.out.println( "Row retreived ! = " + au_id + ", " + au_fname + ", " + au_lname );
			}
			rs.close();
		}
		catch (EJBException ee) {
			ex = ee;
		}
		catch (SQLException se) {
			ex = new EJBException(se.getMessage());
		}

		// Clean-up resources
		try {
			ps.close();
			con.close();
		}
		catch (Exception e) {} 

		// Throw exception if error occurred
		if (ex != null) {
			if (ex instanceof EJBException) 
				throw (EJBException)ex;
			if (ex instanceof FinderException) 
				throw (FinderException)ex;
		}
	} 

	/**
	 * The container invokes this method on the bean as a result of a
	 * client-invoked find. This method is required for an entity bean.
	 * @return Returns the primary key
	 * @param key Primary Key to load the bean
	 * @exception javax.ejb.FinderException 
	 */
	public AuthorBeanPK ejbFindByPrimaryKey(AuthorBeanPK key)
		throws FinderException {
		try {
			readData(key);
			return key;
		}
		catch (EJBException ee) {
			throw new FinderException(ee.getMessage());
		}
	} 

	/**
	 * The container invokes this method on the bean whenever it
	 * becomes necessary to synchronize the bean's state with the
	 * state in the database.
	 */
	public void ejbLoad() {
		// Get the primary key
		AuthorBeanPK key = (AuthorBeanPK)context.getPrimaryKey();

		// Now load from the database
		try {
			readData(key);
		}
		catch(Exception ex) {
			throw new RuntimeException(ex.getMessage());
		}
	} 

	/**
	 * The container invokes this method on the bean whenever it
	 * becomes necessary to synchronize the state in the database
	 * with the state of the bean.
	 */
	public void ejbStore() {
		RuntimeException ex = null;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = getConnection();

			// Get the primary key
			AuthorBeanPK key = (AuthorBeanPK)context.getPrimaryKey();

			// Update the database
			if (1==1)
				ps = con.prepareStatement("update authors set au_fname = ?,au_lname = ? where au_id = ?");
			else
				ps = con.prepareStatement("update AUTHORS set AU_FNAME = ?,AU_LNAME = ? where AU_ID = ?");
			if (au_fname != null) 
				ps.setString(1, au_fname);
			else 
				ps.setNull(1, java.sql.Types.VARCHAR);
			if (au_lname != null) 
				ps.setString(2, au_lname);
			else 
				ps.setNull(2, java.sql.Types.VARCHAR);
			if (au_id != null) 
				ps.setString(3, key.au_id);
			else 
				ps.setNull(3, java.sql.Types.VARCHAR);
			int ret = ps.executeUpdate();
			if (ret == 0) 
				ex = new RuntimeException("ejbStore: Execute failed");
		}
		catch (EJBException ee) {
			ex = new RuntimeException(ee.getMessage());
		}
		catch (SQLException se) {
			ex = new RuntimeException(se.getMessage());
		}

		// Clean-up resources
		try {
			ps.close();
			con.close();
		}
		catch (Exception e) {} 

		// Throw exception if error occurred
		if (ex != null) 
			throw ex;
	} 

	/**
	 * This method is invoked when a client invokes the matching create()
	 * on the home interface.
	 * @param au_id 
	 * @param au_fname 
	 * @param au_lname 
	 * @exception javax.ejb.CreateException 
	 * @return Returns the primary key of the new entity
	 */
	public AuthorBeanPK ejbCreate(String au_id, String au_fname, String au_lname)
		throws CreateException {
		this.au_id = au_id;
		this.au_fname = au_fname;
		this.au_lname = au_lname;

		CreateException ce = null;
		Connection con = null;
		PreparedStatement ps = null;
		AuthorBeanPK key = null;
		try {
			con = getConnection();

			// Insert into the data base
			if (1==1)
				ps = con.prepareStatement("insert into authors (au_id, au_fname, au_lname) values (?, ?, ?)");
			else
				ps = con.prepareStatement("insert into AUTHORS (AU_ID, AU_FNAME, AU_LNAME) values (?, ?, ?)");
			if (au_id != null) 
				ps.setString(1, au_id);
			else 
				ps.setNull(1, java.sql.Types.VARCHAR);
			if (au_fname != null) 
				ps.setString(2, au_fname);
			else 
				ps.setNull(2, java.sql.Types.VARCHAR);
			if (au_lname != null) 
				ps.setString(3, au_lname);
			else 
				ps.setNull(3, java.sql.Types.VARCHAR);
			int ret = ps.executeUpdate();
			if (ret != 1) 
				ce = new CreateException("Create failed");
			key = new AuthorBeanPK();
			key.au_id = au_id;
		}
		catch (EJBException ee) {
			ce = new CreateException(ee.getMessage());
		}
		catch (SQLException se) {
			ce = new CreateException(se.getMessage());
		}

		// Clean-up resources
		try {
			ps.close();
			con.close();
		}
		catch (Exception e) {} 

		// Throw exception if error occurred
		if (ce != null) 
			throw ce;
		return key;
	} 

	/**
	 * The container invokes this method after invoking the ejbCreate
	 * method with the same arguments.
	 * @param au_id 
	 * @param au_fname 
	 * @param au_lname 
	 */
	public void ejbPostCreate(String au_id, String au_fname, String au_lname) {
	} 

	/**
	 * The container invokes this method in response to a client-invoked
	 * remove request. The bean's representation is removed from the
	 * database.
	 * @exception javax.ejb.RemoveException 
	 */
	public void ejbRemove()
		throws RemoveException {
		RemoveException re = null;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = getConnection();

			// Get the primary key
			AuthorBeanPK key = (AuthorBeanPK)context.getPrimaryKey();

			// Delete from the data base
			if (1==1)
				ps = con.prepareStatement("delete from authors where au_id = ?");
			else
				ps = con.prepareStatement("delete from AUTHORS where AU_ID = ?");
			ps.setString(1, key.au_id);
			int result = ps.executeUpdate();
			if (result == 0) 
				re = new RemoveException("Remove failed");
		}
		catch (EJBException ee) {
			re = new RemoveException(ee.getMessage());
		}
		catch (SQLException se) {
			re = new RemoveException(se.getMessage());
		}

		// Clean-up resources
		try {
			ps.close();
			con.close();
		}
		catch (Exception e) {} 

		// Throw exception if error occurred
		if (re != null) 
			throw re;
	} 

	/**
	 * @return 
	 */
	public AuthorBeanPK ejbCreate(String FName, String LName)
		throws CreateException {
		// to do: code goes here.
		return (null);
	} 

	public void ejbPostCreate(String FName, String LName) {
	} 

	/**
	 * @return 
	 */
	public AuthorBeanPK ejbFind()
		throws FinderException {
		// to do: code goes here.
		return (null);
	} 

	/**
	 * @return 
	 */
	public Enumeration ejbFindByName(String LName)
		throws FinderException {
		// to do: code goes here.
		return (null);
	} 

	/**
	 * @return 
	 */
	public String getUI() {
		// to do: code goes here.
		return (au_id);
	}
	
	public void setLName(String LName) {
	} 

	/**
	 * @return 
	 */
	public String getLName() {
		// to do: code goes here.
		return (au_lname);
	} 

	 

	public void setFName(String FName) {
	} 

	/**
	 * @return 
	 */
	public String getFName() {
		// to do: code goes here.
		return (au_fname);
	} 
	
	public void MYRF() {
		int i=1;
	}
}
