<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Detalles.aspx.vb" Inherits="ASP_NET_WEB_APP.Detalles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .Grid {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>



            <center style="margin-left: 40px">


               <asp:TextBox ID="nombreFactura" runat="server" Style="margin-left: 0px; margin-top: 24px;"
Width="779px" Height="41px" ReadOnly="true" BackColor="Black" Font-Size="25pt" Font-Underline="True" ForeColor="White"></asp:TextBox>
                

                <br />
                <br /><br />
                

                <asp:GridView ID="dg" runat="server" AutoGenerateColumns="False"  ShowFooter="True"  CssClass = "Grid" Height="300px" Width="787px" CellPadding="4" onrowdatabound="GridView1_RowDataBound" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" HorizontalAlign="Center" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField ItemStyle-Width="150px" DataField="cantsalida" HeaderText="Cantidad" >
<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-Width="150px" DataField="codigo" HeaderText="Codigo" >
<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-Width="150px" DataField="descripcion" HeaderText="          Descripcion                  " >
<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-Width="150px" DataField="pradasa" HeaderText="Precio" >
<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                             <asp:BoundField ItemStyle-Width="150px" DataField="descuento" HeaderText="Descuento" >
                          
<ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                          
                    



                        </Columns>
                        <FooterStyle BackColor="White" HorizontalAlign="Center" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>

                <br />
                Telefono : 
                <asp:Label ID="telefono" runat="server" Text="Label"></asp:Label>

                <br />
                <br />

                           


              
                </center>




        </div>
        <div style="margin-left: 40px">
       
        </div>


         <div class="text-center">

          <h2>  Refracción </h2>
                <asp:GridView ID="receta" runat="server" CssClass = "Grid" Height="100px" Width="287px" CellPadding="4" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" >
                        <Columns>
                          




                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>

             <br />
             Doctor:&nbsp;
             <asp:Label ID="nombreDoctor" runat="server" Text="Label"></asp:Label>

             </div>

    </form>

</body>
</html>
