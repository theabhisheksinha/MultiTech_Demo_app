import java.sql.*;
import java.io.*;

public class jdbcBean implements java.io.Serializable
{
  private String dbServerUrl = "";
  private String dbDriver = "oracle.jdbc.driver.OracleDriver";
  private String login = null;
  private String password = null;
  private String dbUrl = "jdbc:oracle:thin:@";
  private Connection dbCon;

  public jdbcBean( String user, String pwd )
  {
   super();
   this.login = user;
   this.password = pwd;
  }

  public jdbcBean()
  {
   super();
  }

  public boolean connect() throws ClassNotFoundException, SQLException
  {
   Class.forName(this.getDbDriver());
   this.dbCon = DriverManager.getConnection(dbUrl+dbServerUrl,login, password);
   return true;
  }

  public Connection getdbConnection()
  {
   return this.dbCon;
  }

  public void close() throws SQLException
  {
   dbCon.close();
  }

  public ResultSet execSQL(String sql) throws SQLException
  {
   Statement s = null;
   ResultSet r = null;
   s = dbCon.createStatement();
   r = s.executeQuery(sql);
   return ( r == null ) ? null : r;
  }

  public String getDbDriver()
  {
   return this.dbDriver;
  }

  public String getDbUrl()
  {
   return this.dbUrl;
  }

  public String getUsr_ORACLE_LOGIN()
  {
   return this.login;
  }

  public String getUsr_ORACLE_PASSWORD()
  {
   return this.password;
  }

  public String getServerDbUrl()
  {
  return this.dbServerUrl;
  }

  public void setServerDbUrl( String aServerDbUrl )
  {
   this.dbServerUrl = aServerDbUrl;
  }

  public void setUsr_ORACLE_LOGIN(String pLogin )
  {
   this.login = pLogin;
  }

  public void setUsr_ORACLE_PASSWORD( String pPassword )
  {
   this.password = pPassword;
  }

  public void setDbDriver(String newValue)
  {
   this.dbDriver = newValue;
  }

  public void setDbUrl (String newValue)
  {
   this.dbUrl = newValue;
  }

 public void finalize()
 {
 }

}
