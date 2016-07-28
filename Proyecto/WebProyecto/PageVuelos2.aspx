<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageVuelos2.aspx.cs" Inherits="WebProyecto.PageVuelos2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; border: 1px solid #cccccc">
        <tr>
            <td colspan="2"><h1>Vuelos</h1></td>
        </tr>
        <tr>
            <td style="width: 171px">Tipo de Avion</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 171px">Codigo</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 171px">Hora de Salida</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 171px">Hora de llegada</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 171px">Numero de Asientos</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 171px">Pais</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 171px">Cuidad</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 171px">&nbsp;</td>
            <td>
                <div style="margin-left: auto; margin-right: auto;" id="topnav">
                        <ul>
                            <li class="last"><a id="guardar" runat="server" href="#">Guardar</a></li>
                            <li class="last"><a href="PageVuelos.aspx">Cancelar</a></li>
                        </ul>
                    </div>
            </td>
        </tr>
    </table>
</asp:Content>
