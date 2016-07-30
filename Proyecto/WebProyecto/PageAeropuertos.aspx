<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageAeropuertos.aspx.cs" Inherits="WebProyecto.PageAeropuertos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceAeropuerto" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="idaeropuerto">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="idaeropuerto" HeaderText="idaeropuerto" SortExpression="idaeropuerto" Visible="false" />
                            <asp:BoundField DataField="Cuidad" HeaderText="Cuidad" SortExpression="Cuidad" />
                            <asp:BoundField DataField="Pais" HeaderText="Pais" SortExpression="Pais" />
                            <asp:TemplateField HeaderText="Vuelos">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbPuertas" runat="server" OnClick="lbPuertas_Click">Ingresar Puertas</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Editar">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbEditar" runat="server" OnClick="lbEditar_Click">Editar Aeropuertos</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Eliminar">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbEliminar" runat="server" OnClick="lbEliminar_Click">Eliminar Aeropuertos</asp:LinkButton>
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
                    <asp:SqlDataSource ID="SqlDataSourceAeropuerto" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT idaeropuerto, Cuidad, Pais FROM Aeropuertos WHERE Estado = 1"></asp:SqlDataSource>
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
