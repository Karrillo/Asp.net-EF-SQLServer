using EntityProyecto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProyecto
{
    public partial class PageItinerarios : System.Web.UI.Page
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
            Response.Redirect("PageItinerarios2.aspx");
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
            Response.Redirect("PageItinerarios2.aspx");
        }

        /// <summary>
        /// linkbuton para desahabilitar itinerario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbEliminar_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
            int id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.Itinerarios
                            where a.IDItinerario == id
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