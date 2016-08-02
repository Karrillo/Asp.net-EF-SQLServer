<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageVuelos2.aspx.cs" Inherits="WebProyecto.PageVuelos2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td colspan="2"><%--datetimepicker--%>
                    <h1>Vuelos</h1>
                </td>
            </tr>
            <tr><%--droplist de asientos--%>
                <td style="width: 171px">Codigo</td>
                <td>
                    <asp:TextBox ID="txt_codigo" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">Tipo de Avion</td>
                <td>
                    <asp:TextBox ID="txt_avion" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">Hora de Salida</td>
                <td><%--droplist pais--%>
                    <input id="datesalida" type="text" name="datesalida" class="twitterStyleTextbox" />
                    <script type="text/javascript">
                        jQuery('#datesalida').datetimepicker()
                    </script>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">Hora de llegada</td>
                <td><%--droplist cuidad--%>
                    <input id="datellegada" type="text" name="datellegada" class="twitterStyleTextbox" />
                    <script type="text/javascript">
                        jQuery('#datellegada').datetimepicker();
                    </script>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">Numero de Asientos</td>
                <td><%--<asp:Parameter DefaultValue="IDAeropuerto" Name="IDAeropuerto" Type="String" />--%>
                    <asp:DropDownList ID="ddl_asiento" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">Pais</td>
                <td><%--<asp:Parameter DefaultValue="IDAeropuerto" Name="IDAeropuerto" Type="String" />--%>
                    <asp:DropDownList ID="ddl_pais" runat="server" DataSourceID="SqlDataSourcePais" DataTextField="Pais" DataValueField="IDAeropuerto" 
                       AutoPostBack="true" OnSelectedIndexChanged="ddl_pais_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourcePais" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT [IDAeropuerto], [Pais] FROM [Aeropuertos] WHERE Estado=1"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">Cuidad</td>
                <td><%--<asp:Parameter DefaultValue="IDAeropuerto" Name="IDAeropuerto" Type="String" />--%>
                    <asp:DropDownList ID="ddl_cuidad" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">Terminal</td>
                <td><%--droplist terminal--%>
                    <asp:DropDownList ID="ddl_terminal" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">Numero de Puerta</td>
                <td><%--droplist puerta--%>
                    <asp:DropDownList ID="ddl_puerta" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">&nbsp;</td>
                <td><%--botones--%>
                    <asp:Button ID="btn_ingresar" runat="server" Text="Ingresar" CssClass="Button" OnClick="btn_ingresar_Click" />
                    <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CssClass="Button" OnClick="btn_cancelar_Click" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
