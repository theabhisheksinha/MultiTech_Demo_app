VERSION 5.00
Begin VB.Form frmCreateTitleSale 
   ClientHeight    =   1695
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4395
   Icon            =   "frmCreateTitleSale.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   1695
   ScaleWidth      =   4395
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Cr&eate"
      Default         =   -1  'True
      Height          =   495
      Left            =   2640
      TabIndex        =   6
      Top             =   360
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   495
      Left            =   2640
      TabIndex        =   5
      Top             =   1080
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      Caption         =   "Sale informations"
      Height          =   1335
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   2175
      Begin VB.TextBox tbDiscount 
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         Height          =   285
         Left            =   1080
         TabIndex        =   2
         Text            =   "0"
         Top             =   840
         Width           =   735
      End
      Begin VB.TextBox tbQty 
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         Height          =   285
         Left            =   1080
         TabIndex        =   1
         Text            =   "1"
         Top             =   360
         Width           =   735
      End
      Begin VB.Label lblDiscount 
         Alignment       =   1  'Right Justify
         Caption         =   "Discount :"
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   840
         Width           =   735
      End
      Begin VB.Label lblQty 
         Alignment       =   1  'Right Justify
         Caption         =   "Quantity :"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   360
         Width           =   735
      End
   End
End
Attribute VB_Name = "frmCreateTitleSale"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private m_TitleId As String

Public Property Get TitleId() As String
TitleId = m_TitleId
End Property

Public Property Let TitleId(sTitleId As String)
m_TitleId = sTitleId
End Property

Private Sub cmdCancel_Click()
    
    ' Close this window
    Unload Me
    
End Sub

Private Sub cmdCreate_Click()
    
  On Error GoTo ErrorHandler
    
    ' Test Qty parameter
    If Len(tbQty) = 0 Then
        tbQty.SetFocus
        Exit Sub
    End If
    
    ' Test Discount parameter
    If Len(tbDiscount) = 0 Then
        tbDiscount.SetFocus
        Exit Sub
    End If
    
     ' Change mouse pointer
        Screen.MousePointer = vbHourglass
        
    ' Create a new sale
    VL_CastPubs.CreateTitleSale m_TitleId, tbQty, tbDiscount
    
    If VL_CastPubs.ErrorBool Then
       MsgBox VL_CastPubs.ErrorMsg
    Else
       MsgBox "Sale completed!", vbInformation, "Result:"
    End If
    
    ' Change mouse pointer
        Screen.MousePointer = vbDefault
    Exit Sub
    
ErrorHandler:
  If Err.Number = 13 Then
     MsgBox "These fields accept only numbers.", vbCritical, "Type mismatch"
  Else
     MsgBox Err.Description
  End If
  
  ' Change mouse pointer
    Screen.MousePointer = vbDefault
     
    Exit Sub
    
End Sub

