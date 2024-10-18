Public Class frmTitles1
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

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents OleDbSelectCommand1 As System.Data.OleDb.OleDbCommand
    Friend WithEvents OleDbInsertCommand1 As System.Data.OleDb.OleDbCommand
    Friend WithEvents OleDbUpdateCommand1 As System.Data.OleDb.OleDbCommand
    Friend WithEvents OleDbDeleteCommand1 As System.Data.OleDb.OleDbCommand
    Friend WithEvents objtitles1 As AppliPubs.titles1
    Friend WithEvents OleDbConnection1 As System.Data.OleDb.OleDbConnection
    Friend WithEvents OleDbDataAdapter1 As System.Data.OleDb.OleDbDataAdapter
    Friend WithEvents btnLoad As System.Windows.Forms.Button
    Friend WithEvents btnUpdate As System.Windows.Forms.Button
    Friend WithEvents btnCancelAll As System.Windows.Forms.Button
    Friend WithEvents grdtitles As System.Windows.Forms.DataGrid
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.OleDbSelectCommand1 = New System.Data.OleDb.OleDbCommand()
        Me.OleDbConnection1 = New System.Data.OleDb.OleDbConnection()
        Me.OleDbInsertCommand1 = New System.Data.OleDb.OleDbCommand()
        Me.OleDbUpdateCommand1 = New System.Data.OleDb.OleDbCommand()
        Me.OleDbDeleteCommand1 = New System.Data.OleDb.OleDbCommand()
        Me.objtitles1 = New AppliPubs.titles1()
        Me.OleDbDataAdapter1 = New System.Data.OleDb.OleDbDataAdapter()
        Me.btnLoad = New System.Windows.Forms.Button()
        Me.btnUpdate = New System.Windows.Forms.Button()
        Me.btnCancelAll = New System.Windows.Forms.Button()
        Me.grdtitles = New System.Windows.Forms.DataGrid()
        CType(Me.objtitles1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.grdtitles, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'OleDbSelectCommand1
        '
        Me.OleDbSelectCommand1.CommandText = "SELECT title_id, title, type, pub_id, price, advance, royalty, ytd_sales, notes, " & _
        "pubdate FROM titles"
        Me.OleDbSelectCommand1.Connection = Me.OleDbConnection1
        '
        'OleDbConnection1
        '
        Me.OleDbConnection1.ConnectionString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial " & _
        "Catalog=pubs;Data Source=ABD\MS2K_ABD;Use Procedure for Prepare=1;Auto Translate" & _
        "=True;Packet Size=4096;Workstation ID=ABD;Use Encryption for Data=False;Tag with" & _
        " column collation when possible=False"
        '
        'OleDbInsertCommand1
        '
        Me.OleDbInsertCommand1.CommandText = "INSERT INTO titles(title_id, title, type, pub_id, price, advance, royalty, ytd_sa" & _
        "les, notes, pubdate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?); SELECT title_id, tit" & _
        "le, type, pub_id, price, advance, royalty, ytd_sales, notes, pubdate FROM titles" & _
        " WHERE (title_id = ?)"
        Me.OleDbInsertCommand1.Connection = Me.OleDbConnection1
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("title_id", System.Data.OleDb.OleDbType.VarChar, 6, "title_id"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("title", System.Data.OleDb.OleDbType.VarChar, 80, "title"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("type", System.Data.OleDb.OleDbType.VarChar, 12, "type"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("pub_id", System.Data.OleDb.OleDbType.VarChar, 4, "pub_id"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("price", System.Data.OleDb.OleDbType.Currency, 8, "price"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("advance", System.Data.OleDb.OleDbType.Currency, 8, "advance"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("royalty", System.Data.OleDb.OleDbType.Integer, 4, "royalty"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("ytd_sales", System.Data.OleDb.OleDbType.Integer, 4, "ytd_sales"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("notes", System.Data.OleDb.OleDbType.VarChar, 200, "notes"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("pubdate", System.Data.OleDb.OleDbType.DBTimeStamp, 8, "pubdate"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Select_title_id", System.Data.OleDb.OleDbType.VarChar, 6, "title_id"))
        '
        'OleDbUpdateCommand1
        '
        Me.OleDbUpdateCommand1.CommandText = "UPDATE titles SET title_id = ?, title = ?, type = ?, pub_id = ?, price = ?, advan" & _
        "ce = ?, royalty = ?, ytd_sales = ?, notes = ?, pubdate = ? WHERE (title_id = ?) " & _
        "AND (advance = ? OR ? IS NULL AND advance IS NULL) AND (notes = ? OR ? IS NULL A" & _
        "ND notes IS NULL) AND (price = ? OR ? IS NULL AND price IS NULL) AND (pub_id = ?" & _
        " OR ? IS NULL AND pub_id IS NULL) AND (pubdate = ?) AND (royalty = ? OR ? IS NUL" & _
        "L AND royalty IS NULL) AND (title = ?) AND (type = ?) AND (ytd_sales = ? OR ? IS" & _
        " NULL AND ytd_sales IS NULL); SELECT title_id, title, type, pub_id, price, advan" & _
        "ce, royalty, ytd_sales, notes, pubdate FROM titles WHERE (title_id = ?)"
        Me.OleDbUpdateCommand1.Connection = Me.OleDbConnection1
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("title_id", System.Data.OleDb.OleDbType.VarChar, 6, "title_id"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("title", System.Data.OleDb.OleDbType.VarChar, 80, "title"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("type", System.Data.OleDb.OleDbType.VarChar, 12, "type"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("pub_id", System.Data.OleDb.OleDbType.VarChar, 4, "pub_id"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("price", System.Data.OleDb.OleDbType.Currency, 8, "price"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("advance", System.Data.OleDb.OleDbType.Currency, 8, "advance"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("royalty", System.Data.OleDb.OleDbType.Integer, 4, "royalty"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("ytd_sales", System.Data.OleDb.OleDbType.Integer, 4, "ytd_sales"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("notes", System.Data.OleDb.OleDbType.VarChar, 200, "notes"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("pubdate", System.Data.OleDb.OleDbType.DBTimeStamp, 8, "pubdate"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_title_id", System.Data.OleDb.OleDbType.VarChar, 6, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "title_id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_advance", System.Data.OleDb.OleDbType.Currency, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "advance", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_advance1", System.Data.OleDb.OleDbType.Currency, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "advance", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_notes", System.Data.OleDb.OleDbType.VarChar, 200, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "notes", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_notes1", System.Data.OleDb.OleDbType.VarChar, 200, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "notes", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_price", System.Data.OleDb.OleDbType.Currency, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "price", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_price1", System.Data.OleDb.OleDbType.Currency, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "price", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_pub_id", System.Data.OleDb.OleDbType.VarChar, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "pub_id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_pub_id1", System.Data.OleDb.OleDbType.VarChar, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "pub_id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_pubdate", System.Data.OleDb.OleDbType.DBTimeStamp, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "pubdate", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_royalty", System.Data.OleDb.OleDbType.Integer, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "royalty", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_royalty1", System.Data.OleDb.OleDbType.Integer, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "royalty", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_title", System.Data.OleDb.OleDbType.VarChar, 80, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "title", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_type", System.Data.OleDb.OleDbType.VarChar, 12, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "type", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ytd_sales", System.Data.OleDb.OleDbType.Integer, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ytd_sales", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ytd_sales1", System.Data.OleDb.OleDbType.Integer, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ytd_sales", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Select_title_id", System.Data.OleDb.OleDbType.VarChar, 6, "title_id"))
        '
        'OleDbDeleteCommand1
        '
        Me.OleDbDeleteCommand1.CommandText = "DELETE FROM titles WHERE (title_id = ?) AND (advance = ? OR ? IS NULL AND advance" & _
        " IS NULL) AND (notes = ? OR ? IS NULL AND notes IS NULL) AND (price = ? OR ? IS " & _
        "NULL AND price IS NULL) AND (pub_id = ? OR ? IS NULL AND pub_id IS NULL) AND (pu" & _
        "bdate = ?) AND (royalty = ? OR ? IS NULL AND royalty IS NULL) AND (title = ?) AN" & _
        "D (type = ?) AND (ytd_sales = ? OR ? IS NULL AND ytd_sales IS NULL)"
        Me.OleDbDeleteCommand1.Connection = Me.OleDbConnection1
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_title_id", System.Data.OleDb.OleDbType.VarChar, 6, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "title_id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_advance", System.Data.OleDb.OleDbType.Currency, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "advance", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_advance1", System.Data.OleDb.OleDbType.Currency, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "advance", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_notes", System.Data.OleDb.OleDbType.VarChar, 200, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "notes", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_notes1", System.Data.OleDb.OleDbType.VarChar, 200, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "notes", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_price", System.Data.OleDb.OleDbType.Currency, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "price", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_price1", System.Data.OleDb.OleDbType.Currency, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "price", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_pub_id", System.Data.OleDb.OleDbType.VarChar, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "pub_id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_pub_id1", System.Data.OleDb.OleDbType.VarChar, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "pub_id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_pubdate", System.Data.OleDb.OleDbType.DBTimeStamp, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "pubdate", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_royalty", System.Data.OleDb.OleDbType.Integer, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "royalty", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_royalty1", System.Data.OleDb.OleDbType.Integer, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "royalty", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_title", System.Data.OleDb.OleDbType.VarChar, 80, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "title", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_type", System.Data.OleDb.OleDbType.VarChar, 12, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "type", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ytd_sales", System.Data.OleDb.OleDbType.Integer, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ytd_sales", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ytd_sales1", System.Data.OleDb.OleDbType.Integer, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ytd_sales", System.Data.DataRowVersion.Original, Nothing))
        '
        'objtitles1
        '
        Me.objtitles1.DataSetName = "titles1"
        Me.objtitles1.Locale = New System.Globalization.CultureInfo("en-US")
        Me.objtitles1.Namespace = "http://www.tempuri.org/titles1.xsd"
        '
        'OleDbDataAdapter1
        '
        Me.OleDbDataAdapter1.DeleteCommand = Me.OleDbDeleteCommand1
        Me.OleDbDataAdapter1.InsertCommand = Me.OleDbInsertCommand1
        Me.OleDbDataAdapter1.SelectCommand = Me.OleDbSelectCommand1
        Me.OleDbDataAdapter1.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "titles", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("title_id", "title_id"), New System.Data.Common.DataColumnMapping("title", "title"), New System.Data.Common.DataColumnMapping("type", "type"), New System.Data.Common.DataColumnMapping("pub_id", "pub_id"), New System.Data.Common.DataColumnMapping("price", "price"), New System.Data.Common.DataColumnMapping("advance", "advance"), New System.Data.Common.DataColumnMapping("royalty", "royalty"), New System.Data.Common.DataColumnMapping("ytd_sales", "ytd_sales"), New System.Data.Common.DataColumnMapping("notes", "notes"), New System.Data.Common.DataColumnMapping("pubdate", "pubdate")})})
        Me.OleDbDataAdapter1.UpdateCommand = Me.OleDbUpdateCommand1
        '
        'btnLoad
        '
        Me.btnLoad.Location = New System.Drawing.Point(10, 10)
        Me.btnLoad.Name = "btnLoad"
        Me.btnLoad.TabIndex = 0
        Me.btnLoad.Text = "&Load"
        '
        'btnUpdate
        '
        Me.btnUpdate.Location = New System.Drawing.Point(720, 10)
        Me.btnUpdate.Name = "btnUpdate"
        Me.btnUpdate.TabIndex = 1
        Me.btnUpdate.Text = "&Update"
        '
        'btnCancelAll
        '
        Me.btnCancelAll.Location = New System.Drawing.Point(720, 43)
        Me.btnCancelAll.Name = "btnCancelAll"
        Me.btnCancelAll.TabIndex = 2
        Me.btnCancelAll.Text = "Ca&ncel All"
        '
        'grdtitles
        '
        Me.grdtitles.DataMember = "titles"
        Me.grdtitles.DataSource = Me.objtitles1
        Me.grdtitles.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.grdtitles.Location = New System.Drawing.Point(10, 76)
        Me.grdtitles.Name = "grdtitles"
        Me.grdtitles.Size = New System.Drawing.Size(790, 220)
        Me.grdtitles.TabIndex = 3
        '
        'frmTitles1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(808, 301)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.btnLoad, Me.btnUpdate, Me.btnCancelAll, Me.grdtitles})
        Me.Name = "frmTitles1"
        Me.Text = "Titles"
        CType(Me.objtitles1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.grdtitles, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Try
            'Attempt to update the datasource.
            Me.UpdateDataSet()
        Catch eUpdate As System.Exception
            'Add your error handling code here.
            'Display error message, if any.
            System.Windows.Forms.MessageBox.Show(eUpdate.Message)
        End Try

    End Sub
    Private Sub btnLoad_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLoad.Click
        Try
            'Attempt to load the dataset.
            Me.LoadDataSet()
        Catch eLoad As System.Exception
            'Add your error handling code here.
            'Display error message, if any.
            System.Windows.Forms.MessageBox.Show(eLoad.Message)
        End Try

    End Sub
    Private Sub btnCancelAll_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancelAll.Click
        Me.objtitles1.RejectChanges()

    End Sub
    Public Sub UpdateDataSet()
        'Create a new dataset to hold the changes that have been made to the main dataset.
        Dim objDataSetChanges As AppliPubs.titles1 = New AppliPubs.titles1()
        'Stop any current edits.
        Me.BindingContext(objtitles1, "titles").EndCurrentEdit()
        'Get the changes that have been made to the main dataset.
        objDataSetChanges = CType(objtitles1.GetChanges, AppliPubs.titles1)
        'Check to see if any changes have been made.
        If (Not (objDataSetChanges) Is Nothing) Then
            Try
                'There are changes that need to be made, so attempt to update the datasource by
                'calling the update method and passing the dataset and any parameters.
                Me.UpdateDataSource(objDataSetChanges)
                objtitles1.Merge(objDataSetChanges)
                objtitles1.AcceptChanges()
            Catch eUpdate As System.Exception
                'Add your error handling code here.
                Throw eUpdate
            End Try
            'Add your code to check the returned dataset for any errors that may have been
            'pushed into the row object's error.
        End If

    End Sub
    Public Sub LoadDataSet()
        'Create a new dataset to hold the records returned from the call to FillDataSet.
        'A temporary dataset is used because filling the existing dataset would
        'require the databindings to be rebound.
        Dim objDataSetTemp As AppliPubs.titles1
        objDataSetTemp = New AppliPubs.titles1()
        Try
            'Attempt to fill the temporary dataset.
            Me.FillDataSet(objDataSetTemp)
        Catch eFillDataSet As System.Exception
            'Add your error handling code here.
            Throw eFillDataSet
        End Try
        Try
            'Empty the old records from the dataset.
            objtitles1.Clear()
            'Merge the records into the main dataset.
            objtitles1.Merge(objDataSetTemp)
        Catch eLoadMerge As System.Exception
            'Add your error handling code here.
            Throw eLoadMerge
        End Try

    End Sub
    Public Sub UpdateDataSource(ByVal ChangedRows As AppliPubs.titles1)
        Try
            'The data source only needs to be updated if there are changes pending.
            If (Not (ChangedRows) Is Nothing) Then
                'Open the connection.
                Me.OleDbConnection1.Open()
                'Attempt to update the data source.
                OleDbDataAdapter1.Update(ChangedRows)
            End If
        Catch updateException As System.Exception
            'Add your error handling code here.
            Throw updateException
        Finally
            'Close the connection whether or not the exception was thrown.
            Me.OleDbConnection1.Close()
        End Try

    End Sub
    Public Sub FillDataSet(ByVal dataSet As AppliPubs.titles1)
        'Turn off constraint checking before the dataset is filled.
        'This allows the adapters to fill the dataset without concern
        'for dependencies between the tables.
        dataSet.EnforceConstraints = False
        Try
            'Open the connection.
            Me.OleDbConnection1.Open()
            'Attempt to fill the dataset through the OleDbDataAdapter1.
            Me.OleDbDataAdapter1.Fill(dataSet)
        Catch fillException As System.Exception
            'Add your error handling code here.
            Throw fillException
        Finally
            'Turn constraint checking back on.
            dataSet.EnforceConstraints = True
            'Close the connection whether or not the exception was thrown.
            Me.OleDbConnection1.Close()
        End Try

    End Sub
End Class
