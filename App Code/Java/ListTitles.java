//ListTitles.java

import com.ms.wfc.app.*;
import com.ms.wfc.core.*;
import com.ms.wfc.ui.*;
import com.ms.wfc.data.*;
import com.ms.wfc.data.ui.*;

public class ListTitles extends Form
{

    public void btnClose_Click(Object sender, Event evt)
    {
        this.hide();
    }

    Recordset m_rs;
    Connection m_con;
	String au_lname;
    String au_fname;
    String srf = "MYRF";
	int TypeServer;
    

    public void dispose()
    {
        super.dispose();
        components.dispose();
    }
	
    public ListTitles(Connection P_Connection,int P_TypeServer,String P_au_lname,String P_au_fname)
    {
        
		
		m_con = new Connection();
		m_con=P_Connection;
		
		au_lname=P_au_lname;
		au_fname=P_au_fname;
		TypeServer=P_TypeServer;
			
        initForm();
        
		this.Caption.setText("Books written by " + au_fname + " " +au_lname);
		
        this.show();
        this.update();

       
        try
        {
            openDataConnection();
        }
        catch (Exception e)
        {
            handleADOException( e );
        }
    }    

    public void formClose(Event e)
    {
        Application.exit();
    }    

    void openDataConnection()
    {
      
       try
	  {
			Cursor.WAIT.setCurrent(); 
			m_rs = new Recordset();
			m_rs.setActiveConnection(m_con);
						
		    switch (TypeServer)
			{
				case 1: // Microsoft SQL Server
				{ m_rs.setSource("GetTitleAuthors "+au_lname+","+au_fname);
				  break;
				}
				case 2: // Sybase
				{ m_rs.setSource("GetTitleAuthors "+au_lname+","+au_fname);
				  break;
				}
				case 3: // Oracle
				{ m_rs.setSource("SELECT t2.au_lname, t2.au_fname, t1.title, t1.title_id FROM titles t1, authors t2, titleauthor t3 WHERE t1.title_id = t3.title_id And t2.au_id = t3.au_id and UPPER(LTRIM(RTRIM(t2.au_lname)))  LIKE UPPER(LTRIM(RTRIM('" + au_lname + "'))) and UPPER(LTRIM(RTRIM(t2.au_fname)))  LIKE UPPER(LTRIM(RTRIM('" + au_fname + "')))");
			     break;
				}
			}
		
			m_rs.setCursorType(AdoEnums.CursorType.STATIC);
			m_rs.setCursorLocation(AdoEnums.CursorLocation.CLIENT);
			m_rs.setLockType(AdoEnums.LockType.OPTIMISTIC);
			m_rs.open();
			dataGrid.setDataSource( m_rs);
		
			this.dataGrid.getColumn(0).setWidth(0);
			this.dataGrid.getColumn(1).setWidth(0);
			this.dataGrid.getColumn(2).setWidth(360);
			this.dataGrid.getColumn(3).setWidth(0);
		
			if (m_rs.getRecordCount()==0)
			{ this.CreateSale.setEnabled(false);}
		
		}
	   
	  catch(com.ms.wfc.data.AdoException f)
		  
		  {
			  this.CreateSale.setEnabled(false);
			  
	      }
	  catch(Exception f)
		  
		  {
		
		  MessageBox.show(f.getMessage(),"Error" );
		  
	      }
    }

    
    void handleADOException(Exception e)
    {
        e.printStackTrace();
        MessageBox.show( e.toString(), "ListTitles" );
    }

	private void CreateSale_click(Object source, Event e)
	{
		try
		{
		  Cursor.WAIT.setCurrent();
		  Application.run( new CreateSale(m_con,TypeServer,this.dataGrid.getColumn(3).getValue(),this.dataGrid.getColumn(2).getValue()));
		 
		}
		catch (Exception f)
		{
		 handleADOException(f);
		}
	}

	/**
	 * NOTE: The following code is required by the Visual J++ form
	 * designer.  It can be modified using the form editor.  Do not
	 * modify it using the code editor.
	 */
	Container components = new Container();
	Button btnClose = new Button();
	Panel panel1 = new Panel();
	DataGrid dataGrid = new DataGrid();
	Button CreateSale = new Button();
	Label Caption = new Label();

	private void initForm()
	{
		// NOTE:  This form is storing resource information in an
		// external file.  Do not modify the string parameter to any
		// resources.getObject() function call. For example, do not
		// modify "foo1_location" in the following line of code
		// even if the name of the Foo object changes: 
		//   foo1.setLocation((Point)resources.getObject("foo1_location"));

		IResourceManager resources = new ResourceManager(this, "ListTitles");
		this.setLocation(new Point(7, 7));
		this.setText("ListTitles");
		this.setAutoScaleBaseSize(new Point(5, 13));
		this.setAutoScroll(true);
		this.setClientSize(new Point(430, 371));
		this.setIcon((Icon)resources.getObject("this_icon"));
		this.setStartPosition(FormStartPosition.CENTER_SCREEN);

		btnClose.setLocation(new Point(224, 8));
		btnClose.setSize(new Point(70, 30));
		btnClose.setTabIndex(0);
		btnClose.setText("&Cancel");
		btnClose.addOnClick(new EventHandler(this.btnClose_Click));

		panel1.setDock(ControlDock.BOTTOM);
		panel1.setLocation(new Point(0, 321));
		panel1.setSize(new Point(430, 50));
		panel1.setTabIndex(1);
		panel1.setText("");

		dataGrid.setAnchor(ControlAnchor.TOPLEFTRIGHT);
		dataGrid.setBackColor(Color.WINDOW);
		dataGrid.setLocation(new Point(16, 56));
		dataGrid.setSize(new Point(402, 250));
		dataGrid.setTabIndex(0);
		dataGrid.setText("");
		dataGrid.setAllowAddNew(false);
		dataGrid.setAllowArrows(false);
		dataGrid.setAllowDelete(false);
		dataGrid.setAllowUpdate(false);
		dataGrid.setCaption("");
		dataGrid.setColumns(new Column[] {});
		dataGrid.setHeaderFont(Font.DEFAULT_GUI);
		dataGrid.setDynamicColumns(false);
		dataGrid.setDataMember("");

		CreateSale.setLocation(new Point(120, 8));
		CreateSale.setSize(new Point(72, 32));
		CreateSale.setTabIndex(1);
		CreateSale.setText("Create Sale");
		CreateSale.addOnClick(new EventHandler(this.CreateSale_click));

		Caption.setFont(new Font("MS Sans Serif", 16.0f, FontSize.CHARACTERHEIGHT, FontWeight.NORMAL, false, true, false, CharacterSet.DEFAULT, 0));
		Caption.setLocation(new Point(40, 16));
		Caption.setSize(new Point(352, 40));
		Caption.setTabIndex(2);
		Caption.setTabStop(false);
		Caption.setText("Books written by");
		Caption.setTextAlign(HorizontalAlignment.CENTER);

		this.setNewControls(new Control[] {
							Caption, 
							panel1, 
							dataGrid});
		panel1.setNewControls(new Control[] {
							  CreateSale, 
							  btnClose});
	}

}
