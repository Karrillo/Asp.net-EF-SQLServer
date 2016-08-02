<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageTicketes.aspx.cs" Inherits="WebProyecto.PageTicketes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td colspan="2"><%--titulo--%>
                    <h1>Compra de ticketes</h1>
                </td>
            </tr>
            <tr>
                <td style="height: 26px; width: 155px;">Nompre del Pasajero</td>
                <td style="height: 26px">Nombre:
                    <asp:TextBox ID="txt_nombre" runat="server"></asp:TextBox>
                    &nbsp;Primer Apellido:
                    <asp:TextBox ID="txt_Papellido" runat="server"></asp:TextBox>
                    &nbsp;Segundo Apellido:
                    <asp:TextBox ID="txt_Sapellido" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp; Buscar un Pasajero Existente:<%--droplist de numero de passaporte--%>
                    <asp:DropDownList ID="ddl_pass" runat="server" DataSourceID="SqlDataSourcePasajero" DataTextField="NumeroPasaporte" DataValueField="IDPasajero">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourcePasajero" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT [IDPasajero], [PrimerApellido], [Nombre], [SegundoApellido], [Telefono], [Pais], [NumeroPasaporte] FROM [Pasajeros]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 155px; height: 30px;">Pais de Origen</td>
                <td style="height: 30px">
                    <asp:TextBox ID="txt_pais" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 155px">Telefono</td>
                <td>
                    <asp:TextBox ID="txt_telefono" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 155px">Passaporte</td>
                <td>
                    <asp:TextBox ID="txt_pass" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <h1>Buscar Vuelos</h1>
                </td>
            </tr>
            <tr>
                <%--droplist vuelos--%>
                <td style="width: 155px; height: 30px;">Fecha</td>
                <td style="height: 30px">
                    <asp:DropDownList ID="ddl_vuelos" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <%--droplist pais--%>
                <td style="width: 155px; height: 26px;">Pais</td>
                <td style="height: 26px">
                    <asp:DropDownList ID="ddl_pais" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2"><%--gridview de vuelos--%>
                    <asp:GridView ID="gv_vuelos" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="White" />
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
                </td>
            </tr>
            <tr>
                <td style="width: 155px; height: 26px;">Selecciones Asiento</td>
                <td style="height: 26px"></td>
            </tr>
            <tr>
                <td colspan="2"><%--gridview de ticketes--%>
                    <asp:GridView ID="gv_ticketes" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="White" />
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
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
