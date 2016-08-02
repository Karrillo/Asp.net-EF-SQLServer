<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageItinerarios2.aspx.cs" Inherits="WebProyecto.PageItinerarios2_aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td colspan="2"><%--titulo--%>
                    <h1>Itinerario</h1>
                </td>
            </tr>
            <tr>
                <td style="width: 132px">Vuelo</td>
                <td><%--Droplist para vuelos--%>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Codigo" DataValueField="IDVuelo">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT [IDVuelo], [Codigo] FROM [Vuelos]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr><%--datetimepicker--%>
                <td style="width: 132px">Hora de Salida</td>
                <td>
                    <asp:TextBox ID="txt_salida" runat="server" CssClass="twitterStyleTextbox datesalida"></asp:TextBox>
                    <script type="text/javascript">
                        jQuery('.datesalida').datetimepicker()
                    </script>
                </td>
            </tr>
            <tr>
                <td style="width: 132px">Hora de Llegada</td>
                <td>
                    <asp:TextBox ID="txt_llegada" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                    <script type="text/javascript">
                        jQuery('[id$=txt_llegada]').datetimepicker();
                    </script>
                </td>
            </tr>
            <tr>
                <td style="width: 132px">&nbsp;</td>
                <td><%--botones--%>
                    <asp:Button ID="btn_ingresar" runat="server" Text="Ingresar" CssClass="Button" OnClick="btn_ingresar_Click" />
                    <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CssClass="Button" OnClick="btn_cancelar_Click" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
