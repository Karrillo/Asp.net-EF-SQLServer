<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageItinerarios.aspx.cs" Inherits="WebProyecto.PageItinerarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="IDItinerario" DataSourceID="SqlDataSourceItinerario" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IDItinerario" HeaderText="ID" SortExpression="IDItinerario" Visible="false" />
                            <asp:BoundField DataField="HoraRealDeSalida" HeaderText="Hora Real De Salida" SortExpression="HoraRealDeSalida" />
                            <asp:BoundField DataField="HoraRealDeLlegada" HeaderText="Hora Real De Llegada" SortExpression="HoraRealDeLlegada" />
                            <asp:TemplateField HeaderText="Editar">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbEditar" runat="server" OnClick="lbEditar_Click">Editar Itinerario</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Eliminar">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbEliminar" runat="server" OnClick="lbEliminar_Click">Eliminar Itinerario</asp:LinkButton>
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
                    <asp:SqlDataSource ID="SqlDataSourceItinerario" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT [IDItinerario], [HoraRealDeSalida], [HoraRealDeLlegada] FROM [Itinerarios] WHERE [Estado]=1 "></asp:SqlDataSource>
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
