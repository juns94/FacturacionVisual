Imports MySql.Data.MySqlClient


Public Class DetallesFactura
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
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        sql = String.Format("select * from detalle,recibo where '{0}' = recibo.idfactura and recibo.idrecibo = detalle.idrecibo ", factura)
        Dim connection As New MySqlConnection(connetionString)
        connection.Open()
        Dim command As New MySqlCommand(sql, connection)
        adapter.SelectCommand = command
        adapter.Fill(ds)
        adapter.Dispose()
        command.Dispose()
        connection.Close()


        sql = String.Format("select totalfactura,sum(detalle.costo)-totalfactura from recibo,detalle where recibo.idfactura = {0} and recibo.idRecibo = detalle.idRecibo", factura)
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
        dt.Columns.Add("Prisma")
        dt.Columns.Add("EjePrisma")
        dt.Columns.Add("Dnp")
        dt.Columns.Add("Altura")
        dt.Columns.Add("AV")
        sql = String.Format("select * from refraccionfactura,recibo  where refraccionfactura.idrecibo = recibo.idrecibo and recibo.idfactura ='{0}' ", factura)
        Dim readerReceta As MySqlDataReader
        Dim commandReceta As New MySqlCommand(sql, connectionFooter)
        readerReceta = commandReceta.ExecuteReader()
        Dim dr As DataRow = dt.NewRow()



        If readerReceta.Read Then

            dr("Esf") = (readerReceta.GetValue(3).ToString)
            dr("Cil") = (readerReceta.GetValue(4).ToString)
            dr("Eje") = (readerReceta.GetValue(5).ToString)
            dr("ADD") = readerReceta.GetValue(6).ToString
            dr("Prisma") = readerReceta.GetValue(7).ToString
            dr("EjePrisma") = readerReceta.GetValue(8).ToString
            dr("Dnp") = readerReceta.GetValue(9).ToString
            dr("Altura") = readerReceta.GetValue(10).ToString
            dr("AV") = readerReceta.GetValue(11).ToString
            dt.Rows.Add(dr)
            Dim dr2 As DataRow = dt.NewRow()
            dr2("Esf") = (readerReceta.GetValue(12).ToString)
            dr2("Cil") = (readerReceta.GetValue(13).ToString)
            dr2("Eje") = (readerReceta.GetValue(14).ToString)
            dr2("ADD") = readerReceta.GetValue(15).ToString
            dr2("Prisma") = readerReceta.GetValue(16).ToString
            dr2("EjePrisma") = readerReceta.GetValue(17).ToString
            dr2("Dnp") = readerReceta.GetValue(18).ToString
            dr2("Altura") = readerReceta.GetValue(19).ToString
            dr2("AV") = readerReceta.GetValue(20).ToString
            dt.Rows.Add(dr2)

            nombreDoctor.Text = readerReceta.GetValue(31).ToString

        End If





        receta.DataSource = dt
        receta.DataBind()
        connectionFooter.Close()



        loadContact()


    End Sub


    Public Sub loadContact()
        Dim dt2 As New DataTable
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        Dim adapterFooter As New MySqlDataAdapter()
        Dim connectionFooter As New MySqlConnection(connetionString)
        Dim row As GridViewRow = New GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Normal)

        dt2.Columns.Add("Esf")
        dt2.Columns.Add("Cil")
        dt2.Columns.Add("Eje")
        dt2.Columns.Add("ADD")
        dt2.Columns.Add("Prisma")

        connectionFooter.Open()
        Dim Sql As String = String.Format("select * from refraccionfactura,recibo  where refraccionfactura.idrecibo = recibo.idrecibo and recibo.idfactura ='{0}' ", factura)
        Dim readerReceta As MySqlDataReader
        Dim commandReceta As New MySqlCommand(Sql, connectionFooter)
        readerReceta = commandReceta.ExecuteReader()
        Dim dr As DataRow = dt2.NewRow()

        If readerReceta.Read Then

            dr("Esf") = (readerReceta.GetValue(21).ToString)
            dr("Cil") = (readerReceta.GetValue(22).ToString)
            dr("Eje") = (readerReceta.GetValue(23).ToString)
            dr("ADD") = readerReceta.GetValue(24).ToString
            dr("Prisma") = readerReceta.GetValue(25).ToString

            dt2.Rows.Add(dr)
            Dim dr2 As DataRow = dt2.NewRow()
            dr2("Esf") = (readerReceta.GetValue(26).ToString)
            dr2("Cil") = (readerReceta.GetValue(27).ToString)
            dr2("Eje") = (readerReceta.GetValue(28).ToString)
            dr2("ADD") = readerReceta.GetValue(29).ToString
            dr2("Prisma") = readerReceta.GetValue(30).ToString

            dt2.Rows.Add(dr2)

            nombreDoctor.Text = readerReceta.GetValue(31).ToString

        End If





        contacto.DataSource = dt2
        contacto.DataBind()
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
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        sql = String.Format("select cliente.nombre, cliente.1erapell, cliente.2doapell, factura.fecha, cliente.telefono from factura,recibo,cliente where factura.idfactura = recibo.idfactura and recibo.idFactura='{0}' and recibo.cedula = cliente.cedula", factura)
        'sql = ("select cliente.nombre, cliente.1erapell, cliente.2doapell, factura.fecha, cliente.telefono from factura,recibo,cliente where factura.idfactura = recibo.idfactura and recibo.idFactura = '1' and recibo.cedula = cliente.cedula")

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




    Protected Sub printBill(sender As Object, e As EventArgs) Handles btnPrint.Click

        Dim lastID As String
        Dim adapterId As New MySqlDataAdapter()
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        Dim strcommandId As String = "select idrecibo from recibo where idfactura = " + factura + ""
        Dim connectionId As New MySqlConnection(connectionString)
        connectionId.Open()
        Dim commandId As New MySqlCommand(strcommandId, connectionId)
        Dim result As Integer = commandId.ExecuteNonQuery()
        Dim reader As MySqlDataReader
        reader = commandId.ExecuteReader()
        If reader.Read Then
            lastID = reader.GetValue(0).ToString
        End If
        connectionId.Close()



        Dim temp As String = " -r ""C:\fyi\factura.rdl"" -p ""newIdRecibo=" + lastID + "&newIdFactura=" + factura + """"
        System.Diagnostics.Process.Start("C:\fyi\RdlReader.exe", temp)






    End Sub





End Class