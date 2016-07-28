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
        private string data;

        protected void Page_Load(object sender, EventArgs e)
        {
            data = (string)(Session["Data"]);
            guardar.ServerClick += new EventHandler(controlClick);

            if (data != null)
            {

            }
        }

        protected void controlClick(object sender, EventArgs e)
        {
            if (data != null)
            {

            }
            else
            {
                ingresarDatos();
            }
        }

        private void cargarDatos()
        {

        }

        private void actualizarDatos()
        {

        }

        private void ingresarDatos()
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                Aerolineas aerolinea = new Aerolineas();
                aerolinea.Codigo = txt_codigo.Text;
                aerolinea.Nombre = txt_nombre.Text;
                aerolinea.Descripcion = txt_descrip.Text;
                aerolinea.Estado = true;
                context.Aerolineas.Add(aerolinea);
                context.SaveChanges();
            }
        }
    }
}
