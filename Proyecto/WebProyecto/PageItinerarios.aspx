<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageItinerarios.aspx.cs" Inherits="WebProyecto.PageItinerarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server">
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="margin-left: auto; margin-right: auto;" id="topnav">
                        <ul>
                            <li class="last"><a href="PageItinerarios2.aspx">Agregar</a></li>
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
