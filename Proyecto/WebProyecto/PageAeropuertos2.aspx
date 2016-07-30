<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageAeropuertos2.aspx.cs" Inherits="WebProyecto.PageAeropuertos2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <table style="width: 100%; border: 1px solid #cccccc">
        <tr>
            <td colspan="2">
                <h1>Aeropuertos</h1>
            </td>
        </tr>
        <tr>
            <td style="width: 143px">Pais</td>
            <td>
                <asp:TextBox ID="txt_pais" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 143px">Cuidad</td>
            <td>
                <asp:TextBox ID="txt_cuidad" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 143px">&nbsp;</td>
            <td>
                <asp:Button ID="btn_ingresar" runat="server" Text="Ingresar" CssClass="Button" OnClick="btn_ingresar_Click"/>
                    <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CssClass="Button" OnClick="btn_cancelar_Click" />
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
