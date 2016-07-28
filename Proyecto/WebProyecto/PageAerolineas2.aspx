<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageAerolineas2.aspx.cs" Inherits="WebProyecto.PageAerolineas2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td colspan="2">
                    <h1>Aerolineas</h1>
                </td>
            </tr>
            <tr>
                <td style="width: 235px">Codigo</td>
                <td>
                    <asp:TextBox ID="txt_codigo" runat="server" MaxLength="50" Width="184px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 235px">Nombre</td>
                <td>
                    <asp:TextBox ID="txt_nombre" runat="server" MaxLength="50" Width="184px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 235px; height: 36px;">Descripcion</td>
                <td style="height: 36px">
                    <asp:TextBox ID="txt_descrip" runat="server" MaxLength="100" Width="384px" Height="48px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 235px">
                    <asp:Label ID="lb_mensaje" runat="server"></asp:Label>
                    <br />
                </td>
                <td>
                    <div style="margin-left: auto; margin-right: auto;" id="topnav">
                        <ul>
                            <li class="last"><a id="guardar" runat="server" href="#">Guardar</a></li>
                            <li class="last"><a href="PageAerolineas.aspx">Cancelar</a></li>
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
