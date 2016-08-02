using EntityProyecto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProyecto
{

    public partial class PageAerolineas2 : System.Web.UI.Page, IDisposable
    {
        //variable que guarda id de aerolinea
        private Int32 id;

        /// <summary>
        /// cargar datos si es para modificar
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
        /// carga datos en el formulario
        /// </summary>
        private void cargarDatos()
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.Aerolineas
                            where a.IDAerolinea == id
                            select a;
                foreach (var item in lista)
                {
                    txt_codigo.Text = item.Codigo;
                    txt_nombre.Text = item.Nombre;
                    txt_descrip.Text = item.Descripcion;
                }
            }
        }

        /// <summary>
        /// actualiza datos
        /// </summary>
        private void actualizarDatos()
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.Aerolineas
                            where a.IDAerolinea == id
                            select a;
                foreach (var item in lista)
                {
                    item.Codigo = txt_codigo.Text.Trim();
                    item.Nombre = txt_codigo.Text.Trim();
                    item.Descripcion = txt_descrip.Text.Trim();
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
                Aerolineas aerolinea = new Aerolineas();
                aerolinea.Codigo = txt_codigo.Text.Trim();
                aerolinea.Nombre = txt_nombre.Text.Trim();
                aerolinea.Descripcion = txt_descrip.Text.Trim();
                aerolinea.Estado = true;
                context.Aerolineas.Add(aerolinea);
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
        /// redireccion a la pagina anterior
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("PageAerolineas.aspx");
        }

        /// <summary>
        /// ingresa o edita segun lo solicite
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_ingresar_Click(object sender, EventArgs e)
        {
            if (verificacion(id) == false)
            {
                actualizarDatos();
                Response.Redirect("PageAerolineas.aspx");
            }
            else
            {
                ingresarDatos();
                Response.Redirect("PageAerolineas.aspx");
            }
        }
    }
}
