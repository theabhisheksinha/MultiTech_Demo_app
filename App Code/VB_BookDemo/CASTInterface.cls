VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CASTInterface"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private VL_ServerType As ServerType

Public VL_ConnectionEstablish As Boolean
Public ErrorMsg As String
Public ErrorBool As Boolean

Public Enum ServerType
    SQLServer = 1
    Sybase = 2
    Oracle = 3
    Vide = 4
End Enum

Public Sub StartConnection(P_AccessType As ServerType, P_ServerName As String, P_UserName As String, P_password As String, P_DbName As String)
    
    ' Local variables
    Dim VL_Recordset As ADODB.Recordset
    
    ' Error management
    ErrorMsg = ""
    ErrorBool = False
    On Error GoTo ErrorHandler
      
    ' Close the connection if it was already opened
    Disconnect
    
    VL_ServerType = P_AccessType
   
    ' Initialize Connexion String
    
    
    Select Case VL_ServerType
    
    Case SQLServer
    
        CASTPubs_DataEnvironment.ConnectionMicrosoft.ConnectionString = "Provider=SQLOLEDB.1;Data Source=" & P_ServerName & ";User ID=" & P_UserName & ";initial catalog=" & P_DbName & ";connect timeout=15;password=" & P_password
    
    Case Sybase

          CASTPubs_DataEnvironment.ConnectionSybase.ConnectionString = "DSN=" & P_ServerName & ";DB=" & P_DbName & ";UID=" & P_UserName & ";PWD=" & P_password & ";WorkArounds2=67;"
    
    Case Oracle
        
       CASTPubs_DataEnvironment.ConnectionOracle.ConnectionString = "Password=" & P_password & ";User Id=" & P_UserName & ";Data Source=" & P_ServerName
  
    Case Else
        ' No connectionString selected
        CASTPubs_DataEnvironment.ConnectionMicrosoft.ConnectionString = ""
        CASTPubs_DataEnvironment.ConnectionOracle.ConnectionString = ""
        CASTPubs_DataEnvironment.ConnectionSybase.ConnectionString = ""
    End Select
        
     
    VL_ServerType = P_AccessType
    
 
    If VL_ServerType = SQLServer Then
         CASTPubs_DataEnvironment.ConnectionMicrosoft.Open
    ElseIf VL_ServerType = Sybase Then
          CASTPubs_DataEnvironment.ConnectionSybase.Open
    Else
          CASTPubs_DataEnvironment.ConnectionOracle.Open
    End If
     
    ' Connection with the database established
    VL_ConnectionEstablish = True

    ' End of this sub
    Exit Sub
    
ErrorHandler:

    ErrorMsg = Err.Description
    ErrorBool = True
        
    VL_ConnectionEstablish = False

End Sub

Private Sub Class_Initialize()
    
    VL_ServerType = Vide
    ErrorMsg = ""
    ErrorBool = False
    
End Sub


Private Sub Disconnect()

' Error management
On Error GoTo ErrorHandler


    CASTPubs_DataEnvironment.ConnectionMicrosoft.Close
    CASTPubs_DataEnvironment.ConnectionSybase.Close
    CASTPubs_DataEnvironment.ConnectionOracle.Close
    
    VL_ConnectionEstablish = False
    
Exit Sub

ErrorHandler:
  
   Resume Next
 
End Sub


Private Sub Class_Terminate()
    
    Disconnect
     
End Sub


Public Property Get ListAuthors() As ADODB.Recordset

    ' Local variable
    Dim VL_rsLstAuthors As ADODB.Recordset
    
    ' Error management
    ErrorMsg = ""
    ErrorBool = False
    On Error GoTo ErrorHandler
    
      
   If VL_ServerType = SQLServer Then
   
      ' Execute the query on Authors table
      CASTPubs_DataEnvironment.LstAuthorsMicrosoft
    
      ' Copy the current Recordset in a local variable
      Set VL_rsLstAuthors = CASTPubs_DataEnvironment.rsLstAuthorsMicrosoft.Clone
      
      ' Close the current recordset
      CASTPubs_DataEnvironment.rsLstAuthorsMicrosoft.Close
      
     Else
         If VL_ServerType = Sybase Then
     
           ' Execute the query on Authors table
           CASTPubs_DataEnvironment.LstAuthorsSybase
    
           ' Copy the current Recordset in a local variable
           Set VL_rsLstAuthors = CASTPubs_DataEnvironment.rsLstAuthorsSybase.Clone
      
           ' Close the current recordset
           CASTPubs_DataEnvironment.rsLstAuthorsSybase.Close
         
          Else
   
             ' Execute the query on Authors table
             CASTPubs_DataEnvironment.LstAuthorsOracle
 
             ' Copy the current Recordset in a local variable
             Set VL_rsLstAuthors = CASTPubs_DataEnvironment.rsLstAuthorsOracle.Clone

             ' Close the current recordset
             CASTPubs_DataEnvironment.rsLstAuthorsOracle.Close

          End If
    End If

    
    ' Return the authors list recordset
    Set ListAuthors = VL_rsLstAuthors
       
    ' End of this sub
    Exit Sub
    
