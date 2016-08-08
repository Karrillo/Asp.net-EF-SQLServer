<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageAeropuertos2.aspx.cs" Inherits="WebProyecto.PageAeropuertos2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td colspan="2"><%--formulario--%>
                    <h1>Aeropuertos</h1>
                </td>
            </tr>
            <tr>
                <%--botones--%>
                <td style="width: 143px">Pais</td>
                <td>
                    <asp:TextBox ID="txt_pais" runat="server" CssClass="twitterStyleTextbox" MaxLength="50" Height="20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_pais"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ControlToValidate="txt_pais" ErrorMessage="Ingrese solo letras"
                        ForeColor="Red"
                        ValidationExpression="[a-zA-Z ]*$">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 143px">Cuidad</td>
                <td>
                    <asp:TextBox ID="txt_cuidad" runat="server" CssClass="twitterStyleTextbox" MaxLength="50" Height="20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_cuidad"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="txt_cuidad" ErrorMessage="Ingrese solo letras"
                        ForeColor="Red"
                        ValidationExpression="[a-zA-Z ]*$">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 143px">
                    <asp:Label ID="lb_mensaje" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td><%--botones--%>
                    <asp:Button ID="btn_ingresar" runat="server" Text="Ingresar" CssClass="Button" OnClick="btn_ingresar_Click" />
                    <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CssClass="Button" OnClick="btn_cancelar_Click" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
