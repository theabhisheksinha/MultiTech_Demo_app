//Login.java

import com.ms.wfc.app.*;
import com.ms.wfc.core.*;
import com.ms.wfc.ui.*;
import com.ms.wfc.data.*;
import com.ms.wfc.data.ui.*;


public class Login extends Form
{
     
   // public void btnClose_Click(Object sender, Event evt)
   // {
   //     Application.exit();
  //  }

    public void dispose()
    {
        super.dispose();
        components.dispose();
    }
	
    public Login()
    {
        
        initForm();
        
        this.show();
        this.update();

        
    }    

    public void formClose(Event e)
    {
        Application.exit();
   }    

    
    void handleADOException(Exception e)
    {
        e.printStackTrace();
        MessageBox.show( e.toString(), "Login" );
    }

	private void Close_click(Object source, Event e)
	{
		
		this.close();
	
	}

	 private int TypeServer() 
	{
		 
		if (ListTypeServer.getText().equals("Microsoft SQL Server"))
		{	
		
			return 1;
		}
			
		if (ListTypeServer.getText().equals("Sybase"))
		{
			return 2;
		}
		
		if (ListTypeServer.getText().equals("Oracle"))
		{
			return 3;
		}
		
		return 0;
	}
	
	private void Connect_click(Object source, Event e)
	{   
						
		try
		{  
			Cursor.WAIT.setCurrent();
			Connection m_con= new Connection();
			switch(this.TypeServer())
			{
			case 1: //"Microsoft SQL Server"	
			  {
				m_con.setConnectionString("Driver={SQL Server};Server=" + this.ServerName.getText()+";uid="+ this.Login1.getText()+";pwd="+this.PassWord.getText()+";database="+this.database.getText());
			    m_con.open();
		
			    Application.run( new  ListAuthors(m_con,this.TypeServer()) );
				break;
			  }
			  
			case 2://"Sybase"	
			  {
				m_con.setConnectionString("PROVIDER=MSDASQL;dsn=" + this.ServerName.getText()+";uid="+ this.Login1.getText()+";pwd="+this.PassWord.getText()+";database="+this.database.getText());
			 
				m_con.open();
		
			    Application.run( new  ListAuthors(m_con,this.TypeServer()) );
				break;
			  }
			  
			case 3://"Oracle"	
			  {
				m_con.setConnectionString ("Driver={Microsoft ODBC for Oracle};server="+ this.ServerName.getText()+";uid="+ this.Login1.getText()+";pwd="+ this.PassWord.getText());
				m_con.open();
		
			    Application.run( new  ListAuthors(m_con,this.TypeServer()));
				break;
			  }
			}
			
		}
		catch (com.ms.wfc.data.AdoException f)
		{
		  MessageBox.show("Not connected! Try again.", "Login Error" );
	    }

	    catch (Exception f)
		{
		  MessageBox.show(f.getMessage(), "Error" );	
	    }
	}


	

	private void ListTypeServer_selectedIndexChanged(Object source, Event e)
	{
		
		if (this.TypeServer()==3)
		{
			this.database.setEnabled(false);
			this.database.setBackColor(Color.INACTIVECAPTIONTEXT);
		}
		else
		{
			this.database.setEnabled(true);
			this.database.setBackColor(Color.WINDOW);
		}	
	}

	/**
	 * NOTE: The following code is required by the Visual J++ form
	 * designer.  It can be modified using the form editor.  Do not
	 * modify it using the code editor.
	 */
	Container components = new Container();
	Edit ServerName = new Edit();
	PictureBox pictureBox1 = new PictureBox();
	Label labelau_id = new Label();
	Edit Login1 = new Edit();
	Button Close = new Button();
	Button Connect = new Button();
	ComboBox ListTypeServer = new ComboBox();
	Edit PassWord = new Edit();
	Label label1 = new Label();
	Label label2 = new Label();
	Label label3 = new Label();
	Edit database = new Edit();
	Label DatabaseLabel = new Label();

	private void initForm()
	{
		// NOTE:  This form is storing resource information in an
		// external file.  Do not modify the string parameter to any
		// resources.getObject() function call. For example, do not
		// modify "foo1_location" in the following line of code
		// even if the name of the Foo object changes: 
		//   foo1.setLocation((Point)resources.getObject("foo1_location"));

		IResourceManager resources = new ResourceManager(this, "Login");
		this.setLocation(new Point(7, 7));
		this.setText("Cast Demo Application");
		this.setAutoScaleBaseSize(new Point(5, 13));
		this.setAutoScroll(true);
		this.setClientSize(new Point(495, 179));
		this.setIcon((Icon)resources.getObject("this_icon"));
		this.setStartPosition(FormStartPosition.CENTER_SCREEN);

		ServerName.setAnchor(ControlAnchor.TOPLEFTRIGHT);
		ServerName.setLocation(new Point(232, 112));
		ServerName.setSize(new Point(154, 20));
		ServerName.setTabIndex(4);
		ServerName.setText("");
		ServerName.setMaxLength(50);

		pictureBox1.setLocation(new Point(8, 16));
		pictureBox1.setSize(new Point(120, 144));
		pictureBox1.setTabIndex(12);
		pictureBox1.setTabStop(false);
		pictureBox1.setText("pictureBox1");
		pictureBox1.setImage((Bitmap)resources.getObject("pictureBox1_image"));

		labelau_id.setBackColor(Color.CONTROL);
		labelau_id.setLocation(new Point(144, 16));
		labelau_id.setSize(new Point(72, 20));
		labelau_id.setTabIndex(10);
		labelau_id.setTabStop(false);
		labelau_id.setText("&Login:");

		Login1.setAnchor(ControlAnchor.TOPLEFTRIGHT);
		Login1.setLocation(new Point(232, 16));
		Login1.setSize(new Point(154, 20));
		Login1.setTabIndex(1);
		Login1.setText("");
		Login1.setMaxLength(25);

		Close.setLocation(new Point(400, 88));
		Close.setSize(new Point(72, 32));
		Close.setTabIndex(11);
		Close.setText("C&lose");
		Close.addOnClick(new EventHandler(this.Close_click));

		Connect.setLocation(new Point(400, 40));
		Connect.setSize(new Point(72, 32));
		Connect.setTabIndex(6);
		Connect.setText("&Connect");
		Connect.addOnClick(new EventHandler(this.Connect_click));

		ListTypeServer.setLocation(new Point(232, 80));
		ListTypeServer.setSize(new Point(154, 21));
		ListTypeServer.setTabIndex(3);
		ListTypeServer.setText("");
		ListTypeServer.setStyle(ComboBoxStyle.DROPDOWNLIST);
		ListTypeServer.setItems(new Object[] {
								"Microsoft SQL Server", 
								"Sybase", 
								"Oracle"});
		ListTypeServer.addOnSelectedIndexChanged(new EventHandler(this.ListTypeServer_selectedIndexChanged));

		PassWord.setAnchor(ControlAnchor.TOPLEFTRIGHT);
		PassWord.setLocation(new Point(232, 48));
		PassWord.setSize(new Point(154, 20));
		PassWord.setTabIndex(2);
		PassWord.setText("");
		PassWord.setMaxLength(25);
		PassWord.setPasswordChar('*');

		label1.setBackColor(Color.CONTROL);
		label1.setLocation(new Point(144, 48));
		label1.setSize(new Point(72, 20));
		label1.setTabIndex(9);
		label1.setTabStop(false);
		label1.setText("&Password:");

		label2.setBackColor(Color.CONTROL);
		label2.setLocation(new Point(144, 80));
		label2.setSize(new Point(72, 20));
		label2.setTabIndex(8);
		label2.setTabStop(false);
		label2.setText("Server &Type:");

		label3.setBackColor(Color.CONTROL);
		label3.setLocation(new Point(144, 112));
		label3.setSize(new Point(72, 20));
		label3.setTabIndex(0);
		label3.setTabStop(false);
		label3.setText("Server &Name:");

		database.setAnchor(ControlAnchor.TOPLEFTRIGHT);
		database.setLocation(new Point(232, 144));
		database.setSize(new Point(154, 20));
		database.setTabIndex(5);
		database.setText("");
		database.setMaxLength(25);

		DatabaseLabel.setBackColor(Color.CONTROL);
		DatabaseLabel.setLocation(new Point(144, 144));
		DatabaseLabel.setSize(new Point(72, 20));
		DatabaseLabel.setTabIndex(7);
		DatabaseLabel.setTabStop(false);
		DatabaseLabel.setText("&Database:");

		this.setNewControls(new Control[] {
							DatabaseLabel, 
							database, 
							pictureBox1, 
							Close, 
							Connect, 
							label3, 
							label2, 
							ListTypeServer, 
							label1, 
							PassWord, 
							ServerName, 
							labelau_id, 
							Login1});
	}

    public static void main(String args[])
    {
        Application.run( new   Login() );
    }
}
