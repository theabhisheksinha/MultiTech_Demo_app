public class Author
{
  private String Au_lname = null;
  private String Au_fname = null;
//  private Enumeration Au_ListTitles = null;

 public void init()
 {
  this.Au_lname = null;
  this.Au_fname = null;
 }

 public String getAu_fname() { return this.Au_fname; }
 public String getAu_lname() { return this.Au_lname; }

 public void setAu_fname( String pAu_fname ) { this.Au_fname = pAu_fname; }
 public void setAu_lname( String pAu_lname ) { this.Au_lname = pAu_lname; }

}
