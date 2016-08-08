<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageTicketes.aspx.cs" Inherits="WebProyecto.PageTicketes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Select radiobutton--%>
    <script type="text/javascript">

        function SelectRadiobutton(radio) {
            var rbBtn = document.getElementById(radio.id);
            var rbBtnList = document.getElementsByTagName("input");
            for (var i = 0; i < rbBtnList.length; i++) {
                if (rbBtnList[i].type == "radio" && rbBtnList[i].id != rbBtn.id) {
                    rbBtnList[i].checked = false;
                }
            }
        }

        function SelectRadiobuttonDos(radio) {
            var rbBtn = document.getElementById(radio.id);
            var rbBtnList = document.getElementsByTagName("input");
            for (var i = 0; i < rbBtnList.length; i++) {
                if (rbBtnList[i].type == "radio" && rbBtnList[i].defaultValue == "rbAsientos" && rbBtnList[i].id != rbBtn.id) {
                    rbBtnList[i].checked = false;
                }
            }
        }
    </script>

    <form id="form1" runat="server">
        <table style="width: 100%; border: 1px solid #cccccc">
            <tr>
                <td colspan="2">
                    <%--titulo--%>
                    <h1>Compra de ticketes</h1>
                </td>
            </tr>
            <tr>
                <td style="height: 26px; width: 155px;">Nompre del Pasajero</td>
                <td style="height: 26px">Nombre:
                    <asp:TextBox ID="txt_nombre" runat="server" CssClass="twitterStyleTextbox" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_nombre" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                        ControlToValidate="txt_nombre" ErrorMessage="Ingrese solo letras"
                        ForeColor="Red"
                        ValidationExpression="[a-zA-Z ]*$">
                    </asp:RegularExpressionValidator>
                    Primer Apellido:
                    <asp:TextBox ID="txt_Papellido" runat="server" CssClass="twitterStyleTextbox" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Papellido" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ControlToValidate="txt_Papellido" ErrorMessage="Ingrese solo letras"
                        ForeColor="Red"
                        ValidationExpression="^[A-Za-z]*$">
                    </asp:RegularExpressionValidator>
                    Segundo Apellido:
                    <asp:TextBox ID="txt_Sapellido" runat="server" CssClass="twitterStyleTextbox" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Sapellido" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="txt_Sapellido" ErrorMessage="Ingrese solo letras"
                        ForeColor="Red"
                        ValidationExpression="^[A-Za-z]*$">
                    </asp:RegularExpressionValidator>
                    Buscar un Pasajero Existente:
                    <%--droplist de numero de passaporte--%>
                    <asp:DropDownList ID="ddl_pass" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourcePasajero" DataTextField="NumeroPasaporte" DataValueField="IDPasajero" OnSelectedIndexChanged="ddl_pass_SelectedIndexChanged" AutoPostBack="true">
                        <Items>
                            <asp:ListItem Text="Seleccionar" Value="" />
                        </Items>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourcePasajero" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT [IDPasajero], [PrimerApellido], [Nombre], [SegundoApellido], [Telefono], [Pais], [NumeroPasaporte] FROM [Pasajeros]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 155px; height: 30px;">Pais de Origen</td>
                <td style="height: 30px">
                    <asp:TextBox ID="txt_pais" runat="server" CssClass="twitterStyleTextbox" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_pais" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                        ControlToValidate="txt_pais" ErrorMessage="Ingrese solo letras"
                        ForeColor="Red"
                        ValidationExpression="[a-zA-Z ]*$">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 155px">Telefono</td>
                <td>
                    <asp:TextBox ID="txt_telefono" runat="server" CssClass="twitterStyleTextbox" MaxLength="9"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_telefono" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtenderTelefono" runat="server" TargetControlID="txt_telefono" MaskType="Number" Mask="9999-9999" ClearMaskOnLostFocus="False" />
                </td>
            </tr>
            <tr>
                <td style="width: 155px">Passaporte</td>
                <td>
                    <asp:TextBox ID="txt_pass" runat="server" CssClass="twitterStyleTextbox" MaxLength="11"></asp:TextBox>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="txt_pass" MaskType="Number" Mask="9-9999-9999" ClearMaskOnLostFocus="False" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_pass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <h1>Buscar Vuelos</h1>
                </td>
            </tr>
            <tr>
                <%--droplist vuelos--%>
                <td style="width: 155px; height: 30px;">Fecha</td>
                <td style="height: 30px">
                    <asp:DropDownList ID="ddl_vuelos" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSourceFecha" DataTextField="HoraRealDeSalida" DataValueField="HoraRealDeSalida"
                        AutoPostBack="True" OnSelectedIndexChanged="ddl_vuelos_SelectedIndexChanged">
                        <Items>
                            <asp:ListItem>Seleccionar</asp:ListItem>
                        </Items>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                        ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="ddl_vuelos" InitialValue="Seleccionar" />
                    <asp:SqlDataSource ID="SqlDataSourceFecha" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT [HoraRealDeSalida], [IDItinerario] FROM [Itinerarios] WHERE ([Estado] = @Estado)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="True" Name="Estado" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <%--droplist pais--%>
                <td style="height: 26px;" colspan="2">Pais:
                    <asp:DropDownList ID="ddl_pais" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSourcePais" DataTextField="Pais" DataValueField="Pais" AutoPostBack="true" OnSelectedIndexChanged="ddl_pais_SelectedIndexChanged">
                        <Items>
                            <asp:ListItem>Seleccionar</asp:ListItem>
                        </Items>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                        ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="ddl_pais" InitialValue="Seleccionar" />
                    <asp:SqlDataSource ID="SqlDataSourcePais" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT [Pais] FROM [Aeropuertos] WHERE ([Estado] = @Estado) group by [Pais]">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="True" Name="Estado" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    &nbsp;Cuidad:
                    <%--droplist cuidad--%>
                    <asp:DropDownList ID="ddl_pais0" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSourceCuidad" DataTextField="Cuidad" DataValueField="IDAeropuerto"
                        AutoPostBack="true" OnSelectedIndexChanged="ddl_pais0_SelectedIndexChanged">
                        <Items>
                            <asp:ListItem>Seleccionar</asp:ListItem>
                        </Items>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                        ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="ddl_pais0" InitialValue="Seleccionar" />
                    <asp:SqlDataSource ID="SqlDataSourceCuidad" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT [IDAeropuerto], [Cuidad] FROM [Aeropuertos] WHERE ([Pais] = @Pais) and estado=1">
                        <SelectParameters>
                            <asp:Parameter Name="Pais" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <%--gridview de vuelos--%>
                    <asp:GridView ID="gv_vuelos" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical"
                        AutoGenerateColumns="False" DataKeyNames="IDVuelo" DataSourceID="SqlDataSourceVuelos">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IDVuelo" HeaderText="IDVuelo" SortExpression="IDVuelo" Visible="false" />
                            <asp:BoundField DataField="HoraRealDeSalida" HeaderText="HoraRealDeSalida" SortExpression="HoraRealDeSalida" />
                            <asp:BoundField DataField="HoraRealDeLlegada" HeaderText="HoraRealDeLlegada" SortExpression="HoraRealDeLlegada" />
                            <%--radiobutton--%>
                            <asp:TemplateField HeaderText="Seleccionar Vuelo">
                                <ItemTemplate>
                                    <asp:RadioButton ID="rbVuelo" runat="server" GroupName="SelectGroup"
                                        OnClick="Javascript:SelectRadiobutton(this)" OnCheckedChanged="rbVuelo_CheckedChanged" AutoPostBack="true" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                    <%--sqldatasource--%>
                    <asp:SqlDataSource ID="SqlDataSourceVuelos" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT Vuelos.IDVuelo, Itinerarios.HoraRealDeSalida, Itinerarios.HoraRealDeLlegada FROM Itinerarios INNER JOIN Vuelos ON Itinerarios.IDVuelo = Vuelos.IDVuelo INNER JOIN PuertasDeAbordajes ON Vuelos.IDPuertaDeAbordaje = PuertasDeAbordajes.IDPuertaDeAbordaje INNER JOIN Aeropuertos ON PuertasDeAbordajes.IDAeropuerto = Aeropuertos.IDAeropuerto WHERE (Itinerarios.Estado = 1) AND (Aeropuertos.IDAeropuerto = @ID) AND (convert(varchar(10),Itinerarios.HoraRealDeSalida,103) = @fecha)">
                        <SelectParameters>
                            <asp:Parameter Name="ID" Type="Int64" />
                            <asp:Parameter Name="fecha" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 155px; height: 26px;">Selecciones Asiento</td>
                <td style="height: 26px"></td>
            </tr>
            <tr>
                <td colspan="2"><%--gridview de ticketes--%>
                    <asp:GridView ID="gv_ticketes" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" DataSourceID="SqlDataSourceAsientosDisponibles" AutoGenerateColumns="False" DataKeyNames="IDItinerario">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IDItinerario" HeaderText="IDItinerario" SortExpression="IDItinerario" Visible="false" />
                            <asp:BoundField DataField="Fila" HeaderText="Fila" SortExpression="Fila" />
                            <asp:BoundField DataField="Numero" HeaderText="Numero" SortExpression="Numero" />
                            <asp:BoundField DataField="TipoDeAsiento" HeaderText="TipoDeAsiento" SortExpression="TipoDeAsiento" />
                            <asp:TemplateField HeaderText="Seleccionar Asiento">
                                <%--radiobutton--%>
                                <ItemTemplate>
                                    <asp:RadioButton ID="rbAsientos" runat="server" GroupName="SelectGroup2"
                                        OnClick="Javascript:SelectRadiobuttonDos(this)" OnCheckedChanged="rbAsientos_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                    <%--sqldatasource--%>
                    <asp:SqlDataSource ID="SqlDataSourceAsientosDisponibles" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="AsientosDisponibles" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="Fecha" Type="String" />
                            <asp:Parameter Name="IDVuelos" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <%--popup--%>
                    <asp:ScriptManager ID="scriptmanager" runat="server"></asp:ScriptManager>
                    <div id="dialog-form" title="Pago">
                        <table>
                            <tr>
                                <td>Numero de Tarjeta:</td>
                                <td>
                                    <asp:TextBox ID="txt_tarjeta" runat="server" CssClass="twitterStyleTextbox" MaxLength="20"></asp:TextBox></td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_tarjeta" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                                    ControlToValidate="txt_tarjeta" ErrorMessage="Ingrese solo numeros"
                                    ForeColor="Red"
                                    ValidationExpression="^[0-9]*">
                                </asp:RegularExpressionValidator>
                                <asp:Label ID="lb_precio" runat="server"></asp:Label>

                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btInsertar" runat="server" Text="Compra" OnClick="btInsertar_Click" CssClass="Button" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <button id="Popup" class="Button">Pago de Asiento</button>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
