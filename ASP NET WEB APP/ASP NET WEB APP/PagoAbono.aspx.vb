Imports MySql.Data.MySqlClient

Public Class PagoAbono
    Inherits System.Web.UI.Page
    Dim currentReciboId As String = ""

    Dim currentPaid As Decimal
    Dim orderTotal As Decimal
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load




        currentReciboId = CType(Session.Item("recibo"), String)
            currentReciboId = "1"
            loadCliente()
            GridView1.AutoGenerateColumns = False
            Dim ds As New DataSet()

            Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
            Dim cmdText As String = "select cantidad, codigo, costo, descuento, detalle.descripcion from  detalle, recibo where  recibo.idrecibo = detalle.idrecibo and '" + currentReciboId + "' = recibo.idrecibo;"
            Dim connection As New MySqlConnection(connectionString)
            connection.Open()
            Dim command As New MySqlCommand(cmdText, connection)
            Dim adapter As New MySqlDataAdapter
            adapter.SelectCommand = command
            adapter.Fill(ds)
            adapter.Dispose()
            command.Dispose()
            connection.Close()
            GridView1.DataSource = ds.Tables(0)
            GridView1.DataBind()
            getPaid()
            getRemaining()




    End Sub

    Function CheckPaid() As Integer

        If ((Double.Parse(txtTotal.Text) - Double.Parse(txtAbono.Text)) = 0) Then
            Return 1
        Else
            Return 0
        End If
    End Function

    Function CheckTarjeta() As Integer

        If checkBoxTarjeta.Checked Then
            Return 1

        End If

        Return 0
    End Function




    Public Sub FinishBill()

        If txtAbono.Text.Length > 0 Then


            insertAbono

            If CheckPaid() Then


                insertFactura
                ModalPopupExtender2.Show()

            Else

                ModalPopupExtender1.Show()

            End If


        End If
    End Sub



    Public Sub getPaid()
        Dim cmdText As String = Nothing
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        cmdText = String.Format("select montoAbonado from abono where abono.idrecibo = '{0}' ", Me.currentReciboId)
        Dim connection As New MySqlConnection(connectionString)
        connection.Open()
        Dim command As New MySqlCommand(cmdText, connection)
        Dim reader As MySqlDataReader = command.ExecuteReader
        Do While reader.Read

            currentPaid += reader.GetDecimal(0)
        Loop
        reader.Close()
        command.Dispose()
        connection.Close()



    End Sub





    Public Sub loadCliente()

        Dim sql As String = Nothing
        Dim reader As MySqlDataReader
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        sql = String.Format("select * from cliente,recibo where '{0}' = recibo.idrecibo and recibo.cedula = cliente.cedula", currentReciboId)
        Dim connection As New MySqlConnection(connetionString)
        connection.Open()
        Dim command As New MySqlCommand(sql, connection)
        reader = command.ExecuteReader
        If reader.Read Then
            txtcedula.Text = reader.GetValue(0).ToString
            txtnombre.Text = reader.GetValue(1).ToString
            txtapellido1.Text = reader.GetValue(2).ToString
            txtapellido2.Text = reader.GetValue(3).ToString
            txtphone.Text = reader.GetValue(4).ToString
            txtphone2.Text = reader.GetValue(5).ToString


        End If
        connection.Close()
        reader.Dispose()
        command.Dispose()




    End Sub

    Public Sub getRemaining()
        Dim cmdText As String = Nothing
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        cmdText = String.Format("select totalfactura from recibo where recibo.idrecibo = '{0}' ", Me.currentReciboId)
        Dim connection As New MySqlConnection(connectionString)
        connection.Open()
        Dim command1 As New MySqlCommand(cmdText, connection)
        Dim reader As MySqlDataReader = command1.ExecuteReader
        If reader.Read Then
            Me.txtTotal.Text = Decimal.Subtract(reader.GetDecimal(0), Me.currentPaid).ToString
            Me.txtRestante.Text = Decimal.Subtract(reader.GetDecimal(0), Me.currentPaid).ToString
            Me.labelOriginalPrice.Text = reader.GetValue(0).ToString
            Me.orderTotal = reader.GetDecimal(0)
            reader.Close()
        End If
        command1.Dispose()
        connection.Close()


    End Sub

    Public Sub insertAbono()
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        Dim textArray1 As String() = New String() {"insert ignore into abono values (NULL,'", Me.currentReciboId, "','", Me.txtAbono.Text, "','", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), "','", Me.CheckTarjeta.ToString, "')"}
        Dim cmdText As String = String.Concat(textArray1)
        Dim connection As New MySqlConnection(connectionString)
        connection.Open()
        Dim command As New MySqlCommand(cmdText, connection)
        command.ExecuteNonQuery()
        connection.Close()
        command.Dispose()


    End Sub


    Public Sub insertFactura()


        Dim sql As String = Nothing
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        sql = "insert ignore into factura values (NULL,'" + txtcedula.Text + "','1' ,'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "', '1', '1', '1',  '0',  '0',  '0' )"
        Dim connection As New MySqlConnection(connetionString)
        connection.Open()
        Dim command As New MySqlCommand(sql, connection)
        command.ExecuteNonQuery()
        connection.Close()
        Dim newIdFactura As String = command.LastInsertedId.ToString()
        updateRecibo(newIdFactura)
        command.Dispose()



    End Sub

    Public Sub updateRecibo(ByVal newIdFactura As String)

        Dim sql As String = Nothing
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        sql = "update recibo set cancelado = '1' , idfactura = '" + newIdFactura + "' where recibo.idrecibo = '" + currentReciboId + "' "
        Dim connection As New MySqlConnection(connetionString)
        connection.Open()
        Dim command As New MySqlCommand(sql, connection)
        command.ExecuteNonQuery()
        connection.Close()
        command.Dispose()


    End Sub

    Protected Sub txtAbono_TextChanged(sender As Object, e As EventArgs) Handles txtAbono.TextChanged
        Dim num As Double
        If Double.TryParse(Me.txtAbono.Text, num) Then
            Me.txtRestante.Text = (Convert.ToDouble(Decimal.Subtract(Me.orderTotal, Me.currentPaid)) - num).ToString
        Else
            Me.txtRestante.Text = Decimal.Subtract(Me.orderTotal, Me.currentPaid).ToString
        End If
        Me.txtTotal.Text = Decimal.Subtract(Me.orderTotal, Me.currentPaid).ToString

        If txtRestante.Text.Contains("-") Then
            txtAbono.Text = "0"
            txtRestante.Text = txtTotal.Text
        End If

    End Sub

    Protected Sub btnPrintAbono_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnPrintAbono.Click
        Dim arguments As String = (" -r ""C:\fyi\recibo.rdl"" -p ""newIdRecibo=" & Me.currentReciboId & "&newIdFactura=0""")
        Process.Start("C:\fyi\RdlReader.exe ", arguments)
    End Sub

    Protected Sub btnPrintBill_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnPrintBill.Click
        Dim cmdText As String = Nothing
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        cmdText = String.Format("select idfactura from recibo where recibo.idrecibo = '{0}' ", Me.currentReciboId)
        Dim connection As New MySqlConnection(connectionString)
        connection.Open()
        Dim command As New MySqlCommand(cmdText, connection)
        Dim reader As MySqlDataReader = command.ExecuteReader
        Dim Str As String = ""
        Do While reader.Read
            Str = reader.GetValue(0).ToString
        Loop
        reader.Close()
        command.Dispose()
        connection.Close()
        Dim textArray1 As String() = New String() {" -r ""C:\fyi\factura.rdl"" -p ""newIdRecibo=", Me.currentReciboId, "&newIdFactura=", Str, """"}
        Dim arguments As String = String.Concat(textArray1)
        Process.Start("C:\fyi\RdlReader.exe ", arguments)
    End Sub


End Class