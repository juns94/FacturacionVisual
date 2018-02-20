<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Abono.aspx.vb" Inherits="ASP_NET_WEB_APP.Abono" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Busqueda</a>
            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 37px, 0px); top: 0px; left: 0px; will-change: transform;">
              <a class="dropdown-item  active" href="Busqueda">Facturas</a>
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
              <a class="nav-link active" href="Abono">Abonos</a>
            </li>
          </ul>
        </nav>
        <h3 class="text-muted">Facturacion Visual Designs</h3>
      </div>

      <div class="jumbotron">
      <!--  <h5 class="display-4">recibo #</h5> -->
       

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
                <td>  <asp:TextBox ID="txtcedula" runat="server" AutoPostBack="True" ></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtnombre" runat="server"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtapellido1" runat="server"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtapellido2" runat="server"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtphone" runat="server" Width="133px"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtphone2" runat="server" Width="124px"></asp:TextBox> </td>
               
               
            </tr>
            </table> 



                      
            </center>


          
      
      <span>    
          <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    </span>    <asp:Button class="btn-success" ID="Button1" runat="server" Text="Buscar" />
      
          <br />
          <br />
      </div>

                    <center>

          
<asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" onrowediting="GridView1_RowEditing" CssClass="Grid"
    DataKeyNames="idrecibo" OnRowDataBound="OnRowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <img alt = "" style="cursor: pointer" src="images/plus.png" />
                <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" CssClass = "ChildGrid">
                        <Columns>
                          <asp:BoundField ItemStyle-Width="150px" DataField="idrecibo" HeaderText="Cantidad" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="cantidad" HeaderText="Codigo" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="codigo" HeaderText="          Descripcion                  " />
                            <asp:BoundField ItemStyle-Width="150px" DataField="costo" HeaderText="Precio" />
                             <asp:BoundField ItemStyle-Width="150px" DataField="descuento" HeaderText="Descuento" />
                             <asp:BoundField ItemStyle-Width="150px" DataField="descripcion" HeaderText="Descuento" />
                             <asp:TemplateField>
         
        </asp:TemplateField>


                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField ItemStyle-Width="150px" DataField="idrecibo" HeaderText="# recibo" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField ItemStyle-Width="150px" DataField="Nombre" HeaderText="Nombre" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
          <asp:BoundField ItemStyle-Width="150px" DataField="1erapell" HeaderText="Apellido1" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
          <asp:BoundField ItemStyle-Width="150px" DataField="2doapell" HeaderText="Apellido2" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
          <asp:BoundField ItemStyle-Width="150px" DataField="Fecha" HeaderText="Fecha" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
       <asp:TemplateField>
  <ItemTemplate>
    <asp:Button ID="AddButton" runat="server" 
      CommandName="AddToCart" 
CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>"
      Text="Pagar" />
  </ItemTemplate> 
</asp:TemplateField>

           <asp:TemplateField>
            <ItemTemplate>
           
               
                     <asp:GridView ID="kek" runat="server" AutoGenerateColumns="false" CssClass = "ChildGrid">
                        <Columns>
                            <asp:BoundField ItemStyle-Width="150px" DataField="idrecibo" HeaderText="Cantidad" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="cantidad" HeaderText="Codigo" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="codigo" HeaderText="          Descripcion                  " />
                            <asp:BoundField ItemStyle-Width="150px" DataField="costo" HeaderText="Precio" />
                             <asp:BoundField ItemStyle-Width="150px" DataField="descuento" HeaderText="Descuento" />
                             <asp:BoundField ItemStyle-Width="150px" DataField="descripcion" HeaderText="Descuento" />
                             <asp:TemplateField>
         
        </asp:TemplateField>


                        </Columns>
                    </asp:GridView>
               
            </ItemTemplate>
        </asp:TemplateField>
         
 
 
         
 
    </Columns>
    <EditRowStyle BackColor="#999999" BorderStyle="Solid" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" BorderStyle="Ridge" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>


              


              </center>





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
