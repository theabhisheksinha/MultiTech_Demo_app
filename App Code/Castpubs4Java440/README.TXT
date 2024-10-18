2000/11/28

* WHAT DOES THIS APPLICATION CONTAINS ?
This application is a sample based on CASTPUBS schema.
It does contains two EJBs (One BMP entity and one stateless session), four servelts (one for each EJB, one calling those two, and an independent one), and a html file.
The EJB AuthorBean is a entity BMP EJB. It's based on the table AUTHORS. 
Not all parts of the bean are used within the application (only the select part), and not all data of table AUTHORS are used.
The EJB AuthorSalesBean is a session stateless EJB. It calculates (in a quit simple way) all sales for an author.
The servlet ServletAuthor do call the EJB AuthorBean with the author id it receive (au_id, GET) and generate HTML. 
The servlet ServletAuthorSalesBean does the same with the EJB AuthorSalesBean.
The servlet ServletAuthorMain calls the two other servlets.
The servlet ServletTitlesFindId do a direct access to a procedure package and is independent.
Finally the HTML file castpubs.html, calls the servlet ServletAuthorMain.

* REQUIREMENTS TO RUN THIS APPLICATION
- CASTPUBS schema
- Weblogic server 5.1 (of course)

* HOW TO INSTALL THIS APPLICATION
This assume that weblogic is installed under "C:\weblogic".
-1. read the README.TXT :-)
0. Verify that the DLL weblogicoci36.dll is in the path (C:\weblogic\bin is OK)
1. Put the castpubs.html file under "C:\weblogic\myserver\public_html"
2. Deploy the two beans on the server
3. Copy the .class of the three servlets to "C:\weblogic\myserver\servletclasses\com\castsoftware\castpubs"
4. Add to the "C:\weblogic\weblogic.properties" files the content of the file weblogic.properties. Replace the name of your server containing the database.

* HOW TO USE THIS APPLICATION
To use the application, use the following URL:
http://machinename:7001/Castpubs.html where machinename is the name of the computer running the weblogic server.

To access directly the Servlet returning a title id:
http://machinename:7001/Titles?title_name=Secrets%20of%20Silicon%20Valley for example..

* REQUIREMENTS TO PARSE THIS APPLICATION
- CASTPUBS schema
- There is NO need for Weblogic to be installed, althought to have all classes used by the application (EJB classes), this is mandatory

* HOW TO PARSE
1. Parse the schema CASTPUBS
2. Parse the EJB Java files
	2a. To do that select all .java files under AuthorBean\com\castsoftware\castpubs and AuthorSalesBean\com\castsoftware\castpubs
	2b. Use C:\xxx\AuthorBean and C:\xxx\AuthorSalesBean as the CLASSPATH
3. Run the EJB Assistant on the "ejb-jar.xml" files. 
	3a. Extract the file "ejb-jar.xml" contained contained in the JAR files (xxxEnterpriseBean.jar) of each EJB. This can be done with Winzip
	3b. Use those files for the EJB Assistant
4. Parse the servelts
	4a. Select all .java files under ServletXXXX\com\castsoftware\castpubs 
	4b. Use all C:\xxx\ServletXXXX as cLASSPATH
5. Run eAnalyzer for the html file.

* WHAT'S MISSING ?
We do miss three links:
- The link between the html file and the servlet. This have to be done with reference finder. 
The reason is that the name of the servlet seen by the client is in the weblogic.properties file.
- The links between ServletAuthorMain and servletAuthor, and between ServletAuthorMain and servletSales. Same reason.

Hope this helps.

OTH