ErrorHandler:
        
    ErrorMsg = Err.Description
    ErrorBool = True
    Set ListAuthors = Nothing

    
End Property


Public Property Get ListTitles(author_lname As String, author_fname As String) As ADODB.Recordset
  
    ' Local variable
    Dim VL_rsLstTitles As ADODB.Recordset
    Dim VL_ADOCommand As New ADODB.Command
    Dim VL_ParamLname As New ADODB.Parameter
    Dim VL_ParamFname As New ADODB.Parameter
    
    ' Error management
    ErrorMsg = ""
    ErrorBool = False
    
    On Error GoTo ErrorHandler
    
       
  If VL_ServerType = SQLServer Then
    Set VL_ADOCommand.ActiveConnection = CASTPubs_DataEnvironment.ConnectionMicrosoft
    VL_ADOCommand.CommandText = "GetTitleAuthors"
  Else
    If VL_ServerType = Sybase Then
        Set VL_ADOCommand.ActiveConnection = CASTPubs_DataEnvironment.ConnectionSybase
        VL_ADOCommand.CommandText = "GetTitleAuthors"
    Else
        Set VL_ADOCommand.ActiveConnection = CASTPubs_DataEnvironment.ConnectionOracle
        VL_ADOCommand.CommandText = "TITLEPKG.listetitles_proc"
    End If
  End If
    
      ' Set the command type -> stored procedure called
      VL_ADOCommand.CommandType = adCmdStoredProc

      ' Specify the parameter au_lname
      VL_ParamLname.Direction = adParamInput
      VL_ParamLname.Type = adVarChar
      VL_ParamLname.Size = 40
    
      ' Specify the parameter : au_fname
      VL_ParamFname.Direction = adParamInput
      VL_ParamFname.Type = adVarChar
      VL_ParamFname.Size = 20
   
      ' Add the parameters at the ADO command
      VL_ADOCommand.Parameters.Append VL_ParamLname
      VL_ADOCommand.Parameters.Append VL_ParamFname
    
      ' Set the parameter values
      VL_ParamLname.Value = author_lname
      VL_ParamFname.Value = author_fname

    
    Set VL_rsLstTitles = VL_ADOCommand.Execute
   
    ' Return the resultset
    Set ListTitles = VL_rsLstTitles
     
    ' End of this sub
    Exit Property
    
ErrorHandler:
        
    ErrorMsg = Err.Description
    ErrorBool = True
    Set ListTitles = Nothing
       

End Property


Public Sub CreateTitleSale(title_id As String, Qty As Integer, discount As Double)
    
    ' Local variables
    Dim VL_ADOCommand As New ADODB.Command
    Dim VL_ParamQty As New ADODB.Parameter
    Dim VL_ParamDiscount As New ADODB.Parameter
    Dim VL_ParamTitle As New ADODB.Parameter
    
    ' Error management
    ErrorMsg = ""
    ErrorBool = False
    On Error GoTo ErrorHandler
    
      If VL_ServerType = SQLServer Then
        Set VL_ADOCommand.ActiveConnection = CASTPubs_DataEnvironment.ConnectionMicrosoft
        VL_ADOCommand.CommandText = "NewCreateSale"
      Else
        If VL_ServerType = Sybase Then
           Set VL_ADOCommand.ActiveConnection = CASTPubs_DataEnvironment.ConnectionSybase
           VL_ADOCommand.CommandText = "NewCreateSale"
        Else
           Set VL_ADOCommand.ActiveConnection = CASTPubs_DataEnvironment.ConnectionOracle
           VL_ADOCommand.CommandText = "SALEPKG.NEWCREATESALE"
        End If
      End If
           
    
      ' Set the command type -> stored procedure called
        VL_ADOCommand.CommandType = adCmdStoredProc
    
      ' Specify the parameter : title_id
        VL_ParamTitle.Direction = adParamInput
        VL_ParamTitle.Type = adVarChar
        VL_ParamTitle.Size = 6
    
      ' Specify the parameter : Quantity
        VL_ParamQty.Direction = adParamInput
        VL_ParamQty.Type = adInteger
        
      ' Specify the parameter : Discount
         VL_ParamDiscount.Direction = adParamInput
        VL_ParamDiscount.Type = adDouble
    
      ' Add parameters to ADO command
        VL_ADOCommand.Parameters.Append VL_ParamTitle
        VL_ADOCommand.Parameters.Append VL_ParamQty
        VL_ADOCommand.Parameters.Append VL_ParamDiscount
    
      ' Set parameter values
       VL_ParamTitle.Value = title_id
       VL_ParamQty.Value = Qty
       VL_ParamDiscount.Value = discount
    

       ' Execute the stored procedure
       VL_ADOCommand.Execute

   
       ' End of this sub
       Exit Sub
    
ErrorHandler:

    ErrorMsg = Err.Description
    ErrorBool = True
    
End Sub

