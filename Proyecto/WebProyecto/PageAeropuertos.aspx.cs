using EntityProyecto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProyecto
{
    public partial class PageAeropuertos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// boton para ingresar nueva informacion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_ingresar_Click(object sender, EventArgs e)
        {
            Session["Data"] = 0;
            Response.Redirect("PageAeropuertos2.aspx");
        }

        /// <summary>
        /// linkbuton para ingresar una puerta de abordaje a un aeropuerto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbPuertas_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
            Session["Data"] = (GridView1.DataKeys[row.RowIndex].Value);
            Response.Redirect("PagePuertas.aspx");
        }

        /// <summary>
        /// linkbuton para editar informacion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbEditar_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
            Session["Data"] = (GridView1.DataKeys[row.RowIndex].Value);
            Response.Redirect("PageAeropuertos2.aspx");
        }

        /// <summary>
        /// linkbuton para desahabiliar un aeropuerto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbEliminar_Click(object sender, EventArgs e)
        {

            GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
            int id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.Aeropuertos
                            where a.IDAeropuerto == id
                            select a;
                foreach (var item in lista)
                {
                    item.Estado = false;
                }
                context.SaveChanges();
                GridView1.DataBind();
            }
        }
    }
}