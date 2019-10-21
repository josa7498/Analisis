using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Proyecto.DAL;
using Proyecto.BL;
using System.Web.UI.WebControls;
using System.Windows.Controls;


namespace Proyecto.UI
{
    public partial class crearUsuario : System.Web.UI.Page
    {
        #region Variables
        Usuario usuario= new Usuario();
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
                BL.manteUsuario._Instancia.Insert(usuario);
            }
            catch (Exception ee)
            {
                throw;
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            GetValues(2);
            Proyecto.BL.manteUsuario._Instancia.Update(usuario);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            GetValues(0);
            Proyecto.BL.manteUsuario._Instancia.Delete(usuario);
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
                usuario.idUsuario = Convert.ToInt32(txtId.Text);
            }
            else if (flag == 1)
            {
                usuario.idUsuario = Convert.ToInt32(txtId.Text);
                usuario.usuario1 = txtUsuario.Text;
                usuario.clave = txtClave.Text;
                usuario.correo = txtCorreo.Text;
                usuario.idEstadoUsuario = Convert.ToInt32(txtEstado.Text);
                
            }
            else if (flag == 2)
            {
                usuario.idUsuario = Convert.ToInt32(txtId.Text);
                usuario.usuario1 = txtUsuario.Text;
                usuario.clave = txtClave.Text;
                usuario.correo = txtCorreo.Text;
                usuario.idEstadoUsuario = Convert.ToInt32(txtEstado.Text);
            }
        }
        public void BindData()
            {
                Session["gridview"] = BL.manteUsuario._Instancia.GetAll();
                gridview.DataSource = Session["gridview"];
                gridview.DataBind();
            }

            #endregion
        }
}