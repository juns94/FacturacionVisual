<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Codigo.aspx.vb" Inherits="ASP_NET_WEB_APP.Codigo" %>


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
          .auto-style2 {
              border-radius: 0.3rem;
              margin-left: 40px;
              margin-bottom: 2rem;
              background-color: #282828;
          }
          .auto-style3 {
              margin-right: 57;
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
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Busqueda</a>
            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 37px, 0px); top: 0px; left: 0px; will-change: transform;">
              <a class="dropdown-item" href="Busqueda">Facturas</a>
              <a class="dropdown-item" href="DetallesInventario">Inventario</a>
              <a class="dropdown-item" href="BusquedaRecibo">Recibos</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Cierre">Cierre Caja</a>
            </div>
          </li>
            <li class="nav-item dropdown">
            <a class="nav-link active dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Codigos</a>
            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 37px, 0px); top: 0px; left: 0px; will-change: transform;">
              <a class="dropdown-item active" href="Codigo">Agregar Nuevo</a>
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

      <div class="auto-style2">
      <!--  <h5 class="display-4">Factura #</h5> -->
       

              <center>

         <!-- TABLA DE CEDULA CLIENTE-->



                      
            </center>


          
      
          <br />

          <center>
          
            
      <h5>Producto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <asp:DropDownList ID="dropdownproducto" runat="server" AutoPostBack="true" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged" Height="79px" Width="366px">
            <asp:ListItem Text="Seleccionar Producto" Value="-1"></asp:ListItem>
            <asp:ListItem Text="Lente Oftalmico" Value="Lente"></asp:ListItem>
            <asp:ListItem Text="Lente de Contacto" Value="Contacto"></asp:ListItem>
            <asp:ListItem Text="Aro" Value="Aro"></asp:ListItem>
            </asp:DropDownList>



                 </h5> 
          


                 <table>
            <tr>
                <td>    <p>Cantidad</p></td>
                <td>    <p>Codigo</p>   </td>
                <td>    <p>Marca</p>    </td>
                <td>    <p>Modelo</p>   </td>
                <td>    <p>Color</p>    </td>
                <td>    <p>Precio</p>   </td>
                <td>    <p>Descripcion</p> </td>
                <td>    <p>&nbsp; Impuesto %</p>    </td>
            </tr>
            <tr>
                <td>  <asp:TextBox ID="txtCantidad" runat="server" CssClass="auto-style3" Width="65px" ></asp:TextBox>   </td>
                <td>  <asp:TextBox ID="txtCodigo" runat="server" AutoPostBack="True" CssClass="offset-sm-0" Width="170px"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtMarca" runat="server" Width="127px"></asp:TextBox> </td>
                <td>  ‎<asp:TextBox ID="txtModelo" runat="server" Width="114px"></asp:TextBox></td>
                <td>  ‎<asp:TextBox ID="txtColor" runat="server" Width="66px"></asp:TextBox></td>
                <td>  ‎<asp:TextBox ID="txtPrecio" runat="server" Width="114px" TextMode="Number"></asp:TextBox></td>
                <td>  ‎<asp:TextBox ID="txtDescripcion" runat="server" Width="228px"></asp:TextBox></td>
                <td>  ‎<asp:TextBox ID="txtImpuesto" runat="server" text="13" Width="54px"></asp:TextBox></td>
          
            </tr>
            </table> 

          <br />
          <asp:Button ID="btnAddCode" padding-left:100px class="btn btn-lg btn-success" runat="server" Text="Agregar"  OnClick="addCode" Width="231px"  />
          <br />
          <br />
      </div>
                   </center>
      <div class="row marketing">
        <div class="auto-style1">
          <p>&nbsp;</div>

        
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
