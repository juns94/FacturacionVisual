Imports MySql.Data.MySqlClient

Public Class Detalles
    Inherits System.Web.UI.Page

    Dim total As String
    Dim descuento As String
    Dim factura As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        factura = CType(Session.Item("factura"), String)
        loadTitle()




        Dim adapter As New MySqlDataAdapter()
        Dim ds As New DataSet()
        Dim i As Integer = 0
        Dim sql As String = Nothing
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesigns;persistsecurityinfo=True;password=admin"
        sql = String.Format("select * from detalle where factura ='{0}' ", factura)
        Dim connection As New MySqlConnection(connetionString)
        connection.Open()
        Dim command As New MySqlCommand(sql, connection)
        adapter.SelectCommand = command
        adapter.Fill(ds)
        adapter.Dispose()

        command.Dispose()
        connection.Close()


        sql = String.Format("select total, descuento from factura where  idfactura ='{0}' ", factura)
        Dim reader As MySqlDataReader
        Dim adapterFooter As New MySqlDataAdapter()
        Dim connectionFooter As New MySqlConnection(connetionString)
        connectionFooter.Open()
        Dim commandFooter As New MySqlCommand(sql, connectionFooter)
        reader = commandFooter.ExecuteReader()

        If reader.Read Then

            total = reader.GetString(0)
            descuento = reader.GetString(1)
        End If
        commandFooter.Dispose()
        connectionFooter.Dispose()
        connectionFooter.Open()


        dg.DataSource = ds.Tables(0)
        dg.Columns(3).FooterText = " Descuento"
        dg.Columns(4).FooterText = descuento
        dg.DataBind()


        Dim row As GridViewRow = New GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Normal)
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("Esf")
        dt.Columns.Add("Cil")
        dt.Columns.Add("Eje")
        dt.Columns.Add("ADD")
        dt.Columns.Add("DI")
        dt.Columns.Add("AO")

        sql = String.Format("select * from refraccion where factura ='{0}' ", factura)
        Dim readerReceta As MySqlDataReader
        Dim commandReceta As New MySqlCommand(sql, connectionFooter)
        readerReceta = commandReceta.ExecuteReader()
        Dim dr As DataRow = dt.NewRow()

        If readerReceta.Read Then

            dr("Esf") = fnNumberwithoutzero(readerReceta.GetValue(1).ToString)
            dr("Cil") = fnNumberwithoutzero(readerReceta.GetValue(2).ToString)
            dr("Eje") = fnNumberwithoutzero(readerReceta.GetValue(3).ToString)
            dr("ADD") = readerReceta.GetValue(7).ToString
            dr("DI") = readerReceta.GetValue(8).ToString
            dr("AO") = readerReceta.GetValue(9).ToString
            dt.Rows.Add(dr)
            Dim dr2 As DataRow = dt.NewRow()
            dr2("Esf") = fnNumberwithoutzero(readerReceta.GetValue(4).ToString)
            dr2("Cil") = fnNumberwithoutzero(readerReceta.GetValue(5).ToString)
            dr2("Eje") = fnNumberwithoutzero(readerReceta.GetValue(6).ToString)

            dt.Rows.Add(dr2)

            nombreDoctor.Text = readerReceta.GetValue(10).ToString

        End If





        receta.DataSource = dt
        receta.DataBind()
        connectionFooter.Close()



    End Sub


    Public Function fnNumberwithoutzero(ByRef Value As String)
        fnNumberwithoutzero = 0

        Dim parts() As String = Value.Split("."c)
        If parts.Length = 2 Then
            Dim firsthalf As Object = parts(0)
            Dim secondhalf As Object = parts(1).ToString.TrimEnd("0".ToCharArray)

            If secondhalf = "" Then
                fnNumberwithoutzero = firsthalf
            Else
                fnNumberwithoutzero = firsthalf & "." & secondhalf
            End If
        End If

        Return fnNumberwithoutzero
    End Function


    Public Function loadTitle()

        Dim reader As MySqlDataReader
        Dim ds As New DataSet()
        Dim i As Integer = 0
        Dim sql As String = Nothing
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesigns;persistsecurityinfo=True;password=admin"
        sql = String.Format("select cliente.nombre, cliente.1erapell, cliente.2doapell, factura.fecha, cliente.telefono from factura,cliente where idFactura='{0}' and factura.clienteid = cliente.idcliente ", factura)
        Dim connection As New MySqlConnection(connetionString)
        connection.Open()
        Dim command As New MySqlCommand(sql, connection)
        reader = command.ExecuteReader()

        If reader.Read Then

            nombreFactura.Text = "     #Factura:" + factura + " | " + reader.GetString(0) + " " + reader.GetValue(1).ToString + " " + reader.GetValue(2).ToString + " | " + reader.GetString(3) + "     "
            telefono.Text = reader.GetValue(4).ToString
        End If



        command.Dispose()
        connection.Close()




    End Function


    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs)

        Dim gvr As GridViewRow = e.Row
        If (e.Row.RowType.CompareTo(DataControlRowType.Footer).Equals(0)) Then


            Dim row As GridViewRow = New GridViewRow(0, 0, DataControlRowType.Footer, DataControlRowState.Normal)
            Dim cell As TableCell = New TableCell()
            Dim cell2 As TableCell = New TableCell()
            Dim temp As TableCell = New TableCell()
            Dim temp2 As TableCell = New TableCell()
            Dim temp3 As TableCell = New TableCell()
            cell.Text = "Total"
            cell2.Text = total
            row.Cells.Add(temp)
            row.Cells.Add(temp3)
            row.Cells.Add(temp2)
            row.Cells.Add(cell)
            row.Cells.Add(cell2)

            dg.Controls(0).Controls.Add(row)
        End If






    End Sub


End Class