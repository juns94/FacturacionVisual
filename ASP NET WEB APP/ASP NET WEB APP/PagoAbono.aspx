<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PagoAbono.aspx.vb" Inherits="ASP_NET_WEB_APP.PagoAbono" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head id="Head1" runat="server" >
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Facturacion</title>

    <!-- Bootstrap core CSS -->
    <link href="/Content/bootstrap.min.css" rel="stylesheet">


      <style type="text/css">
          .auto-style7 {
              height: 29px;
          }
          </style>


      <style type="text/css">
        .messagealert {
            width: 100%;
            position: fixed;
             top:0px;
            z-index: 100000;
            padding: 0;
            font-size: 15px;
        }
    </style>


    <style type="text/css">
    .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=60);
        opacity: 0.6;
    }
    .modalPopup
    {
        background-color: #FFFFFF;
        width: 300px;
        border: 3px solid #0DA9D0;
        border-radius: 12px;
        padding:0
      
    }
    .modalPopup .header
    {
        background-color: #2FBDF1;
        height: 30px;
        color: White;
        line-height: 30px;
        text-align: center;
        font-weight: bold;
        border-top-left-radius: 6px;
        border-top-right-radius: 6px;
    }
    .modalPopup .body
    {
        min-height: 50px;
        line-height: 30px;
        text-align: center;
        font-weight: bold;
    }
    .modalPopup .footer
    {
        padding: 6px;
    }
    .modalPopup .yes, .modalPopup .no
    {
        height: 23px;
        color: White;
        line-height: 23px;
        text-align: center;
        font-weight: bold;
        cursor: pointer;
        border-radius: 4px;
    }
    .modalPopup .yes
    {
        background-color: #2FBDF1;
        border: 1px solid #0DA9D0;
    }
    .modalPopup .no
    {
        background-color: #9F9F9F;
        border: 1px solid #5C5C5C;
    }
</style>




    <script type="text/javascript">
        function ShowMessage(message, messagetype) {
            var cssclass;
            switch (messagetype) {
                case 'Success':
                    cssclass = 'alert-success'
                    break;
                case 'Error':
                    cssclass = 'alert-danger'
                    break;
                case 'Warning':
                    cssclass = 'alert-warning'
                    break;
                default:
                    cssclass = 'alert-info'
            }
            $('#alert_container').append('<div id="alert_div" style="margin: 0 0.5%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert fade in ' + cssclass + '"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>' + messagetype + '!</strong> <span>' + message + '</span></div>');
        }
    </script>


      </head>

<body>
    <form id="form1" runat="server">
        <div>


             <div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills float-right">
            <li class="nav-item">
              <a class="nav-link active" href="Factura">Facturas <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Busqueda</a>
            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 37px, 0px); top: 0px; left: 0px; will-change: transform;">
              <a class="dropdown-item" href="#">Facturas</a>
              <a class="dropdown-item" href="#">Inventario</a>
              <a class="dropdown-item" href="#"></a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Separated link</a>
            </div>
          </li>
            <li class="nav-item">
              <a class="nav-link" href="Codigo">Codigos</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Examen">Examen</a>
            </li>
              <li class="nav-item">
              <a class="nav-link" href="Abono">Abonos</a>
            </li>
          </ul>
        </nav>
        <h3 class="text-muted">Facturacion Visual Designs</h3>
      </div>

      <div class="jumbotron">
      <!--  <h5 class="display-4">Factura #</h5> -->
       

              <center>

         <!-- TABLA DE CEDULA CLIENTE-->
        <table>
            <tr>
                <td>    <p>Cedula</p></td>
                <td>    <p>Nombre </p></td>
                <td>    <p>Apellido </p></td>
                <td>    <p>2ndo Apellido</p></td>
                <td> <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>   <p> Telefono </p>
                </td>
                <td>    <p>Extra </p></td>
                
                
          
            </tr>
            <tr>
                <td>  <asp:TextBox ID="txtcedula" runat="server" AutoPostBack="True" ReadOnly="True" ></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtnombre" runat="server" ReadOnly="True"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtapellido1" runat="server" ReadOnly="True"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtapellido2" runat="server" ReadOnly="True"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtphone" runat="server" Width="133px" ReadOnly="True"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtphone2" runat="server" Width="124px" ReadOnly="True"></asp:TextBox> </td>
               
               
            </tr>
            </table> 



                      
            </center>


          
      
          <br />

          <center>
          


               </hr>
              <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                  <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                  <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                  <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                  <SortedAscendingCellStyle BackColor="#F7F7F7" />
                  <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                  <SortedDescendingCellStyle BackColor="#E5E5E5" />
                  <SortedDescendingHeaderStyle BackColor="#242121" />



                  <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <img alt = "" style="cursor: pointer" src="images/plus.png" />
              
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField ItemStyle-Width="150px" DataField="cantidad" HeaderText="#Cantidad" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField ItemStyle-Width="150px" DataField="codigo" HeaderText="Codigo" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
          <asp:BoundField ItemStyle-Width="150px" DataField="costo" HeaderText="Costo" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
          <asp:BoundField ItemStyle-Width="150px" DataField="descuento" HeaderText="Descuento" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
          <asp:BoundField ItemStyle-Width="150px" DataField="descripcion" HeaderText="Detalles" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>

 
    </Columns>


              </asp:GridView>


              </center>
          Total Factura: 
          <asp:Label ID="labelOriginalPrice" runat="server" Text=" "></asp:Label>
          <br />
          <table class="w-100">
              <tr>
                  <td class="auto-style7">  <p>Total por cancelar</p></td>
                  <td class="auto-style7">Abono</td>
                  <td class="auto-style7">Restante</td>
              </tr>
              <tr>
                  <td> <asp:TextBox text="0" ID="txtTotal" runat="server" ReadOnly="True" Width="208px" />
                  </td>
                  <td>
                      <asp:TextBox ID="txtAbono" runat="server" TextMode="DateTime"  AutoPostBack="true"  ></asp:TextBox></td>
                  <td> <asp:TextBox text="0" ID="txtRestante" runat="server" ReadOnly="True" /> 
                  </td>
                    <td>
                        <asp:CheckBox ID="checkBoxTarjeta" text="Tarjeta" runat="server" />
                  </td>
                  <td><asp:Button ID="finalizeBill" padding-left:100px class="btn btn-lg btn-success" runat="server" Text="Finalizar Factura"  OnClick="FinishBill" Width="231px"  /></td>
                  </tr>

              </table>
      
          <br />
      </div>

      <footer class="footer">
        <p>&copy; Visual Designs 2017</p>
      </footer>

    </div> <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
        </div>



















         
<asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
</asp:ScriptManager>
<asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
        <asp:LinkButton ID="lnkDummy2" runat="server"></asp:LinkButton>
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server"
    PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modal-backdrop" CancelControlID = "btnCloseAbono">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="pnlPopup" runat="server" CssClass="modal-content" >
    <div class="modal-body">
<div class="modal-header">
        <h5 class="modal-title">Abono Efectuado</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$get('btnCloseAbono').click()" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Desea imprimir factura para el abono?</p>
      </div>
        <div class="modal-footer">
        <asp:button type="button" id="btnPrintAbono"  runat="server" class="btn btn-primary" Text="Imprimir"></asp:button>
        <asp:button type="button" id="btnCloseAbono" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Cerrar "></asp:button>
      </div>


    </div>
</asp:Panel>


        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" BehaviorID="mpe2" runat="server"
    PopupControlID="Panel1" TargetControlID="lnkDummy2" BackgroundCssClass="modal-backdrop" CancelControlID = "btnCloseBill">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="Panel1" runat="server" CssClass="modal-content" >
    <div class="modal-body">
<div class="modal-header">
        <h5 class="modal-title">Factura pagada!</h5>
        <button type="button" class="close" data-dismiss="panel1" aria-label="Close"  onclick="$get('btnCloseBill').click()">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Desea imprimir factura final? </p>
      </div>
        <div class="modal-footer">
        <asp:button type="button" id="btnPrintBill"  runat="server" class="btn btn-primary" Text="Imprimir"></asp:button>
        <asp:button type="button" id="btnCloseBill" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Cerrar "></asp:button>
      </div>


    </div>
</asp:Panel>





    </form>
</body>
</html>
