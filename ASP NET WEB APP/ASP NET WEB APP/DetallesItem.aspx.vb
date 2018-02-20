Imports MySql.Data.MySqlClient

Public Class DetallesItem
    Inherits System.Web.UI.Page


    Dim Codigo As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Codigo = CType(Session.Item("codigo"), String)
        If Not IsPostBack Then


            Dim sql As String = Nothing
            Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
            sql = String.Format("select * from codigo where '{0}' = codigo.idcodigo ", Codigo)
            Dim connection As New MySqlConnection(connetionString)
            connection.Open()
            Dim command As New MySqlCommand(sql, connection)
            Dim reader As MySqlDataReader
            reader = command.ExecuteReader


            While reader.Read
                txtCodigo.Text = reader.GetValue(0).ToString
                txtMarca.Text = reader.GetValue(1).ToString
                txtModelo.Text = reader.GetValue(2).ToString
                txtColor.Text = reader.GetValue(3).ToString
                txtCantidad.Text = reader.GetValue(4).ToString
                txtPrecio.Text = reader.GetValue(5).ToString
                txtDescripcion.Text = reader.GetValue(6).ToString
                Dim tipo As String = reader.GetValue(7).ToString


                If (tipo = "1") Then
                    txtTipo.Text = "Aro"
                ElseIf (tipo = "2") Then
                    txtTipo.Text = "Lente Oftalmico"
                ElseIf (tipo = "3") Then
                    txtTipo.Text = "Lente de Contacto"
                End If


                txtImpuesto.Text = reader.GetValue(8).ToString

                If reader.GetInt32(9) = 1 Then
                    activo.Checked = True
                Else
                    activo.Checked = False
                End If

            End While
            command.Dispose()
            connection.Close()

        End If


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click


        Dim sql As String = Nothing
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        sql = "update codigo set cantidad = '" + txtCantidad.Text + "' , marca = '" + txtMarca.Text + "' ,modelo = '" + txtModelo.Text + "' , color  = '" + txtColor.Text + "' , precio = '" + txtPrecio.Text + "' , descripcion = '" + txtDescripcion.Text + "' , impuesto = '" + txtImpuesto.Text + "' , activo = '" + getActivo() + "' where '" + Codigo + "' = codigo.idcodigo;"
        Dim connection As New MySqlConnection(connetionString)
        connection.Open()
        Dim command As New MySqlCommand(sql, connection)
        command.ExecuteReader()
        command.Dispose()
        connection.Close()



        Response.Redirect("DetallesItem.aspx")
    End Sub

    Public Function getActivo() As String
        If activo.Checked Then
            Return "1"
        End If
        Return "0"
    End Function

End Class