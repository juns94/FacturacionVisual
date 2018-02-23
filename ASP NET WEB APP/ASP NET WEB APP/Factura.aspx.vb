Imports System.Data
Imports System.Globalization
Imports MySql.Data.MySqlClient
Public Class Factura
    Inherits System.Web.UI.Page
    Dim currentCedula As String
    Shared dt As New DataTable
    Shared refresh As Boolean

    Dim currentType As Integer = 0
    Private orderTotal As Decimal = 0.0


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not Me.IsPostBack Or (Not refresh) Then

            refresh = True
            ' Dim dt As New DataTable()

            If Not (dt.Columns.Count > 0) Then



                dt.Columns.AddRange(New DataColumn() {New DataColumn("Cant", GetType(String)),
                                               New DataColumn("Codigo", GetType(String)),
                                               New DataColumn("Desc", GetType(String)),
                                               New DataColumn("Monto", GetType(String)),
                                                New DataColumn("Descuento", GetType(String)),
                                               New DataColumn("Impuesto", GetType(String))})
                '   dt.Rows.Add("1", "1000200", "ARO XFEFD", "5000", "10%", "13")
                '  dt.Rows.Add(2, "1000200BD", "OBJETO2rer", "1300", "5%")
                '  dt.Rows.Add(3, "1000200BD", "OBJETO2rer", "5000")
                '  dt.Rows.Add(4, "1000200BD", "OBJETO2rer", "5000")



            End If


            ' dt.Clear()


            GridView1.DataSource = dt
            GridView1.DataBind()
            ShowLenteControls(False)
            ShowContactoControls(False)


            populateVendedor()
        End If






    End Sub



    Sub OrderGridView_RowCreated(ByVal sender As Object, ByVal e As GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.Footer Then

            ' Get the OrderTotalLabel Label control in the footer row.
            Dim total As Label = CType(e.Row.FindControl("OrderTotalLabel"), Label)

            ' Display the grand total of the order formatted as currency.
            If (Not total Is Nothing) Then
                Dim nfi As New NumberFormatInfo()
                nfi.NumberGroupSeparator = " "

                total.Text = "₡" + orderTotal.ToString("n", nfi)

            End If

        End If

    End Sub





    Sub OrderGridView_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.DataRow Then

            ' Get the cell that contains the item total.
            Dim cell As TableCell = e.Row.Cells(6)

            ' Get the DataBoundLiteralControl control that contains the 
            ' data bound value.
            Dim boundControl As DataBoundLiteralControl = CType(cell.Controls(0), DataBoundLiteralControl)

            ' Remove the '$' character so that the type converter works properly.
            Dim itemTotal As String = boundControl.Text.Replace("₡", "")

            ' Add the total for an item (row) to the order total.
            orderTotal += Convert.ToDecimal(itemTotal)

            Dim temp As Double
            If Double.TryParse(txtAbono.Text, temp) Then
                txtRestante.Text = (orderTotal - temp).ToString



            Else
                txtRestante.Text = (orderTotal).ToString
            End If
            txtTotal.Text = orderTotal.ToString

        End If

    End Sub




    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles dropdownproducto.SelectedIndexChanged
        If (dropdownproducto.SelectedValue = "Aro") Then
            currentType = 1
            'ShowAroControls(False)
            ShowContactoControls(False)
            ShowLenteControls(False)
        ElseIf (dropdownproducto.SelectedValue = "Lente") Then
            currentType = 2
            ShowLenteControls(True)
            ShowContactoControls(False)
            '  HideAdminControls();

        ElseIf (dropdownproducto.SelectedValue = "Contacto") Then
            currentType = 3
            ShowLenteControls(False)
            ShowContactoControls(True)

        End If
    End Sub

    Public Sub ShowAroControls()


    End Sub

    Public Sub ShowLenteControls(state As Boolean)
        tableLente.Visible = state
    End Sub
    Public Sub ShowContactoControls(state As Boolean)
        tableContacto.Visible = state
    End Sub



    Protected Sub Gridview1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)

        If dt.Rows.Count = 1 Then
            txtTotal.Text = ""
            txtRestante.Text = ""
        End If



        If dt.Rows.Count > 0 Then
            '   dt.Rows.RemoveAt(e.RowIndex + 1)
            '    GridView1.DataSource = dt
            '   GridView1.DataBind()
            'dt = GridView1.DataSource
            dt.Rows.RemoveAt(e.RowIndex)
            GridView1.DataSource = dt
            GridView1.DataBind()

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
                SearchFormula()
                reader.Close()

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


                    txtcedula.Text = readerPadron.GetValue(0).ToString
                    txtnombre.Text = readerPadron.GetValue(1).ToString
                    txtapellido1.Text = readerPadron.GetValue(2).ToString
                    txtapellido2.Text = readerPadron.GetValue(3).ToString

                End If

            End If



            GridView1.DataSource = dt
            GridView1.DataBind()


        End If
    End Sub


    Public Sub SearchCode()
        Dim currentCode As String = txtCodigo.Text

        If currentCode.Count > 0 Then

            Dim adapter As New MySqlDataAdapter()
            Dim reader As MySqlDataReader
            Dim i As Integer = 0
            Dim sql As String = Nothing
            Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"

            sql = String.Format("select * from codigo where idcodigo ='{0}' and activo = '1' ", currentCode.Trim)
            Dim connection As New MySqlConnection(connectionString)
            connection.Open()
            Dim command As New MySqlCommand(sql, connection)
            reader = command.ExecuteReader()
            If reader.Read Then


                If reader.GetInt32(4) < 1 Then
                    modalHeader.Text = " Advertencia de Inventario "
                    modalBody.Text = " No hay existencias de este articulo en inventario. "
                    ModalPopupExtender1.Show()
                End If
                txtCantidad.Text = "1"
                txtDescripcion.Text = reader.GetValue(6).ToString
                txtMonto.Text = reader.GetValue(5).ToString
                txtCodigo.Text = reader.GetValue(0).ToString
                txtImpuesto.Text = reader.GetValue(8).ToString

            Else

                modalHeader.Text = " Error de Codigo"
                modalBody.Text = " Codigo no encontrado. "
                ModalPopupExtender1.Show()


            End If




            command.Dispose()
            connection.Close()

            GridView1.DataSource = dt
            GridView1.DataBind()


        End If

    End Sub


    Public Sub SearchFormula()
        currentCedula = txtcedula.Text
        Dim adapter As New MySqlDataAdapter()
        Dim reader As MySqlDataReader
        Dim sql As String = Nothing
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        sql = String.Format("select * from refraccion,cliente where cliente.cedula ='{0}' and  cliente.cedula = refraccion.cedula ORDER BY refraccion.fecha DESC", currentCedula)
        Dim connection As New MySqlConnection(connectionString)
        connection.Open()
        Dim command As New MySqlCommand(sql, connection)
        reader = command.ExecuteReader()

        If reader.Read Then

            ODEsfera.Text = addPlus(reader.GetValue(3).ToString)
            ODCilindro.Text = addPlus(reader.GetValue(4).ToString)
            ODEjeCil.Text = addPlus(reader.GetValue(5).ToString)
            ODAdicion.Text = addPlus(reader.GetValue(6).ToString)
            ODPrisma.Text = addPlus(reader.GetValue(7).ToString)
            ODEjePrisma.Text = addPlus(reader.GetValue(8).ToString)
            ODDNP.Text = addPlus(reader.GetValue(9).ToString)
            ODAltura.Text = addPlus(reader.GetValue(10).ToString)
            ODAV.Text = (reader.GetValue(11).ToString)
            OIEsfera.Text = addPlus(reader.GetValue(12).ToString)
            OICilindro.Text = addPlus(reader.GetValue(13).ToString)
            OIEjeCil.Text = addPlus(reader.GetValue(14).ToString)
            OIAdicion.Text = addPlus(reader.GetValue(15).ToString)
            OIPrisma.Text = addPlus(reader.GetValue(16).ToString)
            OIEjePrisma.Text = addPlus(reader.GetValue(17).ToString)
            OIDNP.Text = addPlus(reader.GetValue(18).ToString)
            OIAltura.Text = addPlus(reader.GetValue(19).ToString)
            OIAV.Text = (reader.GetValue(20).ToString)


            CODEsfera.Text = addPlus(reader.GetValue(21).ToString)
            CODCilindro.Text = addPlus(reader.GetValue(22).ToString)
            CODEjeCil.Text = addPlus(reader.GetValue(23).ToString)
            CODAdicion.Text = addPlus(reader.GetValue(24).ToString)
            CODPrisma.Text = addPlus(reader.GetValue(25).ToString)
            COIEsfera.Text = addPlus(reader.GetValue(26).ToString)
            COICilindro.Text = addPlus(reader.GetValue(27).ToString)
            COIEjeCil.Text = addPlus(reader.GetValue(28).ToString)
            COIAdicion.Text = addPlus(reader.GetValue(29).ToString)
            COIPrisma.Text = addPlus(reader.GetValue(30).ToString)


            fecharefraccion.Text = addPlus(reader.GetValue(2).ToString)
            doctor.Text = reader.GetValue(31).ToString
            command.Dispose()
            connection.Close()

        End If




    End Sub

    Function addPlus(ByRef value As String) As String
        If value.Contains("-") Then
            Return value
        Else

            Return ("+" + value)

        End If

    End Function

    Protected Sub txtCodigo_TextChanged(sender As Object, e As EventArgs) Handles txtCodigo.TextChanged

        SearchCode()

    End Sub

    Protected Sub AgregarAFactura(sender As Object, e As EventArgs) Handles Button1.Click

        ' dt.Rows.Add(4, "1000200BD", "OBJETO2rer", "5000")
        If txtDescuento.Text.Count = 0 Then
            txtDescuento.Text = "0"

        End If


        dt.Rows.Add((txtCantidad.Text), txtCodigo.Text, txtDescripcion.Text, txtMonto.Text, txtDescuento.Text + "%", txtImpuesto.Text)

        txtCodigo.Text = ""
        txtDescripcion.Text = ""
        txtMonto.Text = ""
        txtCantidad.Text = ""
        txtDescuento.Text = ""
        txtImpuesto.Text = ""
        GridView1.DataSource = dt
        GridView1.DataBind()



    End Sub

    Public Sub FinishBill()
        If Not (dropDownVendedor.SelectedValue.ToString = "-1") Then

            GridView1.DataSource = dt
            GridView1.DataBind()



            insertNewClient()



            Dim adapter As New MySqlDataAdapter()
            Dim sql As String = Nothing
            Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"

            Dim strcommand As String = "insert ignore into recibo values (NULL," +
                    "'" + (txtcedula.Text) + "','" +
                    APP(ODEsfera.Text) +
                    APP(ODCilindro.Text) +
                    APP(ODEjeCil.Text) +
                    APP(ODAdicion.Text) +
                    APP(ODPrisma.Text) +
                    APP(ODEjePrisma.Text) +
                    APP(ODDNP.Text) +
                    APP(ODAltura.Text) +
                    APP(ODAV.Text) + ' OJO DERECHO 
                    APP(OIEsfera.Text) +
                    APP(OICilindro.Text) +
                    APP(OIEjeCil.Text) +
                    APP(OIAdicion.Text) +
                    APP(OIPrisma.Text) +
                    APP(OIEjePrisma.Text) +
                    APP(OIDNP.Text) +
                    APP(OIAltura.Text) +
                    APP(OIAV.Text) + ' OJO IZQ
                    APP(CODEsfera.Text) +
                    APP(CODCilindro.Text) +
                    APP(CODEjeCil.Text) +
                    APP(CODAdicion.Text) +
                    APP(CODPrisma.Text) +   'Contacto DER
                    APP(COIEsfera.Text) +
                    APP(COICilindro.Text) +
                    APP(COIEjeCil.Text) +
                    APP(COIAdicion.Text) +
                    APP(COIPrisma.Text) + "' ," + ' contacto izq
             "'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "'," +
                   " '" + CheckPaid().ToString + "', " + ' CANCELADO
                   "'" + orderTotal.ToString + "'," + 'TOTAL
                    " '" + txtAbono.Text + "', " + ' ABONADO
                     " '" + txtRestante.Text + "', " + ' SALDO 
                       " '" + CheckTarjeta().ToString + "', " + ' TARJETA
                      " '0', " + ' DESCRIPCION
                      " '', " + ' IDFACTURA
                      "'" + dropDownVendedor.SelectedValue.ToString + "'," +
                      "'" + " " + "'" +
                   ")"

            Dim connection As New MySqlConnection(connectionString)
            connection.Open()
            Dim command As New MySqlCommand(strcommand, connection)
            Dim currentRecibo As String = command.LastInsertedId.ToString
            Dim result As Integer = command.ExecuteNonQuery()
            connection.Close()

            '''''''''''''''''''''''''''
            Dim adapterFormula As New MySqlDataAdapter()
            Dim sqlFormula As String = Nothing

            Dim strcommandFormula As String = "insert ignore into refraccionFactura values (NULL, '" + command.LastInsertedId.ToString + "', " +
                    "'" + (txtcedula.Text) + "'," +
                    ADDC(ODEsfera.Text) +
                    ADDC(ODCilindro.Text) +
                    ADDC(ODEjeCil.Text) +
                    ADDC(ODAdicion.Text) +
                    ADDC(ODPrisma.Text) +
                    ADDC(ODEjePrisma.Text) +
                    ADDC(ODDNP.Text) +
                    ADDC(ODAltura.Text) +
                    ADDC(ODAV.Text) + ' OJO DERECHO 
                    ADDC(OIEsfera.Text) +
                    ADDC(OICilindro.Text) +
                    ADDC(OIEjeCil.Text) +
                    ADDC(OIAdicion.Text) +
                    ADDC(OIPrisma.Text) +
                    ADDC(OIEjePrisma.Text) +
                    ADDC(OIDNP.Text) +
                    ADDC(OIAltura.Text) +
                    ADDC(OIAV.Text) + ' OJO IZQ
                    ADDC(CODEsfera.Text) +
                    ADDC(CODCilindro.Text) +
                    ADDC(CODEjeCil.Text) +
                    ADDC(CODAdicion.Text) +
                    ADDC(CODPrisma.Text) +   'Contacto DER
                    ADDC(COIEsfera.Text) +
                    ADDC(COICilindro.Text) +
                    ADDC(COIEjeCil.Text) +
                    ADDC(COIAdicion.Text) +
                    ADDC(COIPrisma.Text) +  ' contacto izq
                     "'" + doctor.Text + " '" +
                   ")"

            Dim connectionFormula As New MySqlConnection(connectionString)
            connectionFormula.Open()
            Dim commandFormula As New MySqlCommand(strcommandFormula, connectionFormula)

            commandFormula.ExecuteNonQuery()
            connectionFormula.Close()


            If result > 0 Then

                insertBillDetails()
                insertAbono()

                If CheckPaid() Then
                    insertFactura(command.LastInsertedId.ToString)
                Else

                    ' Process.Start("C:\fyi\RdlReader.exe ", " -r ""C:\fyi\recibo.rdl"" -p ""newIdRecibo=3&newIdFactura=0""")
                    Dim temp As String = " -r ""C:\fyi\recibo.rdl"" -p ""newIdRecibo=" + command.LastInsertedId.ToString + "&newIdFactura=0"""
                    Process.Start("C:\fyi\RdlReader.exe ", temp)

                End If

                dt.Clear()
                GridView1.DataSource = dt
                GridView1.DataBind()
                Server.Transfer("Test.aspx", True)


            End If


        Else

            modalHeader.Text = " Advertencia de Vendedor "
            modalBody.Text = " No hay un vendedor seleccionado para esta transaccion. "
            ModalPopupExtender1.Show()


        End If

    End Sub

    Public Sub insertFactura(ByVal currentRecibo As String)

        Dim adapter As New MySqlDataAdapter()
        Dim i As Integer = 0
        Dim sql As String = Nothing
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"

        Dim strcommand As String = "insert ignore into factura values (NULL," +
                "'" + (txtcedula.Text) +
                "','1' ," + ' FORMULA 
         "'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "'," +
               " '1', " + ' CANCELADO
               "'1'," + 'TOTAL
                " '1', " + ' ABONADO
                 " '0', " + ' SALDO 
                   " '0', " + ' TARJETA
                  " '0' " + ' DESCRIPCION
               ")"

        Dim connection As New MySqlConnection(connectionString)
        connection.Open()
        Dim command As New MySqlCommand(strcommand, connection)
        command.ExecuteNonQuery()
        connection.Close()


        Dim temp As String = " -r ""C:\fyi\factura.rdl"" -p ""newIdRecibo=" + currentRecibo + "&newIdFactura=" + command.LastInsertedId.ToString.Trim + """"

        updateRecibo(command.LastInsertedId.ToString, currentRecibo)

        System.Diagnostics.Process.Start("C:\fyi\RdlReader.exe", temp)
    End Sub


    Public Sub insertNewClient()

        Dim notInDatabase As Boolean = False

        If (txtcedula.Text.Length = 9) Then

            currentCedula = txtcedula.Text
            Dim adapter As New MySqlDataAdapter()
            Dim reader As MySqlDataReader
            Dim sql As String = Nothing
            Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"

            sql = String.Format("select * from cliente where cedula ='{0}' ", currentCedula)
            Dim connection As New MySqlConnection(connectionString)
            connection.Open()
            Dim command As New MySqlCommand(sql, connection)
            reader = command.ExecuteReader()
            If Not (reader.Read) Then
                command.Dispose()
                connection.Close()
                Dim adapter2 As New MySqlDataAdapter()
                Dim sql2 As String = "insert into cliente values ( '" +
                    (txtcedula.Text) + "', " +
                    "'" + (txtnombre.Text) + "', " +
                    "'" + (txtapellido1.Text) + "', " +
                    "'" + (txtapellido2.Text) + "', " +
                    "'" + (txtphone.Text) + "', " +
                   "'" + txtphone2.Text + "') "
                Dim connection2 As New MySqlConnection(connectionString)
                connection.Open()
                Dim command2 As New MySqlCommand(sql2, connection2)
                connection2.Open()
                command2.ExecuteReader()
                connection2.Close()

                command2.Dispose()

            Else
                command.Dispose()
                reader.Dispose()
                connection.Close()
            End If



        End If


    End Sub

    Public Sub updateRecibo(ByVal newIdFactura As String, ByVal currentRecibo As String)

        Dim adapter As New MySqlDataAdapter()
        Dim sql As String = Nothing
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        Dim strcommand As String = "update recibo set cancelado = '1' , idfactura = '" + newIdFactura + "' where recibo.idrecibo = '" + currentRecibo + "' "
        Dim connection As New MySqlConnection(connectionString)
        connection.Open()
        Dim command As New MySqlCommand(strcommand, connection)
        command.ExecuteNonQuery()
        connection.Close()

    End Sub


    Public Sub insertAbono()

        Dim lastID As String
        Dim adapterId As New MySqlDataAdapter()
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        Dim strcommandId As String = "select * from recibo ORDER BY recibo.fecha DESC"
        Dim connectionId As New MySqlConnection(connectionString)
        connectionId.Open()
        Dim commandId As New MySqlCommand(strcommandId, connectionId)
        Dim result As Integer = commandId.ExecuteNonQuery()
        Dim reader As MySqlDataReader
        reader = commandId.ExecuteReader()
        If reader.Read Then
            lastID = reader.GetValue(0).ToString
        End If
        connectionId.Close()


        Dim adapter As New MySqlDataAdapter()
        Dim strcommand As String = "insert ignore into abono values (NULL,'" + lastID +
            "','" + txtAbono.Text + "'," +
            "'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "'," +
            "'" + CheckTarjeta().ToString + "'" +
            ")"

        Dim connection As New MySqlConnection(connectionString)
        connection.Open()
        Dim command As New MySqlCommand(strcommand, connection)
        command.ExecuteNonQuery()
        connection.Close()


    End Sub


    Public Sub insertBillDetails()

        Dim lastID As String
        Dim adapterId As New MySqlDataAdapter()
        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        Dim strcommandId As String = "select * from recibo ORDER BY recibo.fecha DESC"
        Dim connectionId As New MySqlConnection(connectionString)
        connectionId.Open()
        Dim commandId As New MySqlCommand(strcommandId, connectionId)
        Dim result As Integer = commandId.ExecuteNonQuery()
        Dim reader As MySqlDataReader
        reader = commandId.ExecuteReader()
        If reader.Read Then
            lastID = reader.GetValue(0).ToString
        End If
        connectionId.Close()

        For Each row As DataRow In dt.Rows

            Dim strcommand As String = "insert ignore into detalle values (NULL,'" + lastID + "','" +
                 row.Item("Cant") + "'," +
            "'" + row.Item("Codigo") + "'," +
            "'" + row.Item("Monto") + "'," +
            "'" + row.Item("Descuento").ToString.Replace("%", "") + "'," +
            "'" + row.Item("Desc") + "'," +
             "'" + row.Item("Impuesto") + "'" +
            ")"
            Dim connection As New MySqlConnection(connectionString)
            connection.Open()
            Dim command As New MySqlCommand(strcommand, connection)
            command.ExecuteNonQuery()
            connection.Close()
            command.Dispose()



            Dim sql As String = Nothing
            Dim updateCommand As String = "UPDATE codigo SET cantidad = cantidad - " + row.Item("Cant") + " WHERE idCodigo= '" + row.Item("Codigo") + "'; commit;"
            Dim connectionUpdate As New MySqlConnection(connectionString)
            connectionUpdate.Open()
            Dim commandUpdate As New MySqlCommand(updateCommand, connectionUpdate)
            commandUpdate.ExecuteNonQuery()
            connectionUpdate.Close()
            commandUpdate.Dispose()

        Next row
    End Sub


    Function CheckTarjeta() As Integer

        If checkBoxTarjeta.Checked Then
            Return 1
        End If
        Return 0
    End Function

    Function CheckPaid() As Integer
        If txtAbono.Text.Count > 0 Then
            If (Double.Parse(txtTotal.Text) - Double.Parse(txtAbono.Text) = 0) Then
                Return 1
            End If
        End If
        Return 0
    End Function

    Public Function APP(ByVal value As String) As String
        Return (value + ",")
    End Function
    Public Function ADDC(ByVal value As String) As String
        Return ("'" + value + "',")
    End Function


    Protected Sub CheckBoxChanged(sender As Object, e As EventArgs) Handles checkBoxTarjeta.CheckedChanged

    End Sub

    Protected Sub txtAbono_TextChanged(sender As Object, e As EventArgs) Handles txtAbono.TextChanged

        GridView1.DataSource = dt
        GridView1.DataBind()

        If txtRestante.Text.Contains("-") Then
            txtAbono.Text = "0"
            txtRestante.Text = orderTotal.ToString
        End If



    End Sub

    Public Sub populateVendedor()


        Dim connectionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;password=admin"
        Dim strcommandId As String = "select * from vendedor"
        Dim connectionId As New MySqlConnection(connectionString)
        connectionId.Open()
        Dim commandId As New MySqlCommand(strcommandId, connectionId)
        Dim result As Integer = commandId.ExecuteNonQuery()
        Dim reader As MySqlDataReader
        reader = commandId.ExecuteReader()

        If reader.Read Then
            dropDownVendedor.Items.Add(New ListItem(reader.GetValue(1).ToString, reader.GetValue(1).ToString))
        End If
        connectionId.Close()




    End Sub



    Protected Sub GridView2_RowCommand(ByVal sender As Object,
 ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        ' Retrieve the row index stored in the CommandArgument property.
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)

        ' Retrieve the row that contains the button 
        ' from the Rows collection.
        Dim row As GridViewRow = gvCustomers.Rows(index)
        Dim idrecibo As String = gvCustomers.DataKeys(row.RowIndex).Value.ToString()

        If e.CommandName = "Agregar" Then

            txtCodigo.Text = idrecibo
            SearchCode()
        Else

        End If
    End Sub


    Protected Sub OnRowDataBound2(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' Dim customerId As String = gvCustomers.DataKeys(e.Row.RowIndex).Value.ToString()
            '  Dim idrecibo As String = gvCustomers.DataKeys(e.Row.RowIndex).Value.ToString()
            ' Dim gvOrders As GridView = TryCast(e.Row.FindControl("gvOrders"), GridView)
            '    gvOrders.DataSource = GetData(String.Format("select * from detalle where idrecibo ='{0}' ", idrecibo))
            '    gvOrders.DataBind()
        End If
    End Sub



    Protected Sub Gridview1_RowDeleting2(sender As Object, e As GridViewDeleteEventArgs)



    End Sub


    Protected Function getCurrentType() As Integer

        If (dropDownFilter.SelectedValue = "Aro") Then
            Return 1
        ElseIf (dropDownFilter.SelectedValue = "Lente") Then
            Return 2
        ElseIf (dropDownFilter.SelectedValue = "Contacto") Then
            Return 3
        ElseIf (dropDownFilter.SelectedValue = "Otros") Then
            Return 0
        ElseIf (dropDownFilter.SelectedValue = "-1") Then
            Return -1
        End If
    End Function



    Public Sub searchCodes()
        Dim adapter As New MySqlDataAdapter()
        Dim ds As New DataSet()

        Dim sql As String = Nothing
        Dim connetionString As String = "server=localhost;user id=admin;database=visualdesignsnew;persistsecurityinfo=True;allowuservariables=True;password=admin"

        sql = "select * from codigo where codigo.idcodigo = codigo.idcodigo and codigo.activo = '1' " + getQuery() + " " + getFilter() + " limit 15;"
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
        ModalPopupExtender2.Show()
        Button2.Focus()

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

    Protected Sub btnSearchCodes_Click(sender As Object, e As EventArgs) Handles btnSearchCodes.Click
        Button2.Focus()
        ModalPopupExtender2.Show()
    End Sub

    Protected Sub FinishBill(sender As Object, e As EventArgs) Handles btnFinalizeBill.Click
        FinishBill()

    End Sub
End Class