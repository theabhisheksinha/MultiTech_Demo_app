Imports LibraryPubs.clsAuteur

Public Class frmAuteur
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox2 As System.Windows.Forms.TextBox

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents cmdSID As System.Windows.Forms.Button
    Friend WithEvents cmdInfos As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents TextBox3 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox4 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox5 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox6 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox7 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox8 As System.Windows.Forms.TextBox
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.TextBox2 = New System.Windows.Forms.TextBox()
        Me.cmdSID = New System.Windows.Forms.Button()
        Me.cmdInfos = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.TextBox3 = New System.Windows.Forms.TextBox()
        Me.TextBox4 = New System.Windows.Forms.TextBox()
        Me.TextBox5 = New System.Windows.Forms.TextBox()
        Me.TextBox6 = New System.Windows.Forms.TextBox()
        Me.TextBox7 = New System.Windows.Forms.TextBox()
        Me.TextBox8 = New System.Windows.Forms.TextBox()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(88, 32)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(168, 20)
        Me.TextBox1.TabIndex = 0
        Me.TextBox1.Text = ""
        '
        'TextBox2
        '
        Me.TextBox2.Location = New System.Drawing.Point(88, 80)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.Size = New System.Drawing.Size(168, 20)
        Me.TextBox2.TabIndex = 1
        Me.TextBox2.Text = ""
        '
        'cmdSID
        '
        Me.cmdSID.Location = New System.Drawing.Point(264, 32)
        Me.cmdSID.Name = "cmdSID"
        Me.cmdSID.Size = New System.Drawing.Size(88, 24)
        Me.cmdSID.TabIndex = 2
        Me.cmdSID.Text = "Trouver le SID"
        '
        'cmdInfos
        '
        Me.cmdInfos.Location = New System.Drawing.Point(56, 112)
        Me.cmdInfos.Name = "cmdInfos"
        Me.cmdInfos.Size = New System.Drawing.Size(104, 32)
        Me.cmdInfos.TabIndex = 4
        Me.cmdInfos.Text = "Trouver Infos"
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(8, 160)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(64, 16)
        Me.Label1.TabIndex = 5
        Me.Label1.Text = "Phone"
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(8, 184)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(72, 16)
        Me.Label2.TabIndex = 6
        Me.Label2.Text = "Address"
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(8, 208)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(72, 16)
        Me.Label3.TabIndex = 7
        Me.Label3.Text = "City"
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(8, 232)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(72, 16)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "State"
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(8, 256)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(80, 16)
        Me.Label5.TabIndex = 9
        Me.Label5.Text = "Country"
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(8, 280)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(80, 16)
        Me.Label6.TabIndex = 10
        Me.Label6.Text = "Postal Code"
        '
        'TextBox3
        '
        Me.TextBox3.Location = New System.Drawing.Point(104, 152)
        Me.TextBox3.Name = "TextBox3"
        Me.TextBox3.Size = New System.Drawing.Size(240, 20)
        Me.TextBox3.TabIndex = 11
        Me.TextBox3.Text = ""
        '
        'TextBox4
        '
        Me.TextBox4.Location = New System.Drawing.Point(104, 176)
        Me.TextBox4.Name = "TextBox4"
        Me.TextBox4.Size = New System.Drawing.Size(240, 20)
        Me.TextBox4.TabIndex = 12
        Me.TextBox4.Text = ""
        '
        'TextBox5
        '
        Me.TextBox5.Location = New System.Drawing.Point(104, 200)
        Me.TextBox5.Name = "TextBox5"
        Me.TextBox5.Size = New System.Drawing.Size(240, 20)
        Me.TextBox5.TabIndex = 13
        Me.TextBox5.Text = ""
        '
        'TextBox6
        '
        Me.TextBox6.Location = New System.Drawing.Point(104, 224)
        Me.TextBox6.Name = "TextBox6"
        Me.TextBox6.Size = New System.Drawing.Size(240, 20)
        Me.TextBox6.TabIndex = 14
        Me.TextBox6.Text = ""
        '
        'TextBox7
        '
        Me.TextBox7.Location = New System.Drawing.Point(104, 248)
        Me.TextBox7.Name = "TextBox7"
        Me.TextBox7.Size = New System.Drawing.Size(240, 20)
        Me.TextBox7.TabIndex = 15
        Me.TextBox7.Text = ""
        '
        'TextBox8
        '
        Me.TextBox8.Location = New System.Drawing.Point(104, 272)
        Me.TextBox8.Name = "TextBox8"
        Me.TextBox8.Size = New System.Drawing.Size(240, 20)
        Me.TextBox8.TabIndex = 16
        Me.TextBox8.Text = ""
        '
        'Label7
        '
        Me.Label7.Location = New System.Drawing.Point(8, 32)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(72, 16)
        Me.Label7.TabIndex = 17
        Me.Label7.Text = "Prénom Nom"
        '
        'Label8
        '
        Me.Label8.Location = New System.Drawing.Point(8, 80)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(24, 16)
        Me.Label8.TabIndex = 18
        Me.Label8.Text = "ID"
        '
        'frmAuteur
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(384, 358)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.Label8, Me.Label7, Me.TextBox8, Me.TextBox7, Me.TextBox6, Me.TextBox5, Me.TextBox4, Me.TextBox3, Me.Label6, Me.Label5, Me.Label4, Me.Label3, Me.Label2, Me.Label1, Me.cmdInfos, Me.cmdSID, Me.TextBox2, Me.TextBox1})
        Me.Name = "frmAuteur"
        Me.Text = "Auteur"
        Me.ResumeLayout(False)

    End Sub

#End Region

    'Private Sub cmdNom_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdNom.Click
    '    Dim laAuteur As New LibraryPubs.clsAuteur()
    '    Dim lsNom As String
    '    Dim lsPrenom As String

    '    laAuteur.Id = TextBox2.Text
    '    laAuteur.GetInfos()
    '    lsNom = laAuteur.Nom
    '    lsPrenom = laAuteur.Prenom

    '    TextBox1.Text = lsPrenom + " " + lsNom

    '    laAuteur = Nothing
    'End Sub

    Private Sub cmdSID_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSID.Click
        Dim laAuteur As New LibraryPubs.clsAuteur()
        Dim lsSID As String
        Dim lsName As String
        Dim first As String = ""
        Dim second As String = ""
        Dim temp As String
        Dim i As Integer
        Dim j As Integer
        Dim srf As String = "MYRF"

        j = laAuteur.MYRF()
        lsName = TextBox1.Text
        For i = 1 To Len(lsName)
            temp = Mid(lsName, i, 1)
            If temp = " " Then
                first = Microsoft.VisualBasic.Left(lsName, i - 1)
                second = Microsoft.VisualBasic.Right(lsName, Len(lsName) - i)
            End If
        Next
        If first = "" And second = "" Then
            MsgBox("Auteur non présent dans la base")
            Exit Sub
        End If
        laAuteur.Prenom = first
        laAuteur.Nom = second
        lsSID = laAuteur.GetId()
        TextBox2.Text = lsSID
        TextBox2.Enabled = True
        TextBox3.Enabled = True
        TextBox4.Enabled = True
        TextBox5.Enabled = True
        TextBox6.Enabled = True
        TextBox7.Enabled = True
        TextBox8.Enabled = True
        cmdInfos.Enabled = True
        'cmdNom.Enabled = True

        laAuteur = Nothing

    End Sub


    Private Sub cmdInfos_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdInfos.Click
        Dim laAuteur As New LibraryPubs.clsAuteur()
        Dim lsNom As String
        Dim lsPrenom As String
        Dim lsPhone As String
        Dim lsAdresse As String
        Dim lsCity As String
        Dim lsState As String
        Dim lsCountry As String
        Dim lsPostal As String

        laAuteur.Id = TextBox2.Text
        laAuteur.GetInfos()
        lsNom = laAuteur.Nom
        lsPrenom = laAuteur.Prenom
        lsPhone = laAuteur.Telephone
        lsAdresse = laAuteur.Adresse
        lsCity = laAuteur.Ville
        lsState = laAuteur.Etat
        lsCountry = laAuteur.Region
        lsPostal = laAuteur.CodePostal

        TextBox1.Text = lsPrenom + " " + lsNom
        TextBox3.Text = lsPhone
        TextBox4.Text = lsAdresse
        TextBox5.Text = lsCity
        TextBox6.Text = lsState
        TextBox7.Text = lsCountry
        TextBox8.Text = lsPostal

        laAuteur = Nothing
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        TextBox2.Enabled = False
        TextBox3.Enabled = False
        TextBox4.Enabled = False
        TextBox5.Enabled = False
        TextBox6.Enabled = False
        TextBox7.Enabled = False
        TextBox8.Enabled = False
        cmdInfos.Enabled = False
        'cmdNom.Enabled = False

    End Sub
End Class
