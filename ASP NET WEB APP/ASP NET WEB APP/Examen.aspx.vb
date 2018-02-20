Imports MySql.Data.MySqlClient

Public Class Examen
    Inherits System.Web.UI.Page

    Public Enum MessageType
        Success
        [Error]
        Info
        Warning
    End Enum

    Dim clientType As Integer = 0
    Dim currentCedula As String = ""

    Protected Sub ShowMessage(Message As String, type As MessageType)
        ScriptManager.RegisterStartupScript(Me, Me.[GetType](), System.Guid.NewGuid().ToString(), "ShowMessage('" & Message & "','" & type.ToString() & "');", True)
    End Sub


    Public Sub sendAlert(index As Integer)


        Select Case index
            Case 1
                ShowMessage("<strong>Cliente existente en el registro.</strong>", MessageType.Success)
            Case 2
                ShowMessage("<strong>Cliente Nuevo!</strong> Favor ingresar datos de telefono en las casillas.</div>", MessageType.Info)
            Case 3
                ShowMessage("<strong>Cedula no encontrada en el padron </strong>  Favor ingresar todos los datos del cliente manualmente.", MessageType.Error)
        End Select

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not Me.IsPostBack Then
            ' ModalPopupExtender1.Show()
            populateDoctor()
        End If






    End Sub

    Protected Sub txtcedula_TextChanged(sender As Object, e As EventArgs) Handles txtcedula.TextChanged


        txtnombre.Text = ""
        txtapellido1.Text = ""
        txtapellido2.Text = ""
        txtphone.Text = ""
        txtphone2.Text = ""

        Dim notInDatabase As Boolean = False

        If (txtcedula.Text.Length = 9) Then

            currentCedula = txtcedula.Text
            Dim adapter As New MySqlDataAdapter()
            Dim reader As MySqlDataReader
            Dim i As Integer = 0
            Dim sql As String = Nothing
            Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"

            sql = String.Format("select * from cliente where cedula ='{0}' ", currentCedula)
            Dim connection As New MySqlConnection(connectionString)
            connection.Open()
            Dim command As New MySqlCommand(sql, connection)
            reader = command.ExecuteReader()
            If reader.Read Then

                txtcedula.Text = reader.GetValue(0).ToString
                txtnombre.Text = reader.GetValue(1).ToString
                txtapellido1.Text = reader.GetValue(2).ToString
                txtapellido2.Text = reader.GetValue(3).ToString
                txtphone.Text = reader.GetValue(4).ToString
                txtphone2.Text = reader.GetValue(5).ToString
                command.Dispose()
                connection.Close()
                sendAlert(1)
                clientType = 1
            Else

                notInDatabase = True
                command.Dispose()
                connection.Close()
            End If







            If notInDatabase Then

                Dim adapterPadron As New MySqlDataAdapter()
                Dim readerPadron As MySqlDataReader
                Dim sqlPadron As String = Nothing
                sql = String.Format("select * from padron where cedula ='{0}' ", currentCedula)
                Dim connectionPadron As New MySqlConnection(connectionString)
                connectionPadron.Open()
                Dim commandPadron As New MySqlCommand(sql, connectionPadron)
                readerPadron = commandPadron.ExecuteReader()
                If readerPadron.Read Then
                    clientType = 2
                    sendAlert(2)
                    txtcedula.Text = readerPadron.GetValue(0).ToString
                    txtnombre.Text = readerPadron.GetValue(1).ToString
                    txtapellido1.Text = readerPadron.GetValue(2).ToString
                    txtapellido2.Text = readerPadron.GetValue(3).ToString



                Else
                    sendAlert(3)
                    clientType = 3

                End If



            End If






        End If

    End Sub


    Public Function ToMySql(d As Date) As String
        Return d.ToString("yyyy-MM-dd HH:mm:ss")
    End Function


    '       " STR_TO_DATE('" + DateTime.Now.ToString + "','%m-%d-%Y %H:%i:%s') , " +

    Public Sub insertFormula()


        Dim adapter As New MySqlDataAdapter()
        Dim i As Integer = 0
        Dim sql As String = Nothing
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"

        Dim strcommand As String = "insert ignore into refraccion values (NULL, " +
                ATT(txtcedula.Text) +
                "'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "'," +
                ATT(ODEsfera.Text) +
                ATT(ODCilindro.Text) +
                ATT(ODEjeCil.Text) +
                ATT(ODAdicion.Text) +
                ATT(ODPrisma.Text) +
                ATT(ODEjePrisma.Text) +
                ATT(ODDNP.Text) +
                ATT(ODAltura.Text) +
                ATT(ODAV.Text) + ' OJO DERECHO 
                ATT(OIEsfera.Text) +
                ATT(OICilindro.Text) +
                ATT(OIEjeCil.Text) +
                ATT(OIAdicion.Text) +
                ATT(OIPrisma.Text) +
                ATT(OIEjePrisma.Text) +
                ATT(OIDNP.Text) +
                ATT(OIAltura.Text) +
                ATT(OIAV.Text) + ' OJO IZQ
                 ATT(CODEsfera.Text) +
                ATT(CODCilindro.Text) +
                ATT(CODEjeCil.Text) +
                ATT(CODAdicion.Text) +
                ATT(CODPrisma.Text) +   'Contacto DER
                 ATT(COIEsfera.Text) +
                ATT(COICilindro.Text) +
                ATT(COIEjeCil.Text) +
                ATT(COIAdicion.Text) +
                ATT(COIPrisma.Text) + ' contacto izq
               " '" + dropDownDoctor.SelectedValue.ToString + "' )"

        Dim connection As New MySqlConnection(connectionString)
        connection.Open()
        Dim command As New MySqlCommand(strcommand, connection)
        Dim result As Integer = command.ExecuteNonQuery()

        If result > 0 Then



            If clientType = 2 Or clientType = 3 Then


            Else
                ModalPopupExtender1.Show()


            End If

        Else


        End If
        connection.Close()



    End Sub


    Protected Sub resetForm(sender As Object, e As EventArgs) Handles btnHide.Click



        txtnombre.Text = ""
        txtapellido1.Text = ""
        txtapellido2.Text = ""
        txtphone.Text = ""
        txtphone2.Text = ""
        Response.Redirect("http://localhost:56171/Factura")
        ' Server.Transfer("Examen.aspx", True)


    End Sub


    Public Sub insertClient()
        Dim newClient As Boolean = True

        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        Dim adapterPadron As New MySqlDataAdapter()
            Dim readerPadron As MySqlDataReader
            Dim sqlPadron As String = Nothing
        Dim sql As String = String.Format("select * from cliente where cedula ='{0}' ", txtcedula.Text.Trim)
        Dim connectionPadron As New MySqlConnection(connectionString)
            connectionPadron.Open()
            Dim commandPadron As New MySqlCommand(sql, connectionPadron)
            readerPadron = commandPadron.ExecuteReader()
        If readerPadron.Read Then
            newClient = False
        End If
        connectionPadron.Close()




        If newClient Then


            Dim adapter As New MySqlDataAdapter()
            Dim reader As MySqlDataReader
            Dim i As Integer = 0

            Dim strcommand As String = "insert into cliente   values (" +
                    ATT(txtcedula.Text) +
                    ATT(txtnombre.Text) +
                    ATT(txtapellido1.Text) +
                    ATT(txtapellido2.Text) +
                    ATT(txtphone.Text) +
                   "'" + txtphone2.Text + "') "


            Dim connection As New MySqlConnection(connectionString)
            connection.Open()
            Dim command As New MySqlCommand(strcommand, connection)
            Dim result As Integer = command.ExecuteNonQuery()

            If result > 0 Then

            Else


            End If
            connection.Close()



        End If

    End Sub


    Function ATT(word As String) As String

        Dim temp As String = "'" + word.Replace("+", "") + "', "
        Return temp

    End Function



    Public Sub finalizeExam()


        insertClient()
        insertFormula()


    End Sub

    Protected Sub finalizeExam(sender As Object, e As EventArgs) Handles btnRandom.Click

        insertClient()
        insertFormula()
    End Sub


    Public Sub populateDoctor()

        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        Dim strcommandId As String = "select * from doctor"
        Dim connectionId As New MySqlConnection(connectionString)
        connectionId.Open()
        Dim commandId As New MySqlCommand(strcommandId, connectionId)
        Dim result As Integer = commandId.ExecuteNonQuery()
        Dim reader As MySqlDataReader
        reader = commandId.ExecuteReader()

        If reader.Read Then
            dropDownDoctor.Items.Add(New ListItem(reader.GetValue(1).ToString, reader.GetValue(1).ToString))
        End If
        connectionId.Close()




    End Sub


End Class