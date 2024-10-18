package com.castsoftware.castpubs;

import javax.ejb.*;
import java.rmi.RemoteException;

public interface AuthorSalesBeanHome extends EJBHome
{
	public AuthorSalesBean create()
	throws CreateException, RemoteException;

}