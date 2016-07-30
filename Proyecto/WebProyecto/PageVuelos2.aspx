<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageVuelos2.aspx.cs" Inherits="WebProyecto.PageVuelos2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <table style="width: 100%; border: 1px solid #cccccc">
        <tr>
            <td colspan="2"><h1>Vuelos</h1></td>
        </tr>
        <tr>
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
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 171px">Hora de llegada</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 171px">Numero de Asientos</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 171px">Pais</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 171px">Cuidad</td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 171px">Terminal</td>
            <td>
                <asp:DropDownList ID="DropDownList4" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 171px">Numero de Puerta</td>
            <td>
                <asp:DropDownList ID="DropDownList5" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 171px">&nbsp;</td>
            <td>
                <asp:Button ID="btn_ingresar" runat="server" Text="Ingresar" CssClass="Button" OnClick="btn_ingresar_Click"/>
                    <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CssClass="Button" OnClick="btn_cancelar_Click" />
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
