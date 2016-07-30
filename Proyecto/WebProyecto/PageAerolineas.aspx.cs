using EntityProyecto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProyecto
{
    public partial class PageAerolineas : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {    
        }

        /// <summary>
        /// linkbutton el cual redirecciona al PageAerolineas2 dos para editar informacion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbEditar_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
            Session["Data"] = (gvAerolineas.DataKeys[row.RowIndex].Value);
            Response.Redirect("PageAerolineas2.aspx");
        }

        /// <summary>
        /// Desactivar aerolinea
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbEliminar_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
            int id = Convert.ToInt32(gvAerolineas.DataKeys[row.RowIndex].Value);

            using (ProyectoEntities context = new ProyectoEntities()) {
                var lista = from a in context.Aerolineas
                            where a.IDAerolinea == id
                            select a;
                foreach (var item in lista)
                {
                    item.Estado = false;
                }
                context.SaveChanges();
                gvAerolineas.DataBind();
            }
        }

        /// <summary>
        /// linkbutton el cual redirecciona al PageVuelo dos para ingresar nueva informacion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbVuelo_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
            Session["Data"] = (gvAerolineas.DataKeys[row.RowIndex].Value);
            Response.Redirect("PageVuelos.aspx");
        }

        /// <summary>
        /// redireccion a PageAerolineas2.aspx
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_ingresar_Click(object sender, EventArgs e)
        {
            Session["Data"] = 0;
            Response.Redirect("PageAerolineas2.aspx");
        }
    }
}

