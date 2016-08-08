using EntityProyecto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProyecto
{
    public partial class PageVuelos2 : System.Web.UI.Page
    {
        private Int32 id;//id de Aerolinea
        private Int32 id2;//id de Vuelos

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Session["Data"]);//id de Aerolinea
            id2 = Convert.ToInt32(Session["Data2"]);//id de Vuelos

            //verifica si es editar o ingreso nuevo
            if (!IsPostBack)
            {
                if (verificacion(id2) == false)
                {
                    cargarDatos();
                    ddl_Asientos.Enabled = false;
                }
            }
        }

        /// <summary>
        /// ingresar o editar informacion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_ingresar_Click(object sender, EventArgs e)
        {
            if (verificacion(id2) == false)
            {
                actualizarDatos();
                Response.Redirect("PageVuelos.aspx");
            }
            else
            {
                if (existe(txt_codigo.Text) == false)
                {
                    ingresarDatos();
                    ingresarAsientos();
                    Response.Redirect("PageVuelos.aspx");
                }
                else
                {
                    txt_codigo.Text = null;
                    lbl_mensaje.Text = "Error: Este Codigo ya esta registrado";
                }
            }
        }

        /// <summary>
        /// verificacion si existe el codigo en la base de datos
        /// </summary>
        private Boolean existe(string codigo)
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.Vuelos
                            where a.Codigo.Equals(codigo)
                            select a;
                foreach (var item in lista)
                {
                    return true;
                }
                return false;
            }
        }

        /// <summary>
        /// redireccion a la pagina anterior
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("PageVuelos.aspx");
        }

        /// <summary>
        /// cargar paises registrados
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCuidad.Items.Clear();
            ddlCuidad.Items.Insert(0, new ListItem("Seleccionar", ""));
            ddlTerminal.Items.Clear();
            ddlTerminal.Items.Insert(0, new ListItem("Seleccionar", ""));
            ddlPuerta.Items.Clear();
            ddlPuerta.Items.Insert(0, new ListItem("Seleccionar", ""));
            String Pais = ddlPais.SelectedValue;
            SqlDSCuidad.SelectParameters["Pais"].DefaultValue = Pais;
        }

        /// <summary>
        /// cargar cuidades segun el pais
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlCuidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlTerminal.Items.Clear();
            ddlTerminal.Items.Insert(0, new ListItem("Seleccionar", ""));
            ddlPuerta.Items.Clear();
            ddlPuerta.Items.Insert(0, new ListItem("Seleccionar", ""));
            string id = ddlCuidad.SelectedValue;
            SqlDSTerminal.SelectParameters["IDAeropuerto"].DefaultValue = id;
        }

        /// <summary>
        /// cargar terminal segun la cuidad
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlTerminal_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlPuerta.Items.Clear();
            ddlPuerta.Items.Insert(0, new ListItem("Seleccionar", ""));
            string id = ddlCuidad.SelectedValue;
            string terminal = ddlTerminal.SelectedValue;
            SqlDSNumero.SelectParameters["Terminal"].DefaultValue = terminal;
            SqlDSNumero.SelectParameters["IDAeropuerto"].DefaultValue = id;
        }

        /// <summary>
        /// carga datos en el formulario
        /// </summary>
        private void cargarDatos()
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.Vuelos
                            join p in context.PuertasDeAbordajes on a.IDPuertaDeAbordaje equals p.IDPuertaDeAbordaje
                            join ae in context.Aeropuertos on p.IDAeropuerto equals ae.IDAeropuerto
                            where a.IDVuelo == id2
                            select new { a.Codigo, a.TipoDeAvion, a.HoraDeSalida, a.HoraDeLlegada, p.Terminal, p.IDPuertaDeAbordaje, ae.Pais, ae.IDAeropuerto };
                foreach (var item in lista)
                {
                    txt_codigo.Text = item.Codigo;
                    txt_avion.Text = item.TipoDeAvion;
                    txt_salida.Text = item.HoraDeSalida.ToString();
                    txt_llegada.Text = item.HoraDeLlegada.ToString();
                    ddlPais.SelectedValue = item.Pais;
                    SqlDSCuidad.SelectParameters["Pais"].DefaultValue = item.Pais;
                    ddlCuidad.SelectedValue = item.IDAeropuerto.ToString();
                    SqlDSTerminal.SelectParameters["IDAeropuerto"].DefaultValue = item.IDAeropuerto.ToString();
                    ddlTerminal.SelectedValue = item.Terminal.ToString();
                    SqlDSNumero.SelectParameters["Terminal"].DefaultValue = item.Terminal.ToString();
                    SqlDSNumero.SelectParameters["IDAeropuerto"].DefaultValue = item.IDAeropuerto.ToString();
                    ddlPuerta.SelectedValue = item.IDPuertaDeAbordaje.ToString();
                }
            }
        }

        /// <summary>
        /// actualiza informacion
        /// </summary>
        private void actualizarDatos()
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.Vuelos
                            where a.IDVuelo == id2
                            select a;
                foreach (var item in lista)
                {
                    item.Codigo = txt_codigo.Text.Trim();
                    item.TipoDeAvion = txt_avion.Text.Trim();
                    item.HoraDeSalida = DateTime.Parse(txt_salida.Text);
                    item.HoraDeLlegada = DateTime.Parse(txt_llegada.Text);
                    item.IDPuertaDeAbordaje = Int32.Parse(ddlPuerta.SelectedValue);
                }
                try
                {
                    context.SaveChanges();
                }
                catch (Exception e)
                {
                    Response.Write("<script language=javascript> alert('" + e.Message + "'); </script>");
                }
            }
        }

        /// <summary>
        /// Ingresar una aerolinea en la base de datos
        /// </summary>
        private void ingresarDatos()
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                Vuelos vuelo = new Vuelos();
                vuelo.Codigo = txt_codigo.Text.Trim();
                vuelo.TipoDeAvion = txt_avion.Text.Trim();
                vuelo.HoraDeSalida = DateTime.Parse(txt_salida.Text);
                vuelo.HoraDeLlegada = DateTime.Parse(txt_llegada.Text);
                vuelo.IDAerolinea = id;
                vuelo.IDPuertaDeAbordaje = Int32.Parse(ddlPuerta.SelectedValue);
                vuelo.Estado = true;
                context.Vuelos.Add(vuelo);
                try
                {
                    context.SaveChanges();
                }
                catch (Exception)
                {
                }
            }
        }

        /// <summary>
        /// verificacion si es editar o nuevo ingreso
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        private bool verificacion(int id2)
        {
            if (id2 == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// agregar asientos vinculados al nuevo vueo ingresado
        /// </summary>
        private void ingresarAsientos()
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                int asientos = int.Parse(ddl_Asientos.SelectedValue);
                if (asientos == 1)
                {
                    context.AsientosMin(vuelo());
                }
                else
                {
                    context.AsientosMax(vuelo());
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="codigo"></param>
        /// <returns></returns>
        private Int64 vuelo()
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.Vuelos
                            where a.Codigo == txt_codigo.Text
                            select a;
                foreach (var item in lista)
                {
                    return item.IDVuelo;
                }
                return 0;
            }
        }
    }
}