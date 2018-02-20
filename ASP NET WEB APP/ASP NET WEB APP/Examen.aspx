<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Examen.aspx.vb" Inherits="ASP_NET_WEB_APP.Examen" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <title></title>
<head id="Head1" runat="server">  </head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Narrow Jumbotron Template for Bootstrap</title>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
     <!--  <link href="/Content/bootstrap.min.css" rel="stylesheet">-->
     
       

    <style type="text/css">
        .messagealert {
            width: 50%;
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
            $('#alert_container').append('<div id="alert_div" style="margin: 0 0.5%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert fade in ' + cssclass + '"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><span>' + message + '</span></div>');
        }
    </script>




     




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
              <a class="nav-link active" href="Examen">Examen</a>
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
        <p class="lead">&nbsp;</p>
       
          </p>
    

              <center>

         <!-- TABLA DE CEDULA CLIENTE-->
        <table>
            <tr>
                <td>    <p>Cedula</p></td>
                <td>    <p>Nombre </p></td>
                <td>    <p>Apellido </p></td>
                <td>    <p>2ndo Apellido</p></td>
                <td>    <p>Telefono </p>
                </td>
                <td>    <p>Extra </p></td>
                
                
          
            </tr>
            <tr>
                <td>  <asp:TextBox ID="txtcedula" runat="server"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtnombre" runat="server"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtapellido1" runat="server"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtapellido2" runat="server"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtphone" runat="server" Width="133px"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtphone2" runat="server" Width="124px"></asp:TextBox> </td>
               
               
            </tr>
            </table> 



                      
            </center>
          <br />


          
      
          <br />


          
      
          <div padding-left: 155px>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <asp:Button ID="searchButton" padding-left:100px class="btn btn-lg btn-success" runat="server" Text="Buscar" Width="168px"  />
          <br />
          <br />

              
                <div>
            <div class="messagealert" id="alert_container">
            </div>



              <table id="tableLente"   CssClass="table table-hover table-bordered"  runat="server">
            <tr>
                 <td>   <p> </p></td>
                <td>    <p>Esfera</p></td>
                <td>    <p>Cilindro</p></td>
                <td>    <p>Eje Cil</p></td>
                <td>    <p>Adicion</p></td>
                <td>    <p>Prisma</p></td>
                <td>    <p>Eje Pris</p></td>
                <td>    <p>DNP</p></td>
                <td>    <p>Altura</p></td>
                <td>    <p>AV</p></td>
               
               
                
          
            </tr>
            <tr>
                <td>   <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> OD  </p></td>

              


                <td>  <asp:TextBox ID="ODEsfera" runat="server"  Width="100px" onkeydown =   "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110) || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"  ></asp:TextBox>  </td>
                <td>  <asp:TextBox ID="ODCilindro" runat="server"  Width="100px" onkeydown =  "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);" ></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODEjeCil" runat="server"  Width="100px" onkeydown =   "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);" ></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODAdicion" runat="server"  Width="100px" onkeydown =   "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);" ></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODPrisma" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODEjePrisma" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODDNP" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"  ></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODAltura" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);" ></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODAV" runat="server"  Width="100px" ></asp:TextBox> </td> 
               
               
               
            </tr>

                  <tr>
                <td>   <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> OI  </p></td>
               <td>  <asp:TextBox ID="OIEsfera" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OICilindro" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIEjeCil" runat="server" Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIAdicion" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIPrisma" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIEjePrisma" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIDNP" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIAltura" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIAV" runat="server"  Width="100px" ></asp:TextBox> </td>
                
               
               
            </tr>


            </table>

              <table id="tableContacto"  CssClass="table table-hover table-bordered"  runat="server">
            <tr>
                 <td>   <p> </p></td>
                <td>    <p>Esfera</p></td>
                <td>    <p>Cilindro</p></td>
                <td>    <p>Eje Cil</p></td>
                <td>    <p>Adicion</p></td>
                <td>    <p>Prisma</p></td>
              
               
               
                
          
            </tr>
            <tr>
                <td>   <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> OD  </p></td>
                <td>  <asp:TextBox ID="CODEsfera" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="CODCilindro" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="CODEjeCil" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="CODAdicion" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="CODPrisma" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
               
               
               
            </tr>

                  <tr>
                <td>   <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>  OI  </pOI</p></td>
               <td>  <asp:TextBox ID="COIEsfera" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="COICilindro" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="COIEjeCil" runat="server" Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="COIAdicion" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="COIPrisma" runat="server"  Width="100px" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32 || event.keyCode==190  || event.keyCode==110 || event.keyCode==109 || event.keyCode==173 || event.keyCode==107);"></asp:TextBox> </td>
               
               


               
            </tr>


            </table>

          
                    <br />
      
                    Doctor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <asp:DropDownList ID="dropDownDoctor" runat="server">
            <asp:ListItem Text="Seleccionar Doctor" Value="-1"></asp:ListItem>
            
            </asp:DropDownList>



                    <br />
                    <br />
                    <br />



          <br />
          <SPACER>     </SPACER> 

          
         <!--  <asp:Button ID="Button1"  class="btn btn-primary btn-lg" runat="server" Text=" Finalizar Receta" Width="168px"  />  -->
                     


                    <asp:LinkButton ID="btnRandom" runat="server" CssClass="btn btn-primary btn-lg" OnClick="finalizeExam">
    <span aria-hidden="true" class="glyphicon glyphicon-refresh"></span> Finalizar Receta </asp:LinkButton>


                       <span class="glyphicon glyphicon-star" aria-hidden="true" ></span>
                 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fecha de la refracción:
          <asp:Label ID="fecharefraccion" runat="server" ForeColor="White" Text=" "></asp:Label>


          <br />
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
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server"
    PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground" CancelControlID = "btnHide">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
    
    <div class="header">
        Registro Satisfactorio  
    </div>
    <div class="body">
        La receta se ha agregado al expediente del paciente.
    </div>
    <div class="footer" align="right">
    </div>
        <asp:Button ID="btnHide" OnClick="resetForm" runat="server" Text="Ok" />
    
</asp:Panel>



     





    </form>
</body>
</html>
