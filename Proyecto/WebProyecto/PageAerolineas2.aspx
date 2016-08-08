<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageAerolineas2.aspx.cs" Inherits="WebProyecto.PageAerolineas2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td colspan="2"><%--Titulos--%>
                    <h1>Aerolineas</h1>
                </td>
            </tr>
            <tr>
                <%--formulario--%>
                <td style="width: 235px">Codigo</td>
                <td>
                    <asp:TextBox ID="txt_codigo" runat="server" MaxLength="50" Width="184px" CssClass="twitterStyleTextbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_codigo" ErrorMessage="Ingrese un codigo" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 235px">Nombre</td>
                <td>
                    <asp:TextBox ID="txt_nombre" runat="server" MaxLength="50" Width="184px" CssClass="twitterStyleTextbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_nombre" ErrorMessage="Ingrese un nombre" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 235px; height: 36px;" class="twitterStyleTextbox">Descripcion</td>
                <td style="height: 36px">
                    <asp:TextBox ID="txt_descrip" runat="server" MaxLength="100" Width="384px" Height="48px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 235px">
                    <asp:Label ID="lb_mensaje" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                </td>
                <td><%--botones--%>
                    <asp:Button ID="btn_ingresar" runat="server" Text="Ingresar" CssClass="Button" OnClick="btn_ingresar_Click" />
                    <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CssClass="Button" OnClick="btn_cancelar_Click" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
