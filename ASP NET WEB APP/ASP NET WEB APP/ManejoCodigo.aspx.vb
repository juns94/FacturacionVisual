Imports MySql.Data.MySqlClient

Public Class ManejoCodigo
    Inherits System.Web.UI.Page



    Dim currentType As Integer = -1
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        searchCodes()


    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles dropdownproducto.SelectedIndexChanged

        If (dropdownproducto.SelectedValue = "Aro") Then
            currentType = 1
        ElseIf (dropdownproducto.SelectedValue = "Lente") Then
            currentType = 2
        ElseIf (dropdownproducto.SelectedValue = "Contacto") Then
            currentType = 3
        ElseIf (dropdownproducto.SelectedValue = "Otros") Then
            currentType = 0
        ElseIf (dropdownproducto.SelectedValue = "-1") Then
            currentType = -1
        End If
    End Sub



    Protected Function getCurrentType() As Integer

        If (dropdownproducto.SelectedValue = "Aro") Then
            Return 1
        ElseIf (dropdownproducto.SelectedValue = "Lente") Then
            Return 2
        ElseIf (dropdownproducto.SelectedValue = "Contacto") Then
            Return 3
        ElseIf (dropdownproducto.SelectedValue = "Otros") Then
            Return 0
        ElseIf (dropdownproducto.SelectedValue = "-1") Then
            Return -1
        End If
    End Function



    Public Sub searchCodes()
        Dim adapter As New MySqlDataAdapter()
        Dim ds As New DataSet()

        Dim sql As String = Nothing
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;allowuservariables=True;password=admin"

        sql = "select * from codigo where codigo.idcodigo = codigo.idcodigo and codigo.activo = '1' " + getQuery() + " " + getFilter() + ";"
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

    Public Function getFilter() As String
        Dim temp As String = ""
        currentType = getCurrentType()
        If (currentType = -1) Then Return ""
        temp += " and codigo.tipo = '" + currentType.ToString + "' "
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

        If e.CommandName = "Delete" Then

            modalHeader.Text = "Eliminar Codigo"
            modalBody.Text = " Esta seguro que desea eliminar el codigo " + idrecibo + "?"
            modalCode.Text = idrecibo
            ModalPopupExtender1.Show()

        Else

            Session("codigo") = idrecibo
            ' Add code here to add the item to the shopping cart.
            Response.Redirect("DetallesItem.aspx")

        End If
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

End Class