Attribute VB_Name = "StartModule"
Option Explicit

' Com Class implementation
Public VL_CastPubs As New CASTInterface


Public Sub Main()
    
    ' Open connection window
    MDI_Form.Show
    
End Sub

Public Function MYRF()
    
    Dim i As Integer
    Dim srf As String
    srf = "MYRF"
    i = CInt(srf)
    
    'pour lien avec le jeu de test web services
    Dim ws1, ws2, ws3 As String
    ws1 = "MYRFPort"
    ws2 = "AuthorsPort"
    ws3 = "titlesPort"
    Dim i1, i2, i3 As Integer
    i1 = CInt(ws1)
    i2 = CInt(ws2)
    i3 = CInt(ws3)
    
    MYRF = i
    
End Function

Public Sub Test_Authors()
    Dim conVBPubs As New ADODB.Connection
    Dim comAuteur As New ADODB.Command
    Dim rsVBPubs As New ADODB.Recordset
    Dim strNom As String
    Dim strConnection As String
    Dim j As Integer
    Dim id As String
    
    j = MYRF()
    
    strConnection = "Driver=SQL Server;server=CWQUALIF1;uid=sa;pwd=;database=VBPubs"
    conVBPubs.Open strConnection
    conVBPubs.CursorLocation = adUseClient
    comAuteur.CommandText = "select au_lname from authors where au_id = '" & id & "'"
    comAuteur.CommandType = adCmdText
    Set comAuteur.ActiveConnection = conVBPubs
    Set rsVBPubs = comAuteur.Execute
    
    strNom = rsVBPubs!au_lname
    
    Set comAuteur = Nothing
    rsVBPubs.Close
    conVBPubs.Close
    Set rsVBPubs = Nothing
    Set conVBPubs = Nothing
    
End Sub

Public Function Execute_Titles() As Variant
    
    Dim conVBPubs As New ADODB.Connection
    Dim comPublishers As New ADODB.Command
    Dim strConnection As String
    
    strConnection = "PROVIDER=MSDataShape;Data PROVIDER=MSDASQL;driver={Microsoft ODBC for Oracle};server=O3Q1;uid=castpubs;pwd=castpubs;"
    conVBPubs.Open strConnection
    conVBPubs.CursorLocation = adUseClient
    comPublishers.CommandText = "titles"
    comPublishers.CommandType = adCmdTable
    Set comPublishers.ActiveConnection = conVBPubs
        
    Set Execute_Titles = comPublishers.Execute

    conVBPubs.Close
    Set comPublishers = Nothing
    Set conVBPubs = Nothing

End Function
