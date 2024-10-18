
package com.castsoftware.castpubs;

import java.io.Serializable;

public class AuthorBeanPK implements Serializable
{
	public String au_id; 

	/**
	 * @return 
	 * @SBGen Method hashcode using au_id
	 */
	public int hashCode() {
		// SBgen: Generate hashcode
		return (au_id.hashCode());
		// SBgen: End hashcode
	} 

	/**
	 * @param that 
	 * @return 
	 * @SBGen Method compare class using au_id
	 */
	public boolean equals(Object that) {
		// SBgen: Compare member
		if (!(that instanceof AuthorBeanPK)) 
			return false;

		AuthorBeanPK tmp = (AuthorBeanPK)that;
		return (this.au_id.equals(tmp.au_id));
		// SBgen: End compare
	} 
}
