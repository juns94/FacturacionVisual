Imports MySql.Data.MySqlClient

Public Class Codigo
    Inherits System.Web.UI.Page
    Dim currentType As Integer = 0


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles dropdownproducto.SelectedIndexChanged
        If (dropdownproducto.SelectedValue = "Aro") Then
            currentType = 1
        ElseIf (dropdownproducto.SelectedValue = "Lente") Then
            currentType = 2
        ElseIf (dropdownproducto.SelectedValue = "Contacto") Then
            currentType = 3
        End If
    End Sub

    Protected Sub addCode(sender As Object, e As EventArgs) Handles btnAddCode.Click

        If Not (dropdownproducto.SelectedValue = "Seleccionar Producto") Then

            Dim adapter As New MySqlDataAdapter()
            Dim sql As String = Nothing
            Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
            Dim strcommand As String = "insert into codigo values ('" + txtCodigo.Text + "'," +
                "'" + (txtMarca.Text) + "'," +
                "'" + (txtModelo.Text) + "'," +
                "'" + (txtColor.Text) + "'," +
                "'" + (txtCantidad.Text) + "'," +
                "'" + (txtPrecio.Text) + "'," +
                "'" + (txtDescripcion.Text) + "'," +
                "'" + currentType.ToString + "'," +
                "'" + (txtImpuesto.Text) + "'," +
                "'1'" +
               ")"
            Dim connection As New MySqlConnection(connectionString)
            connection.Open()
            Dim command As New MySqlCommand(strcommand, connection)
            If command.ExecuteNonQuery() > 0 Then

                Server.Transfer("Codigo.aspx", False)

            End If
            command.Dispose()
            connection.Close()

        End If

    End Sub



End Class