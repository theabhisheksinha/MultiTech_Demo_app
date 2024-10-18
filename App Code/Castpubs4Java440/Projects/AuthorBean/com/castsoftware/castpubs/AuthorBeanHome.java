
package com.castsoftware.castpubs;

import javax.ejb.EJBHome;

import javax.ejb.FinderException;
import java.rmi.RemoteException;

import javax.ejb.CreateException;

import java.util.Enumeration;

public interface AuthorBeanHome extends EJBHome
{
	/**
	 * @return 
	 */
	public AuthorBean findByPrimaryKey(AuthorBeanPK key)
		throws FinderException, RemoteException; 

	/**
	 * @return 
	 */
	public AuthorBean create(String FName, String LName)
		throws CreateException, RemoteException; 

	/**
	 * @return 
	 */
	public AuthorBean find()
		throws FinderException, RemoteException; 

	/**
	 * @return 
	 */
	public Enumeration findByName(String LName)
		throws FinderException, RemoteException; 
}
