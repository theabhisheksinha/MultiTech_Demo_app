
package com.castsoftware.castpubs;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;

public interface AuthorBean extends EJBObject
{
	/**
	 * @return 
	 */
	public String getUI()
		throws RemoteException; 

	public void setLName(String LName)
		throws RemoteException; 

	/**
	 * @return 
	 */
	public String getLName()
		throws RemoteException; 


	public void setFName(String FName)
		throws RemoteException; 

	/**
	 * @return 
	 */
	public String getFName()
		throws RemoteException; 
		
	public void MYRF();
}
