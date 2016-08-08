<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PageHistorial.aspx.cs" Inherits="WebProyecto.PageHistorial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <%--Gridview--%>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceHistorial" ForeColor="Black" GridLines="Vertical" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                    <ItemTemplate>
                        <%--concatenacion para nombre completo--%>
                        <%# Eval("Nombre")+" "+Eval("PrimerApellido")+" "+Eval("SegundoApellido") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="NumeroPasaporte" HeaderText="NumeroPasaporte" SortExpression="NumeroPasaporte" />
                <asp:TemplateField HeaderText="Asiento" SortExpression="Asiento">
                    <ItemTemplate>
                        <%--concatenacion para asiento--%>
                        <%# Eval("TipoDeAsiento")+": "+Eval("Fila")+"/"+Eval("Numero")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="HoraRealDeSalida" HeaderText="HoraRealDeSalida" SortExpression="HoraRealDeSalida" />
                <asp:BoundField DataField="HoraRealDeLlegada" HeaderText="HoraRealDeLlegada" SortExpression="HoraRealDeLlegada" />
                <asp:BoundField DataField="Expr2" HeaderText="Aerolinea" SortExpression="Expr1" />
                <asp:BoundField DataField="TipoDeAvion" HeaderText="Tipo De Avion" SortExpression="TipoDeAvion" />
                <asp:BoundField DataField="PaisOrigen" HeaderText="Origen" SortExpression="PaisOrigen" />
                <asp:BoundField DataField="PaisDestino" HeaderText="Destino" SortExpression="PaisDestino" />
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
        <%--sqlDataSource--%>
        <asp:SqlDataSource ID="SqlDataSourceHistorial" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOConnectionString %>" SelectCommand="SELECT ordenesdecompras.FechaPago,Pasajeros.Nombre, Pasajeros.PrimerApellido, Pasajeros.SegundoApellido, Pasajeros.NumeroPasaporte, AsientosDeItinerarios.Numero, AsientosDeItinerarios.TipoDeAsiento, AsientosDeItinerarios.Fila, Itinerarios.HoraRealDeSalida, Itinerarios.HoraRealDeLlegada, Vuelos.TipoDeAvion, Aeropuertos.Pais AS PaisDestino, Pasajeros.Pais AS PaisOrigen, Aerolineas.Nombre AS Expr2 FROM Pasajeros 
        INNER JOIN AsientosDeItinerarios ON Pasajeros.IDPasajero = AsientosDeItinerarios.IDPasajero INNER JOIN ordenesdecompras ON AsientosDeItinerarios.idordendecompra=ordenesdecompras.idordendecompra INNER JOIN
        Itinerarios ON AsientosDeItinerarios.IDItinerario = Itinerarios.IDItinerario INNER JOIN Vuelos ON Itinerarios.IDVuelo = Vuelos.IDVuelo INNER JOIN Aerolineas ON Vuelos.IDAerolinea = Aerolineas.IDAerolinea INNER JOIN PuertasDeAbordajes ON Vuelos.IDPuertaDeAbordaje = PuertasDeAbordajes.IDPuertaDeAbordaje INNER JOIN Aeropuertos ON PuertasDeAbordajes.IDAeropuerto = Aeropuertos.IDAeropuerto ORDER BY ordenesdecompras .FechaPago DESC "></asp:SqlDataSource>
    </form>

</asp:Content>
