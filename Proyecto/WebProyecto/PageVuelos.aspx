<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageVuelos.aspx.cs" Inherits="WebProyecto.PageVuelos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceVuelos" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="IDVuelo">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IDVuelo" HeaderText="IDVuelo" SortExpression="IDVuelo" Visible="false" />
                            <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                            <asp:BoundField DataField="TipoDeAvion" HeaderText="Tipo De Avion" SortExpression="TipoDeAvion" />
                            <asp:BoundField DataField="HoraDeSalida" HeaderText="Hora De Salida" SortExpression="HoraDeSalida" />
                            <asp:BoundField DataField="HoraDeLlegada" HeaderText="Hora De Llegada" SortExpression="HoraDeLlegada" />
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
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceVuelos" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT Vuelos.IDVuelo, Vuelos.TipoDeAvion, Vuelos.HoraDeSalida, Vuelos.HoraDeLlegada, Vuelos.Codigo, Aerolineas.IDAerolinea FROM Vuelos INNER JOIN Aerolineas ON Vuelos.IDAerolinea = Aerolineas.IDAerolinea WHERE (Aerolineas.IDAerolinea = @IDAerolinea)">
                        <SelectParameters>
                            <asp:SessionParameter Name="IDAerolinea" SessionField="Data"/>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btn_ingresar" runat="server" Text="Ingresar" CssClass="Button" OnClick="btn_ingresar_Click" />
                </td>
            </tr>
        </table>
    </form>

</asp:Content>
