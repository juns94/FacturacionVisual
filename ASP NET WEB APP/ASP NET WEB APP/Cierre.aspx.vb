Public Class Cierre
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim temp As String = " -r ""C:\fyi\cierre.rdl"" -p ""fecha=" + Format(Now, "yyyy/MM/dd") + ""
        Process.Start("C:\fyi\RdlReader.exe ", temp)
        Server.Transfer("Factura.aspx", False)

    End Sub

End Class