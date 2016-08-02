using EntityProyecto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProyecto
{
    public partial class PagePuertas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// redirecciona al formulario para nuevo ingreso de informacion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_ingresar_Click(object sender, EventArgs e)
        {
            Session["Data2"] = 0;
            Response.Redirect("PagePuertas2.aspx");
        }

        /// <summary>
        /// redirecciona al formulario para editar informacion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbEditar_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
            Session["Data2"] = (GridView1.DataKeys[row.RowIndex].Value);
            Response.Redirect("PagePuertas2.aspx");
        }

        /// <summary>
        /// linkbuton para desahabiliar una puerta
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbEliminar_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
            int id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.PuertasDeAbordajes
                            where a.IDPuertaDeAbordaje == id
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