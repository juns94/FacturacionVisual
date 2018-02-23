<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Factura.aspx.vb" Inherits="ASP_NET_WEB_APP.Factura" %>

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
          .auto-style2 {
              display: flex;
              -webkit-box-align: center;
              -webkit-align-items: center;
              -ms-flex-align: center;
              align-items: center;
              white-space: nowrap;
              font-size: 0.875rem;
              font-weight: 400;
              line-height: 1.5;
              color: #fff;
              text-align: center;
              border-radius: 0.25rem;
              border: 1px solid transparent;
              margin-right: 0px;
              margin-bottom: 0;
              background-color: #282828;
          }
          .auto-style3 {
              margin-left: 0px;
          }
          .auto-style4 {
              width: 30px;
          }
          .auto-style5 {
              width: 103px;
          }
          .auto-style6 {
              width: 110px;
          }
          .auto-style7 {
              height: 29px;
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


          
      
          <br />

          <center>
          
<asp:GridView ID="GridView1"  HeaderStyle-ForeColor="White"
    runat="server" AutoGenerateColumns="False"   CssClass="table table-hover table-striped" 
    EmptyDataText="Factura Vacia"
    ShowFooter="true" 
    onrowcreated="OrderGridView_RowCreated"
    onrowdatabound="OrderGridView_RowDataBound"   
    OnRowDeleting="Gridview1_RowDeleting" style="margin-right: 0px" >


    <Columns>
        <asp:BoundField DataField="Cant" HeaderText="Cant" ItemStyle-Width="30" >
<ItemStyle Width="30px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Codigo" HeaderText="Codigo" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Desc" HeaderText="Desc" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
         <asp:BoundField DataField="Monto" HeaderText="Monto" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Descuento" HeaderText="Descuento" ItemStyle-Width="150" > 
        <ItemStyle Width="150px" />
        </asp:BoundField>
           <asp:BoundField DataField="Impuesto" HeaderText="Impuesto" ItemStyle-Width="150" > 
        <ItemStyle Width="150px" />
        </asp:BoundField>
      

          <asp:templatefield headertext="Total"
            itemstyle-horizontalalign="Right"
            footerstyle-horizontalalign="Right"
            footerstyle-forecolor="White">
            <itemtemplate>
              <%#
                                     (((Double.Parse(Eval("Cant", "{0:c}").Trim) * Double.Parse(Eval("Monto", "{0:c}").Trim) - (Double.Parse(Eval("Monto", "{0:c}").Trim) * ((Double.Parse((Eval("Descuento", "{0:c}").Replace("%", "").Trim))) / 100)))))
                
                  %>
            </itemtemplate>
                <FooterStyle BackColor="#0B6623" HorizontalAlign="Center" ForeColor="White" />

            <footertemplate >
              <asp:label id="OrderTotalLabel"
                runat="server"/>
            </footertemplate>
          </asp:templatefield>

    
          <asp:CommandField ShowDeleteButton="True" DeleteImageUrl="~/images/delete.png" ControlStyle-Width="16px" ControlStyle-Height="16px" ButtonType="Image">
        <ItemStyle Width="20px" />
              </asp:CommandField>

    </Columns>

<HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
</asp:GridView>



               </hr>
              </center>
          <table class="w-100">
              <tr>
                  <td class="auto-style7">  <p>Total</p></td>
                  <td class="auto-style7">Abono</td>
                  <td class="auto-style7">Restante</td>
              </tr>
              <tr>
                  <td> <asp:TextBox text="0" ID="txtTotal" runat="server" ReadOnly="True" Width="208px" TextMode="Number" />
                  </td>
                  <td>
                      <asp:TextBox ID="txtAbono" runat="server" TextMode="DateTime"  AutoPostBack="true"  ></asp:TextBox></td>
                  <td> <asp:TextBox text="0" ID="txtRestante" runat="server" ReadOnly="True" /> 
                  </td>
                    <td>
                        <asp:CheckBox ID="checkBoxTarjeta" text="Tarjeta" runat="server" />
                  </td>
                  <td><asp:Button ID="btnFinalizeBill" padding-left:100px class="btn btn-lg btn-success" runat="server" Text="Finalizar Factura"  Width="231px"  /></td>
                  </tr>

              </table>
      
          Vendedor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <asp:DropDownList ID="dropDownVendedor" runat="server" AutoPostBack="true" Width="214px" 
        >
            <asp:ListItem Text="Seleccionar Vendedor" Value="-1"></asp:ListItem>
            
            </asp:DropDownList>



          <br />
     


          <br />
          <SPACER>     </SPACER> <h5>Ingresar Codigor Codigo</h5>
      <h5>Producto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <asp:DropDownList ID="dropdownproducto" runat="server" AutoPostBack="true" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged" Height="79px" Width="366px">
            <asp:ListItem Text="Seleccionar Producto" Value="-1"></asp:ListItem>
            <asp:ListItem Text="Lente Oftalmico" Value="Lente"></asp:ListItem>
            <asp:ListItem Text="Lente de Contacto" Value="Contacto"></asp:ListItem>
            <asp:ListItem Text="Aro" Value="Aro"></asp:ListItem>
            </asp:DropDownList>



                 </h5> 
          


                 </p>



                 <table>
            <tr>
                <td class="auto-style6">    <p class="auto-style5">Cantidad</p></td>
                <td>    <p>Codigo</p></td>
                <td>    <p>Descripcion</p></td>
                <td>    <p>Monto</p></td>
                <td class="auto-style4">    <p>Descuento</p>
                </td>
                <td> Impuesto de Venta</td>
                
          
            </tr>
            <tr>
                <td class="auto-style6">  <asp:TextBox ID="txtCantidad" runat="server" CssClass="mr-0" Width="98px" ></asp:TextBox>   </td>
                <td>  <asp:TextBox ID="txtCodigo" runat="server" AutoPostBack="True" CssClass="offset-sm-0"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="txtDescripcion" runat="server" Width="521px"></asp:TextBox> </td>
                <td>    <div class="auto-style2">‎ ₡&nbsp;&nbsp; <asp:TextBox ID="txtMonto" runat="server" Width="114px"></asp:TextBox></div> </td>
                <td>  <asp:TextBox ID="txtDescuento" runat="server" Width="48px" CssClass="auto-style3"></asp:TextBox>  </td>
                <td> <asp:TextBox ID="txtImpuesto" runat="server" Width="48px" CssClass="auto-style3"></asp:TextBox>  </td>
                
               
               
            </tr>
            </table> 

          <asp:Button ID="btnSearchCodes" runat="server" Text="Insertar Codigo" />

          <br />
         <!-- <asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="txtCantidad" errormessage="Favor colocar cantidad!" />
          <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtMonto" errormessage="Favor colocar monto!" />
        --->
          <br />
          <br />

          &nbsp;<br />
      

              <table id="tableLente"   CssClass="table table-hover table-striped"  runat="server">
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
                <td>   <p> OD</p></td>
                <td>  <asp:TextBox ID="ODEsfera" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODCilindro" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODEjeCil" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODAdicion" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODPrisma" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODEjePrisma" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODDNP" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODAltura" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="ODAV" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
               
               
               
            </tr>

                  <tr>
                <td>   <p> OI</p></td>
               <td>  <asp:TextBox ID="OIEsfera" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OICilindro" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIEjeCil" runat="server" Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIAdicion" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIPrisma" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIEjePrisma" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIDNP" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIAltura" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="OIAV" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                
               
               
            </tr>


            </table>

              <table id="tableContacto"  CssClass="table table-hover table-striped"  runat="server">
            <tr>
                 <td>   <p> </p></td>
                <td>    <p>Esfera</p></td>
                <td>    <p>Cilindro</p></td>
                <td>    <p>Eje Cil</p></td>
                <td>    <p>Adicion</p></td>
                <td>    <p>Prisma</p></td>
              
               
               
                
          
            </tr>
            <tr>
                <td>   <p> OD</p></td>
                <td>  <asp:TextBox ID="CODEsfera" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="CODCilindro" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="CODEjeCil" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="CODAdicion" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="CODPrisma" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
               
               
               
            </tr>

                  <tr>
                <td>   <p> OI</pOI</p></td>
               <td>  <asp:TextBox ID="COIEsfera" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="COICilindro" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="COIEjeCil" runat="server" Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="COIAdicion" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="COIPrisma" runat="server"  Width="100px" style="text-align: center"></asp:TextBox> </td>
               
               
               
            </tr>


            </table>

          
            <asp:Button ID="Button1"  class="btn btn-primary btn-lg" runat="server" Text="Agregar a Factura" Width="168px"  />


          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fecha de la refracción:
          <asp:Label ID="fecharefraccion" runat="server" ForeColor="White" Text=" "></asp:Label>


          <br />
          <br />
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
      </div>
        <div class="modal-footer">
        <asp:button type="button" id="btnCloseMsg" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Cerrar "></asp:button>
      </div>


    </div>
</asp:Panel>

<!--------------- Panel -->


        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" BehaviorID="mpe2" runat="server"
    PopupControlID="pnlPopup2" TargetControlID="lnkDummy2" BackgroundCssClass="modal-backdrop" CancelControlID = "btnCloseMsg2">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="pnlPopup2" runat="server" CssClass="modal-content" >
    <div class="modal-body">
<div class="modal-header">
        <h5 class="modal-title">
            <asp:label id= "Label1" text="Busqueda de Codigo" runat="server" />
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$get('btnCloseMsg2').click()" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      


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
                                      <asp:TextBox ID="TextBox1" runat="server" Width="109px"></asp:TextBox>
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
                      </center>
              <asp:DropDownList ID="dropDownFilter" runat="server" AutoPostBack="false" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged"  Width="366px">
            <asp:ListItem Text="Mostrar todos" Value="-1"></asp:ListItem>
            <asp:ListItem Text="Lente Oftalmico" Value="Lente"></asp:ListItem>
            <asp:ListItem Text="Lente de Contacto" Value="Contacto"></asp:ListItem>
            <asp:ListItem Text="Aro" Value="Aro"></asp:ListItem>
            <asp:ListItem Text="Otros" Value="Otros"></asp:ListItem>
            </asp:DropDownList>



                      <br />
                      <br />
                      <center>
                          <asp:Button ID="Button2" onClick="searchCodes" runat="server" Height="32px" Text="Buscar" Width="158px" />
                      </center>
                  </div>
                  <div>
                  </div>
                  <center>
                      <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                          BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="Grid" DataKeyNames="idCodigo" ForeColor="Black"
                          GridLines="Horizontal" OnRowCommand="GridView2_RowCommand" OnRowDataBound="OnRowDataBound2" OnRowDeleting="Gridview1_RowDeleting2" Width="1008px" >
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
                              <asp:TemplateField>
                                  <ItemTemplate>
                                      <asp:Button ID="AddButton" runat="server" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" CommandName="Agregar" Text="Agregar" />
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
        <div class="modal-footer">
        <asp:button type="button" id="btnCloseMsg2" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Cerrar "></asp:button>
      </div>


    </div>
</asp:Panel>






    </form>




    <script src="https://bootswatch.com/_vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.min.js"></script>




    <p>
        &nbsp;</p>


    <asp:label id="doctor" text="" runat="server" />


      

</body>
</html>
