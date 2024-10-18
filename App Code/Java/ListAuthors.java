//ListAuthors.java

import com.ms.wfc.app.*;
import com.ms.wfc.core.*;
import com.ms.wfc.ui.*;
import com.ms.wfc.data.*;
import com.ms.wfc.data.ui.*;
import java.lang.String;

public class ListAuthors extends Form
{

 	private void btnClose_Click(Object sender, Event evt)
    {
        this.hide();
    }
	
	private void Button_Ok_Click(Object sender, Event evt)
    {
		 
		
		 Cursor.WAIT.setCurrent();
         Application.run( new ListTitles(m_con,TypeServer,this.dataGrid.getColumn(1).getValue(),this.dataGrid.getColumn(2).getValue()));

    }

    Recordset m_rs;
    Connection m_con;
    int TypeServer;
    

    public void dispose()
    {
        super.dispose();
        components.dispose();
    }
	
	
	
    public ListAuthors(Connection P_Connection,int P_TypeServer)
    {
		
		m_con = new Connection();
		m_con=P_Connection;
		TypeServer=P_TypeServer;
		
		
		
        // Required for Visual J++ Form Designer support
        initForm();
        
        this.show();
        this.update();

        //TODO: Add any constructor code after initForm call
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
		m_rs = new Recordset();
        m_rs.setActiveConnection(m_con);
		
		switch (TypeServer)
			{
				case 1: // Microsoft SQL Server
				{ m_rs.setSource("GetAuthors");
				  break;
				}
				case 2: // Sybase
				{ m_rs.setSource("GetAuthors");
				  break;
				}
				case 3: // Oracle
				{ m_rs.setSource("Select t1.au_id, t1.au_lname,	t1.au_fname From  authors t1 Order By  	t1.au_lname  Asc,t1.au_fname  Asc");
				   break;
				}
			}
				
		
        m_rs.setCursorType(AdoEnums.CursorType.STATIC);
        m_rs.setCursorLocation(AdoEnums.CursorLocation.CLIENT);
        m_rs.setLockType(AdoEnums.LockType.OPTIMISTIC);
		
        m_rs.open();
	    dataGrid.setDataSource( m_rs);
		
		this.dataGrid.getColumn(0).setWidth(0);
		this.dataGrid.getColumn(1).setWidth(180);
		this.dataGrid.getColumn(2).setWidth(180);
		
		if (m_rs.getRecordCount()==0)
		{ this.ButtonOk.setEnabled(false);}
		
    }

    
    void handleADOException(Exception e)
    {
        e.printStackTrace();
        MessageBox.show( e.toString(), "castpubs" );
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
	Button ButtonOk = new Button();

	private void initForm()
	{
		// NOTE:  This form is storing resource information in an
		// external file.  Do not modify the string parameter to any
		// resources.getObject() function call. For example, do not
		// modify "foo1_location" in the following line of code
		// even if the name of the Foo object changes: 
		//   foo1.setLocation((Point)resources.getObject("foo1_location"));

		IResourceManager resources = new ResourceManager(this, "ListAuthors");
		this.setLocation(new Point(7, 7));
		this.setText("ListAuthors");
		this.setAutoScaleBaseSize(new Point(5, 13));
		this.setAutoScroll(true);
		this.setClientSize(new Point(429, 350));
		this.setIcon((Icon)resources.getObject("this_icon"));
		this.setStartPosition(FormStartPosition.CENTER_SCREEN);

		btnClose.setLocation(new Point(208, 8));
		btnClose.setSize(new Point(70, 30));
		btnClose.setTabIndex(1);
		btnClose.setText("&Cancel");
		btnClose.addOnClick(new EventHandler(this.btnClose_Click));

		panel1.setDock(ControlDock.BOTTOM);
		panel1.setLocation(new Point(0, 300));
		panel1.setSize(new Point(429, 50));
		panel1.setTabIndex(1);
		panel1.setText("");

		dataGrid.setAnchor(ControlAnchor.TOPLEFTRIGHT);
		dataGrid.setBackColor(Color.WINDOW);
		dataGrid.setLocation(new Point(16, 24));
		dataGrid.setSize(new Point(400, 250));
		dataGrid.setTabIndex(0);
		dataGrid.setText("");
		dataGrid.setAllowAddNew(false);
		dataGrid.setAllowArrows(false);
		dataGrid.setAllowDelete(false);
		dataGrid.setAllowUpdate(false);
		dataGrid.setCaption("");
		dataGrid.setColumns(new Column[] {});
		dataGrid.setHeaderFont(Font.DEFAULT_GUI);
		dataGrid.setAllowRowSizing(false);
		dataGrid.setDynamicColumns(false);
		dataGrid.setDataMember("");

		ButtonOk.setLocation(new Point(120, 8));
		ButtonOk.setSize(new Point(70, 30));
		ButtonOk.setTabIndex(0);
		ButtonOk.setText("&OK");
		ButtonOk.addOnClick(new EventHandler(this.Button_Ok_Click));

		this.setNewControls(new Control[] {
							panel1, 
							dataGrid});
		panel1.setNewControls(new Control[] {
							  ButtonOk, 
							  btnClose});
	}
   
    
}
