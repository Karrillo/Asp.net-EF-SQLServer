<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PagePuertas2.aspx.cs" Inherits="WebProyecto.PagePuertas2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <table style="width: 100%; border: 1px solid #cccccc">
        <tr>
            <td style="width: 167px"><h1>Puertas de Abordaje</h1> </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 167px">Codigo</td>
            <td>
                <asp:TextBox ID="txt_codigo" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 167px">Terminal</td>
            <td>
                <asp:TextBox ID="txt_terminal" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 167px">Numero</td>
            <td>
                <asp:TextBox ID="txt_numero" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 167px">&nbsp;</td>
            <td>
                <asp:Button ID="btn_ingresar" runat="server" Text="Ingresar" CssClass="Button" OnClick="btn_ingresar_Click"/>
                <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CssClass="Button" OnClick="btn_cancelar_Click" />
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
