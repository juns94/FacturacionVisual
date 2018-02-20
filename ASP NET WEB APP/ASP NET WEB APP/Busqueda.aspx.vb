Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient
Imports System.Data

Public Class Busqueda
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load





    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim adapter As New MySqlDataAdapter()
        Dim ds As New DataSet()
        Dim i As Integer = 0
        Dim sql As String = Nothing
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        Dim nombreQuery As String = nombre.Text
        '   sql = "select factura.idfactura,nombre,total from  factura, cliente,refraccion  where cliente.Nombre= 'maria' and refraccion.idFactura = factura.idFactura and factura.clienteId = cliente.idCliente;"

        sql = "select factura.idfactura,nombre,cliente.1erapell,cliente.2doapell, factura.fecha from  factura,recibo,cliente  where    factura.idfactura = recibo.idfactura and cliente.cedula = recibo.cedula " + getQuery() + ";"
        Dim connection As New MySqlConnection(connetionString)
        connection.Open()
        Dim command As New MySqlCommand(sql, connection)
        adapter.SelectCommand = command
        adapter.Fill(ds)
        adapter.Dispose()
        command.Dispose()
        connection.Close()
        gvCustomers.DataSource = ds.Tables(0)
        gvCustomers.DataBind()




    End Sub

    Public Function getQuery() As String
        Dim temp As String = ""
        If (nombre.Text.Length > 0) Then temp += " and cliente.nombre like '%" + nombre.Text.Trim + "%' "
        If (apellido1.Text.Length > 0) Then temp += " and cliente.1erapell like '" + apellido1.Text.Trim + "%' "
        If (apellido2.Text.Length > 0) Then temp += " and cliente.2ndoapell like '" + apellido2.Text.Trim + "%' "
        If (day.Text.Length > 0) Then temp += " and DAY(factura.fecha) = '" + day.Text.Trim + "'"
        If (month.Text.Length > 0) Then temp += " and MONTH(factura.fecha) = '" + month.Text.Trim + "'"
        If (year.Text.Length > 0) Then temp += " and YEAR(factura.fecha) = '" + year.Text.Trim + "'"
        If (factura.Text.Length > 0) Then temp += " and factura.idfactura = '" + factura.Text + "' "


        Return temp
    End Function


    Public Function GetData() As DataTable

    End Function


    Public Overloads Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        ' Verifies that the control is rendered
    End Sub



    Protected Sub OnRowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' Dim customerId As String = gvCustomers.DataKeys(e.Row.RowIndex).Value.ToString()
            Dim idFactura As String = gvCustomers.DataKeys(e.Row.RowIndex).Value.ToString()
            Dim gvOrders As GridView = TryCast(e.Row.FindControl("gvOrders"), GridView)
            gvOrders.DataSource = GetData(String.Format("select * from detalle,recibo where '{0}' = recibo.idfactura and recibo.idrecibo = detalle.idrecibo ", idFactura))

            gvOrders.DataBind()
        End If
    End Sub




    Private Shared Function GetData(query As String) As DataTable
        Dim strConnString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"




        Using con As New MySqlConnection(strConnString)
            Using cmd As New MySqlCommand()
                cmd.CommandText = query
                Using sda As New MySqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        Dim dt As New DataTable()
                        sda.Fill(dt)
                        Return dt
                    End Using
                End Using
            End Using
        End Using
    End Function


    Protected Sub Redirect1_Click(ByVal sender As Object, ByVal e As System.EventArgs)


        Response.Redirect("about.aspx")



    End Sub
    Protected Sub GridView1_RowCommand(ByVal sender As Object,
  ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)



        ' Retrieve the row index stored in the CommandArgument property.
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)

        ' Retrieve the row that contains the button 
        ' from the Rows collection.
        Dim row As GridViewRow = gvCustomers.Rows(index)
        Dim idFactura As String = gvCustomers.DataKeys(row.RowIndex).Value.ToString()
        Session("factura") = idFactura
        ' Add code here to add the item to the shopping cart.
        Response.Redirect("DetallesFactura.aspx")


    End Sub


    Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As GridViewEditEventArgs)

        ' Get the country for the row being edited. For this example, the
        ' country is contained in the seventh column (index 6). 
        Dim country As String = gvCustomers.Rows(e.NewEditIndex).Cells(6).Text

        Response.Redirect("About.aspx")

    End Sub




End Class