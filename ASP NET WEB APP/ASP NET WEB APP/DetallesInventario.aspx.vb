Imports MySql.Data.MySqlClient

Public Class DetallesInventario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        searchCodes()


    End Sub



    Public Sub searchCodes()
        Dim adapter As New MySqlDataAdapter()
        Dim ds As New DataSet()

        Dim sql As String = Nothing
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;allowuservariables=True;password=admin"

        sql = "select * from codigo where codigo.idcodigo = codigo.idcodigo and codigo.activo = '" + getBool(mostrarEliminados.Checked) + "' " + getQuery() + ";"
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
        If (txtCodigo.Text.Length > 0) Then temp += " and codigo.idcodigo like '%" + txtCodigo.Text.Trim + "%' "
        If (txtMarca.Text.Length > 0) Then temp += " and codigo.marca like '%" + txtMarca.Text.Trim + "%' "
        If (txtColor.Text.Length > 0) Then temp += " and codigo.color like '" + txtColor.Text.Trim + "%' "
        If (txtModelo.Text.Length > 0) Then temp += " and codigo.modelo like '" + txtModelo.Text.Trim + "%' "

        Return temp
    End Function

    Protected Sub GridView1_RowCommand(ByVal sender As Object,
  ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        ' Retrieve the row index stored in the CommandArgument property.
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)

        ' Retrieve the row that contains the button 
        ' from the Rows collection.
        Dim row As GridViewRow = gvCustomers.Rows(index)
        Dim idrecibo As String = gvCustomers.DataKeys(row.RowIndex).Value.ToString()



        Select Case e.CommandName
            Case "Delete"
                modalHeader.Text = "Eliminar Codigo"
                modalBody.Text = " Esta seguro que desea eliminar el codigo " + idrecibo + "?"
                modalCode.Text = idrecibo
                ModalPopupExtender1.Show()
            Case "Editar"
                modalEditHeader.Text = "Editar Cantidad"
                modalEditBody.Text = "Digite la nueva cantidad en inventario del producto."
                modalCode0.Text = idrecibo
                ModalPopupExtender2.Show()
            Case "Detalles"
                Session("codigo") = idrecibo
                ' Add code here to add the item to the shopping cart.
                Response.Redirect("DetallesItem.aspx")
            Case Else

        End Select


    End Sub


    Protected Sub OnRowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' Dim customerId As String = gvCustomers.DataKeys(e.Row.RowIndex).Value.ToString()
            '  Dim idrecibo As String = gvCustomers.DataKeys(e.Row.RowIndex).Value.ToString()
            ' Dim gvOrders As GridView = TryCast(e.Row.FindControl("gvOrders"), GridView)
            '    gvOrders.DataSource = GetData(String.Format("select * from detalle where idrecibo ='{0}' ", idrecibo))
            '    gvOrders.DataBind()
        End If
    End Sub



    Protected Sub Gridview1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)



    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

         ModalPopupExtender1.Hide()

        Dim adapter As New MySqlDataAdapter()
        Dim sql As String = Nothing
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        Dim strcommand As String = "update codigo set activo = '0' where codigo.idCodigo = '" + modalCode.Text + "'"
        Dim connection As New MySqlConnection(connectionString)
        connection.Open()
        Dim command As New MySqlCommand(strcommand, connection)
        command.ExecuteNonQuery()
        command.Dispose()
        connection.Close()
        command.Dispose()
        searchCodes()

    End Sub

    Protected Sub btnAcceptEdit_Click(sender As Object, e As EventArgs) Handles btnAcceptEdit.Click
        ModalPopupExtender2.Hide()

        Dim adapter As New MySqlDataAdapter()
        Dim sql As String = Nothing
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        Dim strcommand As String = "update codigo set cantidad = '" + txtCantidad.Text + "' where codigo.idCodigo = '" + modalCode0.Text + "'"
        Dim connection As New MySqlConnection(connectionString)
        connection.Open()
        Dim command As New MySqlCommand(strcommand, connection)
        command.ExecuteNonQuery()
        command.Dispose()
        connection.Close()
        command.Dispose()
        modalCode0.Text = ""
        searchCodes()
    End Sub


    Public Function getBool(ByRef flag As Boolean) As String

        If flag Then
            Return "0"

        Else
            Return "1"
        End If

    End Function
End Class