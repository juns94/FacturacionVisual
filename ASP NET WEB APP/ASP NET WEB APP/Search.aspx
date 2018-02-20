<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Search.aspx.vb" Inherits="ASP_NET_WEB_APP.Search" %>



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
    <title> Test de factura </title>
    <style type="text/css">
        .Grid {
            margin-top: 0px;
        }
    </style>
</head>
<body>      
     <center>
      <div id="page-wrapper">
    <form id="form1" runat="server">
        <div class ="modal-body">
     
        <center>
        <table>
            <tr>
                <td>    <p>Nombre </p></td>
                <td>    <p>Apellido </p></td>
                <td>    <p>2ndo Apellido</p></td>
                <td>    <p>Dia </p></td>
                <td>    <p>Mes </p></td>
                <td>    <p>Año </p></td>
                <td>    <p>#Factura </p></td>
          
            </tr>
            <tr>
                <td>  <asp:TextBox ID="nombre" runat="server"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="apellido1" runat="server"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="apellido2" runat="server"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="day" runat="server"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="month" runat="server"></asp:TextBox> </td>
                <td>  <asp:TextBox ID="year" runat="server"></asp:TextBox> </td>
                 <td>  <asp:TextBox ID="factura" runat="server"></asp:TextBox> </td>
            </tr>
            </table>
            </center>

        <br />
        <br />

        <center>
            <asp:Button ID="Button1" runat="server" Text="Buscar" Height="32px" Width="158px" />
            </center>
                  </div> 
   



         <div>
    </div>

   
          <center>

          
<asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" onrowediting="GridView1_RowEditing" CssClass="Grid"
    DataKeyNames="idFactura" OnRowDataBound="OnRowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <img alt = "" style="cursor: pointer" src="images/plus.png" />
                <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" CssClass = "ChildGrid">
                        <Columns>
                            <asp:BoundField ItemStyle-Width="150px" DataField="cantsalida" HeaderText="Cantidad" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="codigo" HeaderText="Codigo" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="descripcion" HeaderText="          Descripcion                  " />
                            <asp:BoundField ItemStyle-Width="150px" DataField="pradasa" HeaderText="Precio" />
                             <asp:BoundField ItemStyle-Width="150px" DataField="descuento" HeaderText="Descuento" />
                          
                             <asp:TemplateField>
         
        </asp:TemplateField>


                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField ItemStyle-Width="150px" DataField="idFactura" HeaderText="# Factura" >
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
      Text="Add to Cart" />
  </ItemTemplate> 
</asp:TemplateField>

           <asp:TemplateField>
            <ItemTemplate>
           
               
                     <asp:GridView ID="kek" runat="server" AutoGenerateColumns="false" CssClass = "ChildGrid">
                        <Columns>
                            <asp:BoundField ItemStyle-Width="150px" DataField="cantsalida" HeaderText="Cantidad" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="codigo" HeaderText="Codigo" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="descripcion" HeaderText="          Descripcion                  " />
                            <asp:BoundField ItemStyle-Width="150px" DataField="pradasa" HeaderText="Precio" />
                             <asp:BoundField ItemStyle-Width="150px" DataField="descuento" HeaderText="Descuento" />
                          
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



    </form>
  
    

      </div>
        
    

</body>
</html>

