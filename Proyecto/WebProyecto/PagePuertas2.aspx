<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PagePuertas2.aspx.cs" Inherits="WebProyecto.PagePuertas2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; border: 1px solid #cccccc">
        <tr>
            <td style="width: 167px">Puertas de Abordaje</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 167px">Codigo</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 167px">Terminal</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 167px">Numero</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 167px">&nbsp;</td>
            <td>
                <div style="margin-left: auto; margin-right: auto;" id="topnav">
                    <ul>
                        <li class="last"><a id="guardar" runat="server" href="#">Guardar</a></li>
                        <li class="last"><a href="PagePuertas.aspx">Cancelar</a></li>
                    </ul>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
