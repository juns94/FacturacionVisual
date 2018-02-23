Imports MySql.Data.MySqlClient

Public Class BusquedaPaciente
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load





    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim temp As Int32
        If txtCedula.Text.Length = 9 AndAlso Int32.TryParse(txtCedula.Text, temp) Then


            Dim adapter As New MySqlDataAdapter()
            Dim ds As New DataSet()
            Dim sql As String = Nothing
            Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
            Dim cedulaQuery As String = txtCedula.Text
            '   sql = "select factura.idfactura,nombre,total from  factura, cliente,refraccion  where cliente.Nombre= 'maria' and refraccion.idFactura = factura.idFactura and factura.clienteId = cliente.idCliente;"

            sql = "select * from refraccion,cliente where  refraccion.cedula = cliente.cedula and  cliente.cedula  = '" + txtCedula.Text + "'  " + getQuery() + ";"
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

        End If


    End Sub

    Public Function getQuery() As String
        Dim temp As String = ""
        If (txtNombre.Text.Length > 0) Then temp += " and cliente.nombre like '%" + txtNombre.Text.Trim + "%' "
        If (txtApellido.Text.Length > 0) Then temp += " and cliente.1erapell like '" + txtApellido.Text.Trim + "%' "
        If (txtApellido2.Text.Length > 0) Then temp += " and cliente.2ndoapell like '" + txtApellido2.Text.Trim + "%' "


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
            Dim idRecibo As String = gvCustomers.DataKeys(e.Row.RowIndex).Value.ToString()
            Dim gvOrders As GridView = TryCast(e.Row.FindControl("gvOrders"), GridView)
            '  gvOrders.DataSource = GetData(String.Format("select * from detalle,factura,recibo where '{0}' = recibo.idrecibo and recibo.idrecibo = detalle.idrecibo ", idRecibo))

            '  gvOrders.DataBind()
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


        Response.Redirect("DetallesExamen.aspx")



    End Sub
    Protected Sub GridView1_RowCommand(ByVal sender As Object,
  ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)



        ' Retrieve the row index stored in the CommandArgument property.
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)

        ' Retrieve the row that contains the button 
        ' from the Rows collection.
        Dim row As GridViewRow = gvCustomers.Rows(index)
        Dim idFactura As String = gvCustomers.DataKeys(row.RowIndex).Value.ToString()
        Session("IdRefraccion") = idFactura
        ' Add code here to add the item to the shopping cart.
        Response.Redirect("DetallesExamen.aspx")


    End Sub


    Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As GridViewEditEventArgs)

        ' Get the country for the row being edited. For this example, the
        ' country is contained in the seventh column (index 6). 
        Dim country As String = gvCustomers.Rows(e.NewEditIndex).Cells(6).Text

        Response.Redirect("About.aspx")

    End Sub



End Class