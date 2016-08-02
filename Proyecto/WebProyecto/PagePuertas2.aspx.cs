using EntityProyecto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProyecto
{
    public partial class PagePuertas2 : System.Web.UI.Page
    {
        private Int32 id;//id de aeropuertos
        private Int32 id2;//id de puertas

        /// <summary>
        /// verifica si es nuevo ingreso o editar para cargar los datos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Session["Data"]);
            id2 = Convert.ToInt32(Session["Data2"]);

            //verifica si es editar o ingreso nuevo
            if (!IsPostBack)
            {
                if (verificacion(id2) == false)
                {
                    cargarDatos();
                }
            }
        }

        /// <summary>
        /// carga datos en el formulario
        /// </summary>
        private void cargarDatos()
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.PuertasDeAbordajes
                            where a.IDPuertaDeAbordaje == id2
                            select a;
                foreach (var item in lista)
                {
                    txt_codigo.Text = item.Codigo;
                    txt_terminal.Text = item.Terminal.ToString();
                    txt_numero.Text = item.NumeroDePuerta.ToString();
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
                var lista = from a in context.PuertasDeAbordajes
                            where a.IDPuertaDeAbordaje == id2
                            select a;
                foreach (var item in lista)
                {
                    item.Codigo = txt_codigo.Text.Trim();
                    item.Terminal = short.Parse(txt_terminal.Text.Trim());
                    item.NumeroDePuerta = short.Parse(txt_numero.Text.Trim());
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
                PuertasDeAbordajes puerta = new PuertasDeAbordajes();
                puerta.Codigo = txt_codigo.Text.Trim();
                puerta.Terminal = short.Parse(txt_terminal.Text.Trim());
                puerta.NumeroDePuerta = short.Parse(txt_numero.Text.Trim());
                puerta.Estado = true;
                puerta.IDAeropuerto = id;
                context.PuertasDeAbordajes.Add(puerta);
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
        /// verificacion si es editar o nuevo ingreso
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        private bool verificacion(int id)
        {
            if (id == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// ingresa un nuevo dato o edita la informacion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_ingresar_Click(object sender, EventArgs e)
        {
            if (verificacion(id2) == false)
            {
                actualizarDatos();
                Response.Redirect("PagePuertas.aspx");
            }
            else
            {
                ingresarDatos();
                Response.Redirect("PagePuertas.aspx");
            }
        }

        /// <summary>
        /// redirecciona a la pagina anterior
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("PagePuertas.aspx");
        }
    }
}