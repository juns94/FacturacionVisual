<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetallesFactura.aspx.vb" Inherits="ASP_NET_WEB_APP.DetallesFactura" %>


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
            <a class="nav-link active  dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Busqueda</a>
            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 37px, 0px); top: 0px; left: 0px; will-change: transform;">
              <a class="dropdown-item" href="Busqueda">Facturas</a>
              <a class="dropdown-item" href="DetallesInventario">Inventario</a>
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
      <!--  <h5 class="display-4">Factura #</h5> -->
       

              <center>

         <!-- TABLA DE CEDULA CLIENTE-->



                      
            </center>
          <div>
              <center style="margin-left: 40px">
                  <asp:TextBox ID="nombreFactura" runat="server" BackColor="Black" Font-Size="25pt" Font-Underline="True" ForeColor="White" Height="41px" ReadOnly="true" Style="margin-left: 0px; margin-top: 24px;" Width="779px"></asp:TextBox>
                  <br />
                  <br />
                  <br />
                  <asp:GridView ID="dg" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" CssClass="Grid" GridLines="Horizontal" Height="300px" HorizontalAlign="Center" onrowdatabound="GridView1_RowDataBound" ShowFooter="True" Width="787px">
                      <Columns>
                                                  <asp:BoundField DataField="cantidad" HeaderText="Cantidad" ItemStyle-Width="150px" />
                                                  <asp:BoundField DataField="codigo" HeaderText="Codigo" ItemStyle-Width="150px" />
                                                  <asp:BoundField DataField="costo" HeaderText="Costo" ItemStyle-Width="150px" />
                                                  <asp:BoundField DataField="descuento" HeaderText="Descuento" ItemStyle-Width="150px" />
                                                  <asp:BoundField DataField="descripcion" HeaderText="Descripcion" ItemStyle-Width="150px" />
                                                 
                      </Columns>
                      <FooterStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center" />
                      <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                      <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                      <RowStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                      <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                      <SortedAscendingCellStyle BackColor="#F7F7F7" />
                      <SortedAscendingHeaderStyle BackColor="#487575" />
                      <SortedDescendingCellStyle BackColor="#E5E5E5" />
                      <SortedDescendingHeaderStyle BackColor="#275353" />
                  </asp:GridView>
                  <br />
                  Telefono : <asp:Label ID="telefono" runat="server" Text="Label"></asp:Label>
                  <br />
                  
                  <asp:button id="btnPrint" class="btn btn-primary" text="Imprimir" runat="server" OnClick="printbill" />
                  <br />
              </center>
          </div>
          <div style="margin-left: 40px">
          </div>
          <div class="text-center">
              <h2>Refracción </h2>
              <asp:GridView ID="receta" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" CssClass="Grid" GridLines="Horizontal" Height="100px" Width="753px">
                  <Columns>
                  </Columns>
                  <FooterStyle BackColor="White" ForeColor="#333333" />
                  <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                  <RowStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                  <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                  <SortedAscendingCellStyle BackColor="#F7F7F7" />
                  <SortedAscendingHeaderStyle BackColor="#487575" />
                  <SortedDescendingCellStyle BackColor="#E5E5E5" />
                  <SortedDescendingHeaderStyle BackColor="#275353" />
              </asp:GridView>
              <br />

                 <h2>Contacto </h2>
              <asp:GridView ID="contacto" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" CssClass="Grid" GridLines="Horizontal" Height="100px" Width="753px">
                  <Columns>
                  </Columns>
                  <FooterStyle BackColor="White" ForeColor="#333333" />
                  <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                  <RowStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                  <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                  <SortedAscendingCellStyle BackColor="#F7F7F7" />
                  <SortedAscendingHeaderStyle BackColor="#487575" />
                  <SortedDescendingCellStyle BackColor="#E5E5E5" />
                  <SortedDescendingHeaderStyle BackColor="#275353" />
              </asp:GridView>
              <br />
              Doctor:&nbsp; <asp:Label ID="nombreDoctor" runat="server" Text="Label"></asp:Label>
          </div>
          <br />
          <br />
      </div>

      <div class="row marketing">

        <div class="col-lg-6">
          <h4>&nbsp;</h4>
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
