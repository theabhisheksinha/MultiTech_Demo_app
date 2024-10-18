VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmAuthors 
   Caption         =   "GetAuthors"
   ClientHeight    =   5325
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4620
   Icon            =   "CASTPubsAuthors.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5325
   ScaleWidth      =   4620
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   495
      Left            =   2400
      TabIndex        =   2
      Top             =   4800
      Width           =   1335
   End
   Begin VB.CommandButton cmdGetTiltles 
      Caption         =   "&GetTiltles"
      Default         =   -1  'True
      Height          =   495
      Left            =   840
      TabIndex        =   1
      Top             =   4800
      Width           =   1335
   End
   Begin MSDataGridLib.DataGrid ListAuthors 
      Height          =   4335
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   4095
      _ExtentX        =   7223
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
      Caption         =   "List_of_Authors"
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
Attribute VB_Name = "frmAuthors"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCancel_Click()

    ' End of The application
    Unload Me
    
End Sub

Private Sub cmdGetTiltles_Click()

    frmTitles.aulname = ListAuthors.Columns(0)
    frmTitles.aufname = ListAuthors.Columns(1)
    
    ' Initialize the caption of the new window
    frmTitles.ListTitles.Caption = "List of books written by " & ListAuthors.Columns(1) & " " & ListAuthors.Columns(0)
  
    ' Display the new window
    frmTitles.Show
    frmTitles.Width = 6870
    frmTitles.Height = 5730
        
End Sub

Private Sub Command1_Click()

End Sub

Private Sub Form_Load()
    
    ' Initialize DataGrid container with Authors List
    Set ListAuthors.DataSource = VL_CastPubs.ListAuthors
    
    If VL_CastPubs.ErrorBool Then
       MsgBox VL_CastPubs.ErrorMsg
    End If
    
End Sub

Private Sub Form_Unload(Cancel As Integer)

    ' Destruction of the current Recordset in DataGrid object
  
    Set ListAuthors.DataSource = Nothing
    
End Sub

Private Sub ListAuthors_DblClick()

    ' Open the titles for the selected author
    cmdGetTiltles_Click

End Sub

Private Sub ListAuthors_KeyDown(KeyCode As Integer, Shift As Integer)

    ' On Escape key in the DataGrid, stop the application
    If KeyCode = vbKeyEscape Then
        Unload Me
    End If

End Sub

