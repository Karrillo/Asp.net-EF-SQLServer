<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageItinerarios2.aspx.cs" Inherits="WebProyecto.PageItinerarios2_aspx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td colspan="2"><%--titulo--%>
                    <h1>Itinerario</h1>
                </td>
            </tr>
            <tr>
                <td style="width: 132px">Vuelo</td>
                <td><%--Droplist para vuelos--%>
                    <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="Codigo" DataValueField="IDVuelo">
                        <Items>
                            <asp:ListItem>Seleccionar</asp:ListItem>
                        </Items>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="DropDownList1" InitialValue="Seleccionar" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT [IDVuelo], [Codigo] FROM [Vuelos] where estado=1"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <%--datetimepicker--%>
                <asp:ScriptManager ID="sc" runat="server" EnableScriptGlobalization="true"></asp:ScriptManager>
                <td style="width: 132px">Hora de Salida</td>
                <td>
                    <asp:TextBox ID="txt_salida" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                    <script type="text/javascript">
                        jQuery('[id$=txt_salida]').datetimepicker();
                    </script>
                    <ajaxToolkit:MaskedEditExtender
                        ID="MaskedEditExtenderSalida"
                        runat="server"
                        TargetControlID="txt_salida"
                        Mask="99/99/9999 99:99:99"
                        MaskType="None"
                        PromptCharacter="_"
                        MessageValidatorTip="true"
                        ClearMaskOnLostFocus="False" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_salida" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 132px">Hora de Llegada</td>
                <td>
                    <asp:TextBox ID="txt_llegada" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                    <script type="text/javascript">
                        jQuery('[id$=txt_llegada]').datetimepicker();
                    </script>
                    <ajaxToolkit:MaskedEditExtender
                        ID="MaskedEditExtenderLlegada"
                        runat="server"
                        TargetControlID="txt_llegada"
                        Mask="99/99/9999 99:99:99"
                        MaskType="None"
                        PromptCharacter="_"
                        MessageValidatorTip="true"
                        ClearMaskOnLostFocus="False" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_llegada" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 132px">&nbsp;</td>
                <td><%--botones--%>
                    <asp:Button ID="btn_ingresar" runat="server" Text="Ingresar" CssClass="Button" OnClick="btn_ingresar_Click" />
                    <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CssClass="Button" OnClick="btn_cancelar_Click" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
