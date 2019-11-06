using Proyecto.UI.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Proyecto.UI.Controllers
{
    public class LoginController : Controller
    {
        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataReader dr;
        // GET: Account
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        void connectionString()
        {
            con.ConnectionString = @"data source=LAPTOP-C302HPQA; database=RMClient; integrated security = SSPI;";
        }
        [HttpPost]
        public ActionResult Verify(LoginContro acc)
        {
            connectionString();
            con.Open();
            com.Connection = con;
            com.CommandText = "select * from acceso where username='" + acc.usuario + "' and password='" + acc.clave + "'";
            dr = com.ExecuteReader();
            if (dr.Read())
            {
                con.Close();
                return View("Create");
            }
            else
            {
                con.Close();
                return View("Error");
            }


        }
    }
}