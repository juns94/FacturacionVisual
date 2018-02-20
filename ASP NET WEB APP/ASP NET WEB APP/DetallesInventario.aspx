<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetallesInventario.aspx.vb" Inherits="ASP_NET_WEB_APP.DetallesInventario" %>


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $("[src*=plus]").live("click", function () {
        $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
        $(this).attr("src", "images/minus.png");
    });
    $("[src*=minus]").live("click", function () {
        $(this).attr("src", "images/plus.png");
        $(this).closest("tr").next().remove();
    });
</script>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Facturacion</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>



    <!-- Bootstrap core CSS -->
    <link href="/Content/bootstrap.min.css" rel="stylesheet">


      <style type="text/css">
          .auto-style1 {
              position: relative;
              width: 100%;
              min-height: 1px;
              top: -1px;
              left: -1px;
              -webkit-box-flex: 0;
              -webkit-flex: 0 0 50%;
              -ms-flex: 0 0 50%;
              flex: 0 0 50%;
              max-width: 50%;
              padding-left: 15px;
              padding-right: 15px;
          }
          </style>




      </head>
<body>
    <form id="form1" runat="server">
        <div>


             <div class="container">
     <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills float-right">
            <li class="nav-item">
              <a class="nav-link" href="Factura">Facturas <span class="sr-only">(current)</span></a>
            </li>
         <li class="nav-item dropdown">
            <a class="nav-link active dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Busqueda</a>
            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 37px, 0px); top: 0px; left: 0px; will-change: transform;">
              <a class="dropdown-item " href="Busqueda">Facturas</a>
              <a class="dropdown-item active" href="DetallesInventario">Inventario</a>
              <a class="dropdown-item" href="BusquedaRecibo">Recibos</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Cierre">Cierre Caja</a>
            </div>
          </li>
            <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Codigos</a>
            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 37px, 0px); top: 0px; left: 0px; will-change: transform;">
              <a class="dropdown-item" href="Codigo">Agregar Nuevo</a>
              <a class="dropdown-item" href="ManejoCodigo">Manejar Codigos</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="inventarioExcel">Agregar por Excel</a>
            </div>
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
  
          <center>
              <div id="page-wrapper">
                  <div class="modal-body">
                      <center>
                          <table>
                              <tr>
                                  <td>Codigo</td>
                                  <td>
                                      Marca</td>
                                  <td>
                                      Modelo</td>
                                  <td>
                                      Color</td>
                                
                              </tr>
                              <tr>
                                  <td>
                                      <asp:TextBox ID="txtCodigo" runat="server" Width="109px"></asp:TextBox>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="txtMarca" runat="server" Width="129px"></asp:TextBox>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="txtModelo" runat="server" Width="159px"></asp:TextBox>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="txtColor" runat="server" Width="84px"></asp:TextBox>
                                  </td>
                                 
                              </tr>
                          </table>

                          <asp:CheckBox id="mostrarEliminados" Text ="Mostrar Eliminados" runat="server"></asp:CheckBox>

                      &nbsp;</center>
                      <br />
                      <br />
                      <center>
                          <asp:Button ID="Button1" runat="server" Height="32px" Text="Buscar" Width="158px" />
                      </center>
                  </div>
                  <div>
                  </div>
                  <center>
                      <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                          BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="Grid" DataKeyNames="idCodigo" ForeColor="Black"
                          GridLines="Horizontal" OnRowCommand="GridView1_RowCommand" OnRowDataBound="OnRowDataBound" OnRowDeleting="Gridview1_RowDeleting" >
                          <Columns>
                        
                              <asp:BoundField DataField="idCodigo" HeaderText="Codigo" ItemStyle-Width="150px">
                              <ItemStyle Width="150px" />
                              </asp:BoundField>
                              <asp:BoundField DataField="cantidad" HeaderText="Cantidad" ItemStyle-Width="150px">
                              <ItemStyle Width="150px" />
                              </asp:BoundField>
                              <asp:BoundField DataField="marca" HeaderText="Marca" ItemStyle-Width="150px">
                              <ItemStyle Width="150px" />
                              </asp:BoundField>
                              <asp:BoundField DataField="modelo" HeaderText="Modelo" ItemStyle-Width="150px">
                              <ItemStyle Width="150px" />
                              </asp:BoundField>
                              <asp:BoundField DataField="color" HeaderText="Color" ItemStyle-Width="150px">
                              <ItemStyle Width="150px" />
                                     </asp:BoundField>
                              <asp:BoundField DataField="precio" HeaderText="Precio" ItemStyle-Width="150px">
                              <ItemStyle Width="150px" />
                                     </asp:BoundField>
                              <asp:BoundField DataField="descripcion" HeaderText="Descripcion" ItemStyle-Width="150px">
                              <ItemStyle Width="150px" />
                                     </asp:BoundField>
                              <asp:BoundField DataField="impuesto" HeaderText="Impuesto" ItemStyle-Width="150px">
                              <ItemStyle Width="150px" />
                              </asp:BoundField>
                              <asp:TemplateField>
                                  <ItemTemplate>
                                      <asp:Button ID="AddButton" runat="server" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Detalles" Text="Ver Detalles" />
                                  </ItemTemplate>
                              </asp:TemplateField>

                               <asp:TemplateField>
                                  <ItemTemplate>
                                      <asp:Button ID="btnEditar" runat="server" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Editar" Text="Editar Cantidad" />
                                  </ItemTemplate>
                              </asp:TemplateField>
                            
                                    <asp:CommandField ShowDeleteButton="True" DeleteImageUrl="~/images/delete.png" ControlStyle-Width="16px" ControlStyle-Height="16px" ButtonType="Image">
        <ItemStyle Width="20px" />
              </asp:CommandField>


                          </Columns>
                          <EditRowStyle BorderStyle="Solid" />
                          <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                          <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                          <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                          <RowStyle BorderStyle="Ridge" />
                          <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                          <SortedAscendingCellStyle BackColor="#F7F7F7" />
                          <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                          <SortedDescendingCellStyle BackColor="#E5E5E5" />
                          <SortedDescendingHeaderStyle BackColor="#242121" />
                      </asp:GridView>
                  </center>
              </div>
          </center>
          


      </div>

      <div class="row marketing">
        <div class="auto-style1">
        </div>

        <div class="col-lg-6">
        </div>
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
    PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modal-backdrop" CancelControlID = "btnCloseMsg">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="pnlPopup" runat="server" CssClass="modal-content" >
    <div class="modal-body">
<div class="modal-header">
        <h5 class="modal-title">
            <asp:label id= "modalHeader" text="HEADERPRUEBA" runat="server" />
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$get('btnCloseMsg').click()" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>
            <asp:label id="modalBody" text="PRUEBA" runat="server" />
            
        </p>
          <p>
              &gt;
              <asp:Label ID="modalCode" runat="server" text="PRUEBA" />
          </p>
      </div>
        <div class="modal-footer">
        <asp:button type="button" id="btnCloseMsg" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Cerrar "></asp:button>
        <asp:button type="button" id="Button2" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Eliminar "></asp:button>
      </div>


    </div>
</asp:Panel>


        
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" BehaviorID="mpe2" runat="server"
    PopupControlID="Panel1" TargetControlID="lnkDummy2" BackgroundCssClass="modal-backdrop" CancelControlID = "btnCloseEdit">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="Panel1" runat="server" CssClass="modal-content" >
    <div class="modal-body">
<div class="modal-header">
        <h5 class="modal-title">
            <asp:label id= "modalEditHeader" text="HEADERPRUEBA" runat="server" />
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$get('btnCloseEdit').click()" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>
            <asp:label id="modalEditBody" text="PRUEBA" runat="server" />
            
            &nbsp;&nbsp;
            <asp:Label ID="modalCode0" runat="server" text="PRUEBA" />
            
        </p>
          <p>
              &gt;
             <asp:TextBox runat="server"  id="txtCantidad" Width="106px"/> 
          </p>
      </div>
        <div class="modal-footer">
        <asp:button type="button" id="btnAcceptEdit" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Aceptar "></asp:button>
        <asp:button type="button" id="btnCloseEdit" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Cancelar "></asp:button>
        </div>


    </div>
</asp:Panel>




    </form>




    <script src="https://bootswatch.com/_vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.min.js"></script>




</body>
</html>
