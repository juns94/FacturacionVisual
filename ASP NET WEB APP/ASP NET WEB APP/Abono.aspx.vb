Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient
Imports System.Data


Public Class Abono
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load





    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim adapter As New MySqlDataAdapter()
        Dim ds As New DataSet()
        Dim i As Integer = 0
        Dim sql As String = Nothing
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;allowuservariables=True;password=admin"
        '   Dim nombreQuery As String = nombre.Text
        '   sql = "select recibo.idrecibo,nombre,total from  recibo, cliente,refraccion  where cliente.Nombre= 'maria' and refraccion.idrecibo = recibo.idrecibo and recibo.clienteId = cliente.idCliente;"

        sql = "select recibo.idrecibo,nombre,cliente.1erapell,cliente.2doapell, fecha from  recibo, cliente  where recibo.cancelado = 0 and recibo.cedula = cliente.cedula " + getQuery() + ";"
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
        If (txtcedula.Text.Length > 0) Then temp += " and cliente.cedula like '%" + txtcedula.Text.Trim + "%' "
        If (txtnombre.Text.Length > 0) Then temp += " and cliente.nombre like '%" + txtnombre.Text.Trim + "%' "
        If (txtapellido1.Text.Length > 0) Then temp += " and cliente.1erapell like '" + txtapellido1.Text.Trim + "%' "
        If (txtapellido2.Text.Length > 0) Then temp += " and cliente.2ndoapell like '" + txtapellido2.Text.Trim + "%' "
        '  If (day.Text.Length > 0) Then temp += " and DAY(recibo.fecha) = '" + day.Text.Trim + "'"
        '   If (month.Text.Length > 0) Then temp += " and MONTH(recibo.fecha) = '" + month.Text.Trim + "'"
        '   If (year.Text.Length > 0) Then temp += " and YEAR(recibo.fecha) = '" + year.Text.Trim + "'"
        'If (recibo.Text.Length > 0) Then temp += " and recibo.idrecibo = '" + recibo.Text + "' "


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
            Dim idrecibo As String = gvCustomers.DataKeys(e.Row.RowIndex).Value.ToString()
            Dim gvOrders As GridView = TryCast(e.Row.FindControl("gvOrders"), GridView)
            gvOrders.DataSource = GetData(String.Format("select * from detalle where idrecibo ='{0}' ", idrecibo))
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
        Dim idrecibo As String = gvCustomers.DataKeys(row.RowIndex).Value.ToString()
        Session("recibo") = idrecibo
        ' Add code here to add the item to the shopping cart.
        Response.Redirect("PagoAbono.aspx")


    End Sub


    Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As GridViewEditEventArgs)

        ' Get the country for the row being edited. For this example, the
        ' country is contained in the seventh column (index 6). 
        Dim country As String = gvCustomers.Rows(e.NewEditIndex).Cells(6).Text

        Response.Redirect("About.aspx")

    End Sub


End Class