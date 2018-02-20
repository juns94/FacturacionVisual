<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BusquedaRecibo.aspx.vb" Inherits="ASP_NET_WEB_APP.BusquedaRecibo" %>



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
  <head>
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
              <a class="dropdown-item" href="Busqueda">Facturas</a>
              <a class="dropdown-item" href="DetallesInventario">Inventario</a>
              <a class="dropdown-item active" href="BusquedaRecibo">Recibos</a>
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
                                  <td>
                                      <p>
                                          Nombre
                                      </p>
                                  </td>
                                  <td>
                                      <p>
                                          Apellido
                                      </p>
                                  </td>
                                  <td>
                                      <p>
                                          2ndo Apellido</p>
                                  </td>
                                  <td>
                                      <p>
                                          Dia
                                      </p>
                                  </td>
                                  <td>
                                      <p>
                                          Mes
                                      </p>
                                  </td>
                                  <td>
                                      <p>
                                          Año
                                      </p>
                                  </td>
                                  <td>
                                      <p>
                                          #Recibo
                                      </p>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <asp:TextBox ID="nombre" runat="server" Width="109px"></asp:TextBox>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="apellido1" runat="server" Width="129px"></asp:TextBox>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="apellido2" runat="server" Width="159px"></asp:TextBox>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="day" runat="server" Width="84px"></asp:TextBox>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="month" runat="server" Width="71px"></asp:TextBox>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="year" runat="server" Width="89px"></asp:TextBox>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="factura" runat="server"></asp:TextBox>
                                  </td>
                              </tr>
                          </table>
                      </center>
                      <br />
                      <br />
                      <center>
                          <asp:Button ID="Button1" runat="server" Height="32px" Text="Buscar" Width="158px" />
                      </center>
                  </div>
                  <div>
                  </div>
                  <center>
                      <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="Grid" DataKeyNames="idRecibo" ForeColor="Black" GridLines="Horizontal" OnRowCommand="GridView1_RowCommand" OnRowDataBound="OnRowDataBound" onrowediting="GridView1_RowEditing">
                          <Columns>
                              <asp:TemplateField>
                                  <ItemTemplate>
                <img alt = "" style="cursor: pointer" src="images/plus.png" />
                                      <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                                          <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid" ForeColor="#333333">
                                              <Columns>
                                                  <asp:BoundField DataField="cantidad" HeaderText="Cantidad" ItemStyle-Width="150px" />
                                                  <asp:BoundField DataField="codigo" HeaderText="Codigo" ItemStyle-Width="150px" />
                                                  <asp:BoundField DataField="costo" HeaderText="Costo" ItemStyle-Width="150px" />
                                                  <asp:BoundField DataField="descuento" HeaderText="Descuento" ItemStyle-Width="150px" />
                                                  <asp:BoundField DataField="descripcion" HeaderText="Descripcion" ItemStyle-Width="150px" />
                                                  <asp:TemplateField></asp:TemplateField>
                                              </Columns>
                                          </asp:GridView>
                                      </asp:Panel>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:BoundField DataField="idRecibo" HeaderText="# Recibo" ItemStyle-Width="150px">
                              <ItemStyle Width="150px" />
                              </asp:BoundField>
                              <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="150px">
                              <ItemStyle Width="150px" />
                              </asp:BoundField>
                              <asp:BoundField DataField="1erapell" HeaderText="Apellido1" ItemStyle-Width="150px">
                              <ItemStyle Width="150px" />
                              </asp:BoundField>
                              <asp:BoundField DataField="2doapell" HeaderText="Apellido2" ItemStyle-Width="150px">
                              <ItemStyle Width="150px" />
                              </asp:BoundField>
                              <asp:BoundField DataField="Fecha" HeaderText="Fecha" ItemStyle-Width="150px">
                              <ItemStyle Width="150px" />
                              </asp:BoundField>
                              <asp:TemplateField>
                                  <ItemTemplate>
                                      <asp:Button ID="AddButton" runat="server" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Detalles" Text="Ver Detalles" />
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField>
                                  <ItemTemplate>
                                      <asp:GridView ID="kek" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid">
                                          <Columns>
                                              <asp:BoundField DataField="cantsalida" HeaderText="Cantidad" ItemStyle-Width="150px" />
                                              <asp:BoundField DataField="codigo" HeaderText="Codigo" ItemStyle-Width="150px" />
                                              <asp:BoundField DataField="descripcion" HeaderText="          Descripcion                  " ItemStyle-Width="150px" />
                                              <asp:BoundField DataField="pradasa" HeaderText="Precio" ItemStyle-Width="150px" />
                                              <asp:BoundField DataField="descuento" HeaderText="Descuento" ItemStyle-Width="150px" />
                                              <asp:TemplateField></asp:TemplateField>
                                          </Columns>
                                      </asp:GridView>
                                  </ItemTemplate>
                              </asp:TemplateField>
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
    </form>




    <script src="https://bootswatch.com/_vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.min.js"></script>




</body>
</html>
