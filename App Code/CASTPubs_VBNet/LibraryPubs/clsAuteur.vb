Imports System
Imports System.Data
Imports System.Data.SqlClient

Public Class clsAuteur

    Dim maConnection As SqlConnection
    Dim maCommand As SqlCommand
    Dim monReader As SqlDataAdapter
    Dim monSQLDataAdapter As SqlDataAdapter
    Dim monSet As DataSet
    Dim monDataR As SqlDataReader


    Public Sub New()

        monSet = New DataSet()
        'maConnection = New SqlConnection("Server=ABD\NetSDK;Database=Pubs;Trusted_connection=Yes")
        maConnection = New SqlConnection("user id=user_pubs;password=user_pubs;initial catalog=pubs;data source=ABD\MS2K_ABD;")

        maCommand = New SqlCommand("select * from authors", maConnection)
        monReader = New SqlDataAdapter(maCommand)

        'monReader.SelectCommand = maCommand

        maConnection.Open()
        monReader.MissingSchemaAction = MissingSchemaAction.AddWithKey
        monReader.Fill(monSet, "authors")

        monSQLDataAdapter = New SqlDataAdapter("select * from titles", maConnection)

    End Sub


    Private sId As String
    Public Property Id() As String
        Get
            Return sId
        End Get
        Set(ByVal Value As String)
            sId = Value
        End Set
    End Property

    Private sNom As String
    Public Property Nom() As String
        Get
            Return sNom
        End Get
        Set(ByVal Value As String)
            sNom = Value
        End Set
    End Property

    Private sPrenom As String
    Public Property Prenom() As String
        Get
            Return sPrenom
        End Get
        Set(ByVal Value As String)
            sPrenom = Value
        End Set

    End Property

    Private sPhone As String
    Public Property Telephone() As String
        Get
            Return sPhone
        End Get
        Set(ByVal Value As String)
            sPhone = Value
        End Set
    End Property

    Private sAddress As String
    Public Property Adresse() As String
        Get
            Return sAddress
        End Get
        Set(ByVal Value As String)
            sAddress = Value
        End Set
    End Property

    Private sCity As String
    Public Property Ville() As String
        Get
            Return sCity
        End Get
        Set(ByVal Value As String)
            sCity = Value
        End Set
    End Property

    Private sState As String
    Public Property Etat() As String
        Get
            Return sState
        End Get
        Set(ByVal Value As String)
            sState = Value
        End Set
    End Property

    Private sCountry As String
    Public Property Region() As String
        Get
            Return sCountry
        End Get
        Set(ByVal Value As String)
            sCountry = Value
        End Set
    End Property

    Private sPostalCode As String
    Public Property CodePostal() As String
        Get
            Return sPostalCode
        End Get
        Set(ByVal Value As String)
            sPostalCode = Value
        End Set
    End Property

    Public Function GetNom()
        Dim maDataRow As DataRow
        maDataRow = monSet.Tables("authors").Rows.Find(Id)
        Return maDataRow(1)

    End Function

    Public Function MYRF()
        Dim l_i As Integer
        l_i = 1
        Return l_i

    End Function

    Public Function GetPrenom()
        Dim maDataRow As DataRow
        maDataRow = monSet.Tables("authors").Rows.Find(Id)

        Return maDataRow(2)

    End Function

    Public Function GetId()
        Dim sampParm As SqlParameter
        Dim cmd As SqlCommand = New SqlCommand("sp_Get_Id", maConnection)

        cmd.CommandType = CommandType.StoredProcedure

        sampParm = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int)
        sampParm.Direction = ParameterDirection.ReturnValue

        sampParm = cmd.Parameters.Add("@aulname", SqlDbType.VarChar, 50)
        sampParm.Value = Nom

        sampParm = cmd.Parameters.Add("@aufname", SqlDbType.VarChar, 50)
        sampParm.Value = Prenom

        sampParm = cmd.Parameters.Add("@id", SqlDbType.VarChar, 28)
        sampParm.Direction = ParameterDirection.Output
        sampParm.IsNullable = True

        Try
            monDataR = cmd.ExecuteReader()
        Catch ex As Exception   ' Catch the error.
            MsgBox(ex.ToString)
        End Try

        If IsDBNull(cmd.Parameters("@id").Value()) Then
            Return "pas de données correspondantes"
        Else
            Return cmd.Parameters("@id").Value()
        End If

    End Function

    Public Function GetInfos()
        Dim maDataRow As DataRow
        Try
            maDataRow = monSet.Tables("authors").Rows.Find(Id)
            Nom = maDataRow(1)
            Prenom = maDataRow(2)
            Telephone = maDataRow(3)
            Adresse = maDataRow(4)
            Ville = maDataRow(5)
            Etat = maDataRow(6)
            Region = maDataRow(7)
            CodePostal = maDataRow(8)
        Catch e As Exception
            MsgBox(e.ToString())
        End Try

    End Function



    Protected Overrides Sub Finalize()
        MyBase.Finalize()
        monSet = Nothing
        monDataR = Nothing
        monSQLDataAdapter = Nothing
        maConnection = Nothing
        monReader = Nothing
        maCommand = Nothing

    End Sub
End Class
