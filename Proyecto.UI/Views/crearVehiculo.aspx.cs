using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Proyecto.DAL;
using Proyecto.BL;
using System.Web.UI.WebControls;

namespace Proyecto.UI
{
    public partial class crearVehiculo : System.Web.UI.Page
    {
        #region Variables
        Vehiculo Vehiculo = new Vehiculo();
        #endregion

        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
            else
            {

            }
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            try
            {
                GetValues(1);
                BL.manteVehiculos._Instancia.Insert(Vehiculo);
            }
            catch (Exception ee)
            {
                throw;
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            GetValues(2);
            Proyecto.BL.manteVehiculos._Instancia.Update(Vehiculo);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            GetValues(0);
            Proyecto.BL.manteVehiculos._Instancia.Delete(Vehiculo);
        }

        protected void btnMostrar_Click(object sender, EventArgs e)
        {
            BindData();
        }

        #endregion

        #region Methods

        public void GetValues(int flag)
        {
            // Delete 
            if (flag == 0)
            {
                Vehiculo.idVehiculo = Convert.ToInt32(txtId.Text);
            }
            else if (flag == 1)
            {
                Vehiculo.idVehiculo = Convert.ToInt32(txtId.Text);
                Vehiculo.idProveedor = Convert.ToInt32(txtProveedor.Text);
                Vehiculo.idTipoVehiculo = Convert.ToInt32(txtTipo.Text);
                Vehiculo.codigo = txtCodigo.Text;
                Vehiculo.marca = txtMarca.Text;
                Vehiculo.modelo = txtModelo.Text;
                Vehiculo.parametroVersion = txtParametros.Text;
                Vehiculo.annio = Convert.ToInt32(txtAnnio.Text);
                Vehiculo.cantidadDisponible = Convert.ToInt32(txtCantidad.Text);
                Vehiculo.fechaIngreso = Calendar1.SelectedDate;
                Vehiculo.fechaSalida = Calendar2.SelectedDate;
            }
            else if (flag == 2)
            {
                Vehiculo.idVehiculo = Convert.ToInt32(txtId.Text);
                Vehiculo.idProveedor = Convert.ToInt32(txtProveedor.Text);
                Vehiculo.idTipoVehiculo = Convert.ToInt32(txtTipo.Text);
                Vehiculo.codigo = txtCodigo.Text;
                Vehiculo.marca = txtMarca.Text;
                Vehiculo.modelo = txtModelo.Text;
                Vehiculo.parametroVersion = txtParametros.Text;
                Vehiculo.annio = Convert.ToInt32(txtAnnio.Text);
                Vehiculo.cantidadDisponible = Convert.ToInt32(txtCantidad.Text);
                Vehiculo.fechaIngreso = Calendar1.SelectedDate;
                Vehiculo.fechaSalida = Calendar2.SelectedDate;
            }


        }

        public void BindData()
        {
            Session["gridview"] = BL.manteVehiculos._Instancia.GetAll();
            gridview.DataSource = Session["gridview"];
            gridview.DataBind();
        }

        #endregion
    }
}