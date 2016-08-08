using EntityProyecto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProyecto
{
    public partial class PageTicketes : System.Web.UI.Page
    {
        protected Decimal monto;
        protected short numero;
        protected string fila;
        protected String tipo;
        protected long IDItinerario;
        protected Int64 IDPasajero;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rbVuelo_CheckedChanged(object sender, EventArgs e)
        {
            for (int i = 0; i < gv_vuelos.Rows.Count; i++)
            {
                RadioButton rb = (gv_vuelos.Rows[i].FindControl("rbVuelo")) as RadioButton;
                if (rb.Checked == true)
                {
                    GridViewRow row = (GridViewRow)((RadioButton)sender).NamingContainer;
                    string IDVuelo = gv_vuelos.DataKeys[row.RowIndex].Value.ToString();
                    SqlDataSourceAsientosDisponibles.SelectParameters["IDVuelos"].DefaultValue = IDVuelo;
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddl_pais_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_pais0.Items.Clear();
            ddl_pais0.Items.Insert(0, new ListItem("Seleccionar", ""));
            string pais = ddl_pais.SelectedValue;
            SqlDataSourceCuidad.SelectParameters["Pais"].DefaultValue = pais;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddl_pais0_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cuidad = ddl_pais0.SelectedValue;
            SqlDataSourceVuelos.SelectParameters["ID"].DefaultValue = cuidad;
            gv_vuelos.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddl_vuelos_SelectedIndexChanged(object sender, EventArgs e)
        {
            DateTime date = DateTime.Parse(ddl_vuelos.SelectedValue);
            SqlDataSourceVuelos.SelectParameters["fecha"].DefaultValue = date.ToString("dd/MM/yyyy");
            SqlDataSourceAsientosDisponibles.SelectParameters["Fecha"].DefaultValue = date.ToString("dd/MM/yyyy");
            gv_vuelos.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        private void insertPasajero()
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                Pasajeros pasajero = new Pasajeros();
                pasajero.Nombre = txt_nombre.Text.Trim();
                pasajero.PrimerApellido = txt_Papellido.Text.Trim();
                pasajero.SegundoApellido = txt_Sapellido.Text.Trim();
                pasajero.Telefono = txt_telefono.Text.Trim();
                pasajero.NumeroPasaporte = txt_pass.Text.Trim();
                pasajero.Pais = txt_pais.Text.Trim();
                context.Pasajeros.Add(pasajero);
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
        /// 
        /// </summary>
        /// <param name="pass"></param>
        /// <returns></returns>
        private Int64 buscarPasajero(string pass)
        {
            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.Pasajeros
                            where a.NumeroPasaporte == pass
                            select a;
                foreach (var item in lista)
                {
                    return item.IDPasajero;
                }
                return 0;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void btInsertar_Click(object sender, EventArgs e)
        {
            if (buscarPasajero(txt_pass.Text) == 0)
            {
                insertPasajero();
            }
            IDPasajero = buscarPasajero(txt_pass.Text);

            if (tipo == "Turista")
            {
                monto = 150;
            }
            else
            {
                monto = 500;
            }

            using (ProyectoEntities context = new ProyectoEntities())
            {
                DateTime time = DateTime.Now;

                context.OrdenesAsientos(time, txt_tarjeta.Text, txt_nombre.Text, txt_Papellido.Text, txt_Sapellido.Text, monto,
                    numero, tipo, monto, fila, IDItinerario, IDPasajero);
                monto = 0;
            }
            gv_ticketes.DataBind();
            gv_vuelos.DataBind();
            txt_nombre.Text = "";
            txt_Papellido.Text = "";
            txt_Sapellido.Text = "";
            txt_pais.Text = "";
            txt_pass.Text = "";
            txt_tarjeta.Text = "";
            txt_telefono.Text = "";
            ddl_pass.SelectedIndex = 0;
            ddl_pais0.SelectedIndex = 0;
            ddl_pais.SelectedIndex = 0;
            ddl_vuelos.SelectedIndex = 0; 
            SqlDataSourceAsientosDisponibles.SelectParameters["IDVuelos"].DefaultValue = null;
            SqlDataSourceCuidad.SelectParameters["Pais"].DefaultValue = null;
            SqlDataSourceVuelos.SelectParameters["ID"].DefaultValue = null;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rbAsientos_CheckedChanged(object sender, EventArgs e)
        {
            for (int i = 0; i < gv_ticketes.Rows.Count; i++)
            {
                RadioButton rb = (gv_ticketes.Rows[i].FindControl("rbAsientos")) as RadioButton;
                if (rb.Checked == true)
                {
                    GridViewRow row = (GridViewRow)((RadioButton)sender).NamingContainer;
                    IDItinerario = Int64.Parse(gv_ticketes.DataKeys[row.RowIndex].Value.ToString());

                    fila = gv_ticketes.Rows[i].Cells[1].Text;
                    numero = Convert.ToInt16(gv_ticketes.Rows[i].Cells[2].Text);
                    tipo = gv_ticketes.Rows[i].Cells[3].Text;

                    if (tipo == "Turista")
                    {
                        monto = 150;
                        lb_precio.Text = "Precio de boleto:" + monto;
                    }
                    else
                    {
                        monto = 500;
                        lb_precio.Text = "Precio de boleto: $500";
                    }
                }
            }
        }

        protected void ddl_pass_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(ddl_pass.SelectedValue);
            using (ProyectoEntities context = new ProyectoEntities())
            {
                var lista = from a in context.Pasajeros
                            where a.IDPasajero == id
                            select a;
                foreach (var item in lista)
                {
                    txt_nombre.Text = item.Nombre;
                    txt_Papellido.Text = item.PrimerApellido;
                    txt_Sapellido.Text = item.SegundoApellido;
                    txt_pass.Text = item.NumeroPasaporte;
                    txt_pais.Text = item.Pais;
                    txt_telefono.Text = item.Telefono;
                }
               
            }
        }
    }
}