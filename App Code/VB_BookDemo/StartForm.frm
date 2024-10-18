VERSION 5.00
Begin VB.Form frmStart 
   AutoRedraw      =   -1  'True
   BackColor       =   &H8000000A&
   Caption         =   "Connection"
   ClientHeight    =   2685
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7650
   Icon            =   "StartForm.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   2685
   ScaleWidth      =   7650
   Begin VB.TextBox DbName 
      Height          =   285
      Left            =   3360
      TabIndex        =   4
      Top             =   2190
      Width           =   2415
   End
   Begin VB.CommandButton CmdOK 
      Caption         =   "&Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   6240
      TabIndex        =   5
      Top             =   720
      Width           =   1095
   End
   Begin VB.CommandButton CmdCancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6240
      TabIndex        =   6
      Top             =   1320
      Width           =   1095
   End
   Begin VB.TextBox Txt_ServerName 
      Height          =   285
      Left            =   3360
      TabIndex        =   3
      Top             =   1710
      Width           =   2415
   End
   Begin VB.ComboBox CboTypServer 
      Height          =   315
      ItemData        =   "StartForm.frx":0442
      Left            =   3360
      List            =   "StartForm.frx":044F
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1200
      Width           =   2415
   End
   Begin VB.TextBox Txt_PassWord 
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   3360
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   720
      Width           =   2415
   End
   Begin VB.TextBox Txt_Login 
      Height          =   285
      Left            =   3360
      TabIndex        =   0
      Top             =   240
      Width           =   2415
   End
   Begin VB.Label Label5 
      BackColor       =   &H8000000A&
      Caption         =   "&Database"
      Height          =   255
      Left            =   2280
      TabIndex        =   11
      Top             =   2160
      Width           =   975
   End
   Begin VB.Image Image1 
      Height          =   2250
      Left            =   120
      Picture         =   "StartForm.frx":047D
      Top             =   240
      Width           =   1845
   End
   Begin VB.Label Label4 
      BackColor       =   &H8000000A&
      Caption         =   "Server &Name"
      Height          =   255
      Left            =   2280
      TabIndex        =   10
      Top             =   1680
      Width           =   975
   End
   Begin VB.Label Label3 
      BackColor       =   &H8000000A&
      Caption         =   "&Server Type"
      Height          =   255
      Left            =   2280
      TabIndex        =   9
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label Label2 
      BackColor       =   &H8000000A&
      Caption         =   "&Password"
      Height          =   255
      Left            =   2280
      TabIndex        =   8
      Top             =   720
      Width           =   975
   End
   Begin VB.Label Label1 
      BackColor       =   &H8000000A&
      Caption         =   "&Login"
      Height          =   255
      Left            =   2280
      TabIndex        =   7
      Top             =   240
      Width           =   975
   End
End
Attribute VB_Name = "frmStart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



Private Sub CboTypServer_Click()

    If CboTypServer.ItemData(CboTypServer.ListIndex) = 3 Then
        DbName.Enabled = False
       DbName.BackColor = &H8000000B
        
    Else
        DbName.Enabled = True
        DbName.BackColor = &H80000005

    End If
    
End Sub

Private Sub cmdCancel_Click()

    ' End of this application
    Unload Me
    
End Sub


Private Sub CmdOK_Click()
    ' Parameters validation
    
     If (Txt_Login = "") Then
        MsgBox "Enter the login name", vbOKOnly
        Txt_Login.SetFocus
        
    ElseIf (CboTypServer = "") Then
        MsgBox "Enter the Server Type", vbOKOnly
        CboTypServer.SetFocus
        
    ElseIf (Txt_ServerName = "") Then
        MsgBox "Enter the Server Name", vbOKOnly
        Txt_ServerName.SetFocus
        
    ElseIf (DbName = "") And CboTypServer.ItemData(CboTypServer.ListIndex) <> 3 Then
        MsgBox "Enter the database name", vbOKOnly
        DbName.SetFocus
    Else
        ' Change mouse pointer
        Screen.MousePointer = vbHourglass
        
        ' StartConnection to the database
        VL_CastPubs.StartConnection CboTypServer.ItemData(CboTypServer.ListIndex), Txt_ServerName, Txt_Login, Txt_PassWord, DbName
              
        If Not VL_CastPubs.ErrorBool Then
            ' Load authors list window
            
            frmAuthors.Show
            frmAuthors.Width = 4740
            frmAuthors.Height = 5730
            
        Else
           
            MsgBox VL_CastPubs.ErrorMsg
            
        End If
        
        ' Change mouse pointer
        Screen.MousePointer = vbDefault
        
        ' End of this window
        Unload Me
    End If
    
End Sub

Private Sub Form_Load()
Me.Caption = "Connection from " & Environ$("ComputerName")
End Sub
