VERSION 5.00
Begin VB.MDIForm MDI_Form 
   BackColor       =   &H8000000C&
   Caption         =   "CastPubs Demo"
   ClientHeight    =   975
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   2085
   LinkTopic       =   "MDIForm1"
   WindowState     =   2  'Maximized
   Begin VB.Menu File 
      Caption         =   "&File"
      Begin VB.Menu Connect 
         Caption         =   "&Connect"
      End
      Begin VB.Menu Quit 
         Caption         =   "&Quit"
      End
   End
End
Attribute VB_Name = "MDI_Form"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Connect_Click()

   frmStart.Height = 3090
   frmStart.Width = 7770
   frmStart.Left = 1500
   frmStart.Top = 1500
   frmStart.Show
   
End Sub

Private Sub Quit_Click()
   Unload Me
End Sub
