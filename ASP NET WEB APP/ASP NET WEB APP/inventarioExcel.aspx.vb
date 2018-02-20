
Imports Microsoft.Office.Interop
Imports MySql.Data.MySqlClient
Imports OfficeOpenXml

Public Class inventarioExcel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load




    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click

        Dim repetidos As String = " "
        If (FileUpload1.HasFile AndAlso IO.Path.GetExtension(FileUpload1.FileName) = ".xlsx") Then
            Using excel = New ExcelPackage(FileUpload1.PostedFile.InputStream)
                Dim tbl = New DataTable()
                Dim ws = excel.Workbook.Worksheets.First()
                Dim hasHeader = True ' change it if required '
                ' create DataColumns '
                For Each firstRowCell In ws.Cells(1, 1, 1, ws.Dimension.End.Column)
                    tbl.Columns.Add(If(hasHeader,
                                   firstRowCell.Text,
                                   String.Format("Column {0}", firstRowCell.Start.Column)))
                Next
                ' add rows to DataTable '
                Dim startRow = If(hasHeader, 2, 1)
                For rowNum = startRow To ws.Dimension.End.Row
                    Dim wsRow = ws.Cells(rowNum, 1, rowNum, ws.Dimension.End.Column)
                    Dim row = tbl.NewRow()
                    For Each cell In wsRow
                        row(cell.Start.Column - 1) = cell.Text
                    Next
                    tbl.Rows.Add(row)



                    If CheckIfExists(row.Item(1).ToString) Then

                        If Not overwrite.Checked Then
                            repetidos += row.Item(1) + " "  ' SI YA EXISTE, PONERLO EN REPETIDOS


                        Else ' SOBRE ESCRIBIR LOS VALORES DEL CODIGO

                            Dim adapter As New MySqlDataAdapter()
                            Dim sql As String = Nothing
                            Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
                            Dim strcommand As String = "update codigo set " +
                                "marca       = '" + (row.Item(2).ToString).Replace("'", "\'") + "'," +
                                "modelo      = '" + (row.Item(3).ToString).Replace("'", "\'") + "'," +
                                "color       = '" + (row.Item(4).ToString).Replace("'", "\'") + "'," +
                                "cantidad    = '" + (row.Item(0).ToString).Replace("'", "\'") + "'," +
                                "precio      = '" + (row.Item(5).ToString).Replace("'", "\'") + "'," +
                                "descripcion = '" + (row.Item(6).ToString).Replace("'", "\'") + "'," +
                                "tipo        = '" + row.Item(7).ToString.Replace("'", "\'") + "'," +
                                "impuesto    ='" + (row.Item(8).ToString).Replace("'", "\'") + "'," +
                                "activo = '1' where idcodigo = '" + row.Item(1).ToString + "'"
                            Dim connection As New MySqlConnection(connectionString)
                            connection.Open()
                            Dim command As New MySqlCommand(strcommand, connection)
                            If command.ExecuteNonQuery() > 0 Then



                            End If
                            command.Dispose()
                            connection.Close()

                        End If
                    Else

                            Dim adapter As New MySqlDataAdapter()
                        Dim sql As String = Nothing
                        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
                        Dim strcommand As String = "insert into codigo values ('" + row.Item(1).ToString + "'," +
                            "'" + (row.Item(2).ToString).Replace("'", "\'") + "'," +
                            "'" + (row.Item(3).ToString).Replace("'", "\'") + "'," +
                            "'" + (row.Item(4).ToString).Replace("'", "\'") + "'," +
                            "'" + (row.Item(0).ToString).Replace("'", "\'") + "'," +
                            "'" + (row.Item(5).ToString).Replace("'", "\'") + "'," +
                            "'" + (row.Item(6).ToString).Replace("'", "\'") + "'," +
                            "'" + row.Item(7).ToString.Replace("'", "\'") + "'," +
                            "'" + (row.Item(8).ToString).Replace("'", "\'") + "'," +
                            "'1'" +
                           ")"
                        Dim connection As New MySqlConnection(connectionString)
                        connection.Open()
                        Dim command As New MySqlCommand(strcommand, connection)
                        If command.ExecuteNonQuery() > 0 Then



                        End If
                        command.Dispose()
                        connection.Close()
                    End If



                Next
                Dim msg = String.Format("DataTable successfully created from excel-file Colum-count:{0} Row-count:{1}",
                                    tbl.Columns.Count, tbl.Rows.Count)
                If repetidos.Length > 1 Then
                    msg += ". Los siguientes codigos ya existen en la base de datos y no fueron agregados." + repetidos
                End If
                UploadStatusLabel.Text = msg
            End Using
        Else
            UploadStatusLabel.Text = "You did not specify an excel-file to upload."
        End If
    End Sub


    Public Function CheckIfExists(ByVal codigo As String) As Boolean
        Dim value As Boolean = False
        Dim adapter As New MySqlDataAdapter()
        Dim reader As MySqlDataReader
        Dim sql As String = Nothing
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        Dim strcommand As String = "select idCodigo from codigo where idcodigo = '" + codigo + "'"
        Dim connection As New MySqlConnection(connectionString)
        connection.Open()
        Dim command As New MySqlCommand(strcommand, connection)
        reader = command.ExecuteReader()
        If reader.Read Then
            value = True
        End If
        connection.Close()
        reader.Dispose()
        command.Dispose()
        Return value

    End Function

    Private Sub releaseObject(ByVal obj As Object)
        Try
            System.Runtime.InteropServices.Marshal.ReleaseComObject(obj)
            obj = Nothing
        Catch ex As Exception
            obj = Nothing
        Finally
            GC.Collect()
        End Try
    End Sub

End Class