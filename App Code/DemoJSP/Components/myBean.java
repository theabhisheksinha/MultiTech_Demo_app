import java.io.*;
import java.sql.*;
import java.text.*;

import Author;
import jdbcBean;
import Recorder;

public class myBean implements java.io.Serializable
{
  private jdbcBean lJdbcBean = null;
  private Recorder lRecorder = null;

  public myBean()
  {
   super();
  }

  public myBean( jdbcBean pJdbcBean, Recorder pRecorder )
  {
     super();
     this.lJdbcBean = pJdbcBean;
     this.lRecorder = pRecorder;
  }

//-------------------- Accesseurs ------------------ //

  public jdbcBean getJdbcBean()
  {
   return this.lJdbcBean;
  }

  public Recorder getRecorder()
  {
   return this.lRecorder;
  }

  public void setRecorder( Recorder pRecorder )
  {
   this.lRecorder = pRecorder;
  }

  public void setJdbcBean( jdbcBean pJdbcBean )
  {
   this.lJdbcBean = pJdbcBean;
  }

 public String getListeAuthors()
 {
  ResultSet rs=null;
  String lResult = "";

   try
   {
    rs = lJdbcBean.execSQL("SELECT * FROM Authors" );
   } catch (SQLException e)
     { lResult = "SQLException "+e; }
   try
   {
    while( rs.next() )
    {
	 lResult += "<tr><td width=\"53%\">";
	 lResult += "<div align=\"center\"><a href=\"ListTitles.jsp?lname="+rs.getString( "AU_LNAME" )+"&fname="+rs.getString( "AU_FNAME" )+"\">";
	 lResult += rs.getString( "AU_LNAME" )+"</a></div></td> \n";
	 lResult += "<td width=\"47%\">";
	 lResult += "<div align=\"center\"><a href=\"ListTitles.jsp?lname="+rs.getString( "AU_LNAME" )+"&fname="+rs.getString( "AU_FNAME" )+"\">";
	 lResult += rs.getString( "AU_FNAME" )+"</a></div></td></tr> \n";
    }
   } catch (SQLException e)
     { lResult = "SQLException "+e; }
  return lResult;
 }

 public String getListeTitles( Author pAuthor )
 {
  ResultSet rs=null;
  String lResult = "";

   try
   {
    rs = lJdbcBean.execSQL("SELECT t.Title_ID, t.Title FROM Authors a, TitleAuthor ta, Titles t WHERE a.AU_ID = ta.AU_ID AND t.TITLE_ID = ta.TITLE_ID AND a.AU_LNAME='"+pAuthor.getAu_lname()+"' AND a.AU_FNAME = '"+pAuthor.getAu_fname()+"'" );
   } catch (SQLException e)
     { lResult = "SQLException "+e; }
	 
   try
   {
    while( rs.next() )
    {
      lResult += "<tr>";
      lResult += "<td><a href=\"NewSales.jsp?titleid="+rs.getString("title_id")+"\"><img src=\"pageart/puce.gif\" width=\"13\" height=\"13\" border=\"0\"></a></td>";
      lResult += "<td><a href=\"NewSales.jsp?titleid="+rs.getString("title_id")+"\">"+rs.getString( "Title" )+"</a></td>";
      lResult += "</tr>";
    }
   } catch (SQLException e)
     { lResult = "SQLException "+e; }
  return lResult;
 }

 public ResultSet getListeTitlesRs( Author pAuthor )
 {
  ResultSet rs=null;

   try
   {
    rs = lJdbcBean.execSQL("SELECT t.Title_ID, t.Title FROM Authors a, TitleAuthor ta, Titles t WHERE a.AU_ID = ta.AU_ID AND t.TITLE_ID = ta.TITLE_ID AND a.AU_LNAME='"+pAuthor.getAu_lname()+"' AND a.AU_FNAME = '"+pAuthor.getAu_fname()+"'" );
   } catch (SQLException e)
     { }

  return rs;
 }

 public int InsertNewSale( String pTitle_ID, String pQuantity, String pDiscount )
 {
  int result=-1;
  int lQuantity = 0;
  int lDiscount = 0;

    try
    {
      lQuantity = java.text.NumberFormat.getNumberInstance().parse(pQuantity).intValue();
      lDiscount = java.text.NumberFormat.getNumberInstance().parse(pDiscount).intValue();
    } catch ( java.text.ParseException e )
      {
       result = -1;
      }

    try
    {
     CallableStatement cs = this.lJdbcBean.getdbConnection().prepareCall("{ call SalePkg.NewCreateSale(?,?,?) }");
  	 cs.setString( 1,pTitle_ID   );
	   cs.setInt( 2, lQuantity );
     cs.setInt( 3, lDiscount );
     cs.executeQuery();
     cs.close();
     result = 0;
    } catch (Exception e)
     {
      result = 1;
     }

  return result;
 }

 public void finalize()
 {
 }
}
