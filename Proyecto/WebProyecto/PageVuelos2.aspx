<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageVuelos2.aspx.cs" Inherits="WebProyecto.PageVuelos2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td colspan="2"><%--droplist de asientos--%>
                    <h1>Vuelos</h1>
                </td>
            </tr>
            <tr>
                <%--droplist asientos--%>
                <td style="width: 171px">Codigo</td>
                <td>
                    <asp:TextBox ID="txt_codigo" runat="server" CssClass="twitterStyleTextbox" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_codigo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td style="width: 171px">Tipo de Avion</td>
                <td>
                    <asp:TextBox ID="txt_avion" runat="server" CssClass="twitterStyleTextbox" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_avion" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <asp:ScriptManager ID="sc" runat="server" EnableScriptGlobalization="true"></asp:ScriptManager>
                <td style="width: 171px">Hora de Salida</td>
                <td>
                    <asp:TextBox ID="txt_salida" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                    <script type="text/javascript">
                        jQuery('[id$=txt_salida]').datetimepicker();
                    </script>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtenderSalida"
                        runat="server"
                        TargetControlID="txt_salida"
                        Mask="99/99/9999 99:99:99"
                        MaskType="None"
                        PromptCharacter="_"
                        ClearMaskOnLostFocus="False" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_salida" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">Hora de llegada</td>
                <td>
                    <asp:TextBox ID="txt_llegada" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                    <script type="text/javascript">
                        jQuery('[id$=txt_llegada]').datetimepicker();
                    </script>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtenderLlegada"
                        runat="server"
                        TargetControlID="txt_llegada"
                        Mask="99/99/9999 99:99:99"
                        MaskType="None"
                        PromptCharacter="_"
                        ClearMaskOnLostFocus="False" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_llegada" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <%--droplist pais--%>
                <td style="width: 171px">Numero de Asientos</td>
                <td>
                    <asp:DropDownList ID="ddl_Asientos" runat="server">
                        <Items>
                            <asp:ListItem Text="Seleccionar" Value="" />
                            <asp:ListItem Text="50" Value="1" />
                            <asp:ListItem Text="100" Value="2" />
                        </Items>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">Pais</td>
                <td><%--droplist cuidad--%>
                    <asp:DropDownList ID="ddlPais" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDSPais" DataTextField="Pais" DataValueField="Pais"
                        AutoPostBack="True" OnSelectedIndexChanged="ddlPais_SelectedIndexChanged">
                        <Items>
                            <asp:ListItem>Seleccionar</asp:ListItem>
                        </Items>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="ddlPais" InitialValue="Seleccionar" />
                    <asp:SqlDataSource ID="SqlDSPais" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT [Pais] FROM [Aeropuertos] WHERE [Estado]=1 GROUP BY Pais "></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">Cuidad</td>
                <td><%--droplist terminal--%>
                    <asp:DropDownList ID="ddlCuidad" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDSCuidad" DataTextField="Cuidad" DataValueField="IDAeropuerto"
                        AutoPostBack="True" OnSelectedIndexChanged="ddlCuidad_SelectedIndexChanged">
                        <Items>
                            <asp:ListItem>Seleccionar</asp:ListItem>
                        </Items>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="ddlCuidad" InitialValue="Seleccionar" />
                    <asp:SqlDataSource ID="SqlDSCuidad" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT [IDAeropuerto], [Cuidad] FROM [Aeropuertos] WHERE ([Pais] = @Pais and estado=1)">
                        <SelectParameters>
                            <asp:Parameter Name="Pais" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">Terminal</td>
                <td><%--droplist puerta--%>
                    <asp:DropDownList ID="ddlTerminal" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDSTerminal" DataTextField="Terminal" DataValueField="Terminal"
                        AutoPostBack="true" OnSelectedIndexChanged="ddlTerminal_SelectedIndexChanged">
                        <Items>
                            <asp:ListItem>Seleccionar</asp:ListItem>
                        </Items>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                        ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="ddlTerminal" InitialValue="Seleccionar" />
                    <asp:SqlDataSource ID="SqlDSTerminal" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT [Terminal] FROM [PuertasDeAbordajes] WHERE ([Estado] = @Estado) AND ([IDAeropuerto] = @IDAeropuerto) GROUP BY [Terminal]">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="Estado" Type="Boolean" />
                            <asp:Parameter Name="IDAeropuerto" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">Numero de Puerta</td>
                <td><%--botones--%>
                    <asp:DropDownList ID="ddlPuerta" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDSNumero" DataTextField="NumeroDePuerta" DataValueField="IDPuertaDeAbordaje">
                        <Items>
                            <asp:ListItem>Seleccionar</asp:ListItem>
                        </Items>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                        ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="ddlPuerta" InitialValue="Seleccionar" />
                    <asp:SqlDataSource ID="SqlDSNumero" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT [IDPuertaDeAbordaje], [NumeroDePuerta] FROM [PuertasDeAbordajes] WHERE (([Terminal] = @Terminal) AND ([Estado] = @Estado) AND ([IDAeropuerto] = @IDAeropuerto))">
                        <SelectParameters>
                            <asp:Parameter Name="Terminal" Type="Int16" />
                            <asp:Parameter DefaultValue="True" Name="Estado" Type="Boolean" />
                            <asp:Parameter Name="IDAeropuerto" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 171px">
                    <asp:Label ID="lbl_mensaje" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td><%--botones--%>
                    <asp:Button ID="btn_ingresar" runat="server" Text="Ingresar" CssClass="Button" OnClick="btn_ingresar_Click" />
                    <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CssClass="Button" OnClick="btn_cancelar_Click" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
