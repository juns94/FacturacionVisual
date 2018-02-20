Public Class Test
    Inherits System.Web.UI.Page

    Public Enum MessageType
        Success
        [Error]
        Info
        Warning
    End Enum
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Server.Transfer("Factura.aspx")
        If Not Me.IsPostBack Then

        End If
    End Sub
    Protected Sub ShowMessage(Message As String, type As MessageType)
        ScriptManager.RegisterStartupScript(Me, Me.[GetType](), System.Guid.NewGuid().ToString(), "ShowMessage('" & Message & "','" & type.ToString() & "');", True)
    End Sub


End Class