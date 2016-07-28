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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }
        protected void lbEditar_Click(object sender, EventArgs e)
        {
            GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
            Session["Data"] = grdrow.Cells[1].Text;
            Response.Redirect("PageAerolineas2.aspx");



            //GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
            //string rowNumber = grdrow.Cells[0].Text;
            //string dealId = grdrow.Cells[1].Text;
            //string dealTitle = grdrow.Cells[2].Text;
        }

        protected void lbEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void lbVuelo_Click(object sender, EventArgs e)
        {
            GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
            Session["Data"] = grdrow.Cells[1].Text;
            Response.Redirect("PageVuelos.aspx");
        }
    }
}

