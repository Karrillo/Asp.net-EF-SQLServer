using EntityProyecto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProyecto
{
    public partial class PageItinerarios2_aspx : System.Web.UI.Page
    {
        private Int32 id;

        /// <summary>
        /// carga informacion y verifica si es editar o ingreso de nueva informacion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Session["Data"]);
            //verifica si es editar o ingreso nuevo
            if (!IsPostBack)
            {
                if (verificacion(id) == false)
                {
                    cargarDatos();
                }
            }
        }

        /// <summary>
        /// carga informacion de componentes
        /// </summary>
        private void cargarDatos()
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.Itinerarios
                            where a.IDItinerario == id
                            select a;
                foreach (var item in lista)
                {
                    txt_salida.Text = item.HoraRealDeSalida.ToString();
                    txt_llegada.Text = item.HoraRealDeLlegada.ToString();
                    DropDownList1.SelectedValue = Convert.ToString(item.IDVuelo);
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
                var lista = from a in context.Itinerarios
                            where a.IDItinerario == id
                            select a;
                foreach (var item in lista)
                {
                    item.IDVuelo = int.Parse(DropDownList1.SelectedValue);
                    item.HoraRealDeSalida = DateTime.Parse(txt_salida.Text);
                    item.HoraRealDeLlegada = DateTime.Parse(txt_llegada.Text);
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
                Itinerarios itinerario = new Itinerarios();
                itinerario.IDVuelo = int.Parse(DropDownList1.SelectedValue);
                itinerario.HoraRealDeSalida = DateTime.Parse(txt_salida.Text);
                itinerario.HoraRealDeLlegada = DateTime.Parse(txt_llegada.Text);
                itinerario.Estado = true;
                context.Itinerarios.Add(itinerario);
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
        /// ingresa o edita informacion al evento click del boton de ingreso
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_ingresar_Click(object sender, EventArgs e)
        {
            if (verificacion(id) == false)
            {
                actualizarDatos();
                Response.Redirect("PageItinerarios.aspx");
            }
            else
            {
                ingresarDatos();
                Response.Redirect("PageItinerarios.aspx");
            }
        }

        /// <summary>
        /// redirecciona a la pagina anterior
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("PageItinerarios.aspx");
        }
    }
}