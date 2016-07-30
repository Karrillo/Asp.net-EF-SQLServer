<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageAerolineas.aspx.cs" Inherits="WebProyecto.PageAerolineas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td style="width: auto">
                    <table style="width: 100%; border: 1px solid #cccccc">
                        <tr>
                            <td><%--Gridview--%>
                                <asp:GridView ID="gvAerolineas" runat="server" AutoGenerateColumns="False" DataKeyNames="idaerolinea" BackColor="White" BorderColor="#DEDFDE"
                                    BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceAerolineas" ForeColor="Black" GridLines="Vertical">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="idaerolinea" HeaderText="ID" SortExpression="id" Visible="false" />
                                        <asp:BoundField DataField="codigo" HeaderText="Codigo" SortExpression="codigo" />
                                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                                        <asp:BoundField DataField="descripcion" HeaderText="Descripcion" SortExpression="descripcion" />
                                        <asp:TemplateField HeaderText="Vuelos">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbVuelo" runat="server" OnClick="lbVuelo_Click">Ingresar Vuelo</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
                                </asp:GridView><%--DataSource--%>
                                <asp:SqlDataSource ID="SqlDataSourceAerolineas" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="Select idaerolinea,codigo,nombre,descripcion from aerolineas where estado = 1"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td><%--Boton--%>     
                                <asp:Button ID="btn_ingresar" runat="server" Text="Ingresar" CssClass="Button" OnClick="btn_ingresar_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
