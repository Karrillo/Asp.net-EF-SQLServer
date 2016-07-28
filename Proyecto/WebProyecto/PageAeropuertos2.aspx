<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageAeropuertos2.aspx.cs" Inherits="WebProyecto.PageAeropuertos2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; border: 1px solid #cccccc">
        <tr>
            <td colspan="2">
                <h1>Aeropuertos</h1>
            </td>
        </tr>
        <tr>
            <td style="width: 143px">Paisa</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 143px">Cuidad</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 143px">&nbsp;</td>
            <td>
                <div style="margin-left: auto; margin-right: auto;" id="topnav">
                    <ul>
                        <li class="last"><a id="guardar" runat="server" href="#">Guardar</a></li>
                        <li class="last"><a href="PageAeropuerto.aspx">Cancelar</a></li>
                    </ul>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
