package com.castsoftware.castpubs;

import javax.ejb.*;
import java.rmi.RemoteException;


public interface AuthorSalesBean extends EJBObject
{
	public float computeSales(String AU_ID) throws RemoteException; //CreateException, 
}