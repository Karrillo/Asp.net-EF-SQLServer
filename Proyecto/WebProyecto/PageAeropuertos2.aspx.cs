using EntityProyecto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProyecto
{
    public partial class PageAeropuertos2 : System.Web.UI.Page
    {
        private Int32 id;

        /// <summary>
        /// resive un int para verificar si es un editar o nuevo ingreso de informacion 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //id de aerolinea ha editar
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
        /// carga datos en el formulario
        /// </summary>
        private void cargarDatos()
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.Aeropuertos
                            where a.IDAeropuerto == id
                            select a;
                foreach (var item in lista)
                {
                    txt_pais.Text = item.Pais;
                    txt_cuidad.Text = item.Cuidad;
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
                var lista = from a in context.Aeropuertos
                            where a.IDAeropuerto == id
                            select a;
                foreach (var item in lista)
                {
                    item.Pais = txt_pais.Text.Trim();
                    item.Cuidad = txt_cuidad.Text.Trim();
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
                Aeropuertos aeropuerto = new Aeropuertos();
                aeropuerto.Pais = txt_pais.Text.Trim();
                aeropuerto.Cuidad = txt_cuidad.Text.Trim();
                aeropuerto.Estado = true;
                context.Aeropuertos.Add(aeropuerto);
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
        /// boton el cual redirecciona a la pagina anterior
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("PageAeropuertos.aspx");
        }

        /// <summary>
        /// boton el cual ingresa o edita segun lo solicitado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_ingresar_Click(object sender, EventArgs e)
        {
            if (verificacion(id) == false)
            {
                actualizarDatos();
                Response.Redirect("PageAeropuertos.aspx");
            }
            else
            {
                if (existe(txt_cuidad.Text,txt_pais.Text) == false)
                {
                    ingresarDatos();
                    Response.Redirect("PageAeropuertos.aspx");
                }
                else
                {
                    txt_cuidad.Text = null;
                    txt_pais.Text = null;
                    lb_mensaje.Text = "Error: Este Aeropuerto ya existe";
                }
            }
        }

        /// <summary>
        /// verificacion si existe el codigo en la base de datos
        /// </summary>
        private Boolean existe(string cuidad,string pais)
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.Aeropuertos
                            where a.Cuidad.Equals(cuidad) && a.Pais.Equals(pais)
                            select a;
                foreach (var item in lista)
                {
                    return true;
                }
                return false;
            }
        }
    }
}