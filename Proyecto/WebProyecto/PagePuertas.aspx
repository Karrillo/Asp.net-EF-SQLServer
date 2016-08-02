<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PagePuertas.aspx.cs" Inherits="WebProyecto.PagePuertas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td><%--gridview--%>
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="IDPuertaDeAbordaje,IDAeropuerto" DataSourceID="SqlDataSourcePuertas">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IDPuertaDeAbordaje" HeaderText="IDPuertaDeAbordaje" SortExpression="IDPuertaDeAbordaje" Visible="false" />
                            <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                            <asp:BoundField DataField="Terminal" HeaderText="Terminal" SortExpression="Terminal" />
                            <asp:BoundField DataField="NumeroDePuerta" HeaderText="NumeroDePuerta" SortExpression="NumeroDePuerta" />
                            <asp:TemplateField HeaderText="Editar">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbEditar" runat="server" OnClick="lbEditar_Click">Editar Aerolinea</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Eliminar">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbEliminar" runat="server" OnClick="lbEliminar_Click">Eliminar Aerolinea</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView><%--sqldatasource--%>
                    <asp:SqlDataSource ID="SqlDataSourcePuertas" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT PuertasDeAbordajes.IDPuertaDeAbordaje, PuertasDeAbordajes.Codigo, PuertasDeAbordajes.Terminal, PuertasDeAbordajes.NumeroDePuerta, Aeropuertos.IDAeropuerto FROM Aeropuertos INNER JOIN PuertasDeAbordajes ON Aeropuertos.IDAeropuerto = PuertasDeAbordajes.IDAeropuerto where PuertasDeAbordajes.estado=1 and Aeropuertos.IDAeropuerto = @IDAero">
                        <SelectParameters>
                            <asp:SessionParameter Name="IDAero" SessionField="Data" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td><%--boton--%>
                    <asp:Button ID="btn_ingresar" runat="server" Text="Ingresar" CssClass="Button" OnClick="btn_ingresar_Click" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
