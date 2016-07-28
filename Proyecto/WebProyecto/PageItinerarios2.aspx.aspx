<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageItinerarios2.aspx.aspx.cs" Inherits="WebProyecto.PageItinerarios2_aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; border: 1px solid #cccccc">
        <tr>
            <td colspan="2"><h1>Itinerario</h1></td>
        </tr>
        <tr>
            <td style="width: 132px">Vuelo</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 132px">Hora de Salida</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 132px">Hora de Llegada</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 132px">&nbsp;</td>
            <td>
                <div style="margin-left: auto; margin-right: auto;" id="topnav">
                    <ul>
                        <li class="last"><a id="guardar" runat="server" href="#">Guardar</a></li>
                        <li class="last"><a href="PageItinerarios.aspx">Cancelar</a></li>
                    </ul>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
