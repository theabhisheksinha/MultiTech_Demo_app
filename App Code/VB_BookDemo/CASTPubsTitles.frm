VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmTitles 
   Caption         =   "GetTitles"
   ClientHeight    =   5325
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6750
   Icon            =   "CASTPubsTitles.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5325
   ScaleWidth      =   6750
   Begin VB.CommandButton cmdCreateSale 
      Caption         =   "Create& &Sale"
      Height          =   495
      Left            =   1800
      TabIndex        =   2
      Top             =   4680
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   495
      Left            =   3360
      TabIndex        =   1
      Top             =   4680
      Width           =   1335
   End
   Begin MSDataGridLib.DataGrid ListTitles 
      Height          =   4335
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   6255
      _ExtentX        =   11033
      _ExtentY        =   7646
      _Version        =   393216
      AllowUpdate     =   0   'False
      HeadLines       =   1
      RowHeight       =   15
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "List_of_titles"
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1036
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1036
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         BeginProperty Column00 
         EndProperty
         BeginProperty Column01 
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmTitles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private m_au_lname As String
Private m_au_fname As String

Public Property Get aulname() As String
aulname = m_au_lname
End Property

Public Property Let aulname(sau_lname As String)
m_au_lname = sau_lname
End Property

Public Property Get aufname() As String
aufname = m_au_fname
End Property

Public Property Let aufname(sau_fname As String)
m_au_fname = sau_fname
End Property

Private Sub cmdCancel_Click()

    ' Close the current window
    Unload Me

End Sub

Private Sub cmdCreateSale_Click()
    
   
    frmCreateTitleSale.TitleId = ListTitles.Columns(3)
    ' Initialize the caption of the new window
    frmCreateTitleSale.Caption = "New sale : " & ListTitles.Columns(1) & " " & ListTitles.Columns(0)
  
    ' Display the new window
    frmCreateTitleSale.Width = 4500
    frmCreateTitleSale.Height = 2100
    frmCreateTitleSale.Show


End Sub



Private Sub Form_Load()
    
    ' Local variable
    Dim VL_Recordset As ADODB.Recordset
    
    On Error GoTo ErrorHandler
    
    ' Change mouse pointer
    Screen.MousePointer = vbHourglass
    
    ' Execute GetTitleAuthors stored procedure and prepare the resultset
    Set VL_Recordset = VL_CastPubs.ListTitles(m_au_lname, m_au_fname)
    
    If VL_CastPubs.ErrorBool Then
    
       cmdCreateSale.Enabled = False
       Screen.MousePointer = vbDefault
    
    Else
    
        ' If the recorset is empty, the CreateSale button become grayed
         If VL_Recordset.RecordCount = 0 Then
            cmdCreateSale.Enabled = False
            ' Close the current recordset
            VL_Recordset.Close
            
         Else
         
            ' Initialize DataGrid container with Titles written by the current author selected in the previous window
            Set ListTitles.DataSource = VL_Recordset
            ' Hide the Title_id column
             ListTitles.Columns(0).Visible = False
             ListTitles.Columns(1).Visible = False
             ListTitles.Columns(3).Visible = False
             ListTitles.Columns(2).Width = 6000
         End If
    
         ' Change mouse pointer
         Screen.MousePointer = vbDefault
    
    End If
    
    Exit Sub
    
ErrorHandler:
    cmdCreateSale.Enabled = False
    Screen.MousePointer = vbDefault
End Sub

Private Sub Form_Unload(Cancel As Integer)
    
    ' Destruction of the current Recordset in DataGrid object
    Set ListTitles.DataSource = Nothing

End Sub

Private Sub ListTitles_DblClick()
    
    ' Open the CreateSale window for the selected title
    cmdCreateSale_Click

End Sub

Private Sub ListTitles_KeyDown(KeyCode As Integer, Shift As Integer)
    
    ' On Escape key in the DataGrid, stop the application
    If KeyCode = vbKeyEscape Then
        Unload Me
   End If

End Sub
