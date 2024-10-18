//CreateSale.java

import com.ms.wfc.app.*;
import com.ms.wfc.core.*;
import com.ms.wfc.ui.*;
import com.ms.wfc.data.*;
import com.ms.wfc.data.ui.*;

public class CreateSale extends Form
{

    Recordset m_rs;
    Connection m_con;
    String title_id;
	int TypeServer;
   
    public void dispose()
    {
        super.dispose();
        components.dispose();
    }
	
	public void MYRF()
	{
		int i=1;
	}
	
    public CreateSale(Connection P_Connection,int P_TypeServer,String P_title_id,String P_title)
    {
        // Required for Visual J++ Form Designer support
		
		m_con = new Connection();
		m_con=P_Connection;
		
		title_id=P_title_id;
		TypeServer=P_TypeServer;
			
        initForm();
        MYRF();
        
		this.Caption.setText(P_title);
		
        this.show();
        this.update();

     
       
    }    



       
    void handleADOException(Exception e)
    {
        e.printStackTrace();
        MessageBox.show( e.toString(), "CreateSale" );
    }

	private void Cancel_click(Object source, Event e)
	{
		this.hide();
	}

	private void Create_Sale_click(Object source, Event e)
	{
		
		try
	  {
		Cursor.WAIT.setCurrent();  
        m_rs = new Recordset();
        m_rs.setActiveConnection(m_con);
		
		switch (TypeServer)
			{
				case 1: // Microsoft SQL Server
				{ m_rs.setSource("NewCreateSale '" +title_id+"',"+this.Quantity.getText()+","+this.Discount.getText());
				  break;
				}
				case 2: // Sybase
				{ m_rs.setSource("NewCreateSale '" +title_id+"',"+this.Quantity.getText()+","+this.Discount.getText());
				  break;
				}
				case 3: // Oracle
				{ 
					m_rs.setSource("begin NEWCREATESALE('"+title_id+"',"+this.Quantity.getText()+","+this.Discount.getText()+"); end;");	    
				   break;
				}
			}
		
        m_rs.setCursorType(AdoEnums.CursorType.STATIC);
        m_rs.setCursorLocation(AdoEnums.CursorLocation.CLIENT);
        m_rs.setLockType(AdoEnums.LockType.OPTIMISTIC);
        m_rs.open();
		
		MessageBox.show( "Sale Created", "Result:" );
	  }
	  catch(com.ms.wfc.data.AdoException f)
		  
		  {
	      
		  MessageBox.show("These fields accept only numbers.","Error" );
		  
	      }
	  catch(Exception f)
		  
		  {
		
		  MessageBox.show(f.getMessage(),"Error" );
		  
	      }
	}

	/**
	 * NOTE: The following code is required by the Visual J++ form
	 * designer.  It can be modified using the form editor.  Do not
	 * modify it using the code editor.
	 */
	Container components = new Container();
	Button Create_Sale = new Button();
	Button Cancel = new Button();
	Edit Quantity = new Edit();
	Edit Discount = new Edit();
	Label label1 = new Label();
	Label label2 = new Label();
	Label Caption = new Label();

	private void initForm()
	{
		// NOTE:  This form is storing resource information in an
		// external file.  Do not modify the string parameter to any
		// resources.getObject() function call. For example, do not
		// modify "foo1_location" in the following line of code
		// even if the name of the Foo object changes: 
		//   foo1.setLocation((Point)resources.getObject("foo1_location"));

		IResourceManager resources = new ResourceManager(this, "CreateSale");
		this.setText("Create Sale");
		this.setAutoScaleBaseSize(new Point(5, 13));
		this.setClientSize(new Point(418, 185));
		this.setIcon((Icon)resources.getObject("this_icon"));

		Create_Sale.setLocation(new Point(112, 144));
		Create_Sale.setSize(new Point(88, 24));
		Create_Sale.setTabIndex(0);
		Create_Sale.setText("Create Sale");
		Create_Sale.addOnClick(new EventHandler(this.Create_Sale_click));

		Cancel.setLocation(new Point(216, 144));
		Cancel.setSize(new Point(80, 24));
		Cancel.setTabIndex(1);
		Cancel.setText("Cancel");
		Cancel.addOnClick(new EventHandler(this.Cancel_click));

		Quantity.setLocation(new Point(192, 72));
		Quantity.setSize(new Point(96, 20));
		Quantity.setTabIndex(2);
		Quantity.setText("");

		Discount.setLocation(new Point(192, 104));
		Discount.setSize(new Point(96, 20));
		Discount.setTabIndex(3);
		Discount.setText("");

		label1.setFont(new Font("MS Sans Serif", 12.0f, FontSize.CHARACTERHEIGHT, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
		label1.setLocation(new Point(112, 72));
		label1.setSize(new Point(56, 16));
		label1.setTabIndex(5);
		label1.setTabStop(false);
		label1.setText("Quantity:");

		label2.setFont(new Font("MS Sans Serif", 12.0f, FontSize.CHARACTERHEIGHT, FontWeight.NORMAL, false, false, false, CharacterSet.DEFAULT, 0));
		label2.setLocation(new Point(112, 104));
		label2.setSize(new Point(56, 16));
		label2.setTabIndex(4);
		label2.setTabStop(false);
		label2.setText("Discount:");

		Caption.setFont(new Font("MS Sans Serif", 15.0f, FontSize.CHARACTERHEIGHT, FontWeight.NORMAL, false, true, false, CharacterSet.DEFAULT, 0));
		Caption.setLocation(new Point(24, 16));
		Caption.setSize(new Point(368, 40));
		Caption.setTabIndex(6);
		Caption.setTabStop(false);
		Caption.setText("Title ordered");
		Caption.setTextAlign(HorizontalAlignment.CENTER);

		this.setNewControls(new Control[] {
							Caption, 
							label2, 
							label1, 
							Quantity, 
							Cancel, 
							Create_Sale, 
							Discount});
	}
    
   
}

