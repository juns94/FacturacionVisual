<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="inventarioExcel.aspx.vb" Inherits="ASP_NET_WEB_APP.inventarioExcel" %>

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
              margin-bottom: 0px;
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
              <a class="nav-link active" href="Factura">Facturas <span class="sr-only">(current)</span></a>
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
       

          f<br />
          <asp:Image ID="Image1" runat="server" CssClass="auto-style1" ImageUrl="~/images/machote.png" Width="1061px" />
       

          <br />
          <br />
          <asp:FileUpload ID="FileUpload1" runat="server" />
          <br />
          <asp:Label ID="UploadStatusLabel" runat="server" Text=""></asp:Label>
          <br />
          <br />
          <asp:Button ID="btnUpload" runat="server" Text="Upload"  class="btn-success" Width="128px" />
   
          <asp:CheckBox ID="overwrite" Text="Sobreescibir valores" runat="server" />
   
          <br />
          <br />
      </div>

      <div class="row marketing">

        <div class="col-lg-6">
          <h4>&nbsp;</h4>
        </div>
      </div>

      <footer class="footer">
        <p>&copy; Visual Designs 2018</p>
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
      </div>
        <div class="modal-footer">
        <asp:button type="button" id="btnCloseMsg" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Cerrar "></asp:button>
      </div>


    </div>
</asp:Panel>






    </form>




    <script src="https://bootswatch.com/_vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.min.js"></script>




    </body>
</html>
