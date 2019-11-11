using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Proyecto.UI.Models;

namespace Proyecto.UI.Controllers
{
    public class ClienteController : Controller
    {
        // GET: Cliente
        public ActionResult Index()
        {
            var db = new Models.RMClientEntity();
            //db.Campana.ToList();    


            return View(db.Cliente.ToList());

        }

        // GET: Cliente/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Cliente/Create
        public ActionResult Create()
        {
         
            var db = new Models.RMClientEntity();
            ViewBag.TipoCliente = new SelectList(db.TipoCliente, "idTipoCliente", "nombre");
            ViewBag.idGenero = new SelectList(db.Genero, "idGenero", "nombre");
            ViewBag.idOcupacion = new SelectList(db.Ocupacion, "idOcupacion", "nombre");
            ViewBag.idProvincia = new SelectList(db.Provincia, "idProvincia", "nombre");
            ViewBag.idCanton = new SelectList(db.Canton, "idCanton", "nombre");
            ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre");
            ViewBag.idVehiculoInteres = new SelectList(db.Vehiculo, "idVehiculo", "marca");
            ViewBag.idEstadoCliente = new SelectList(db.EstadoCliente, "idEstadoCliente", "nombre");
            Cliente cliente = new Cliente()
            {
                idTipoCliente = 1,
                idGenero = "O"
            };

            return View(cliente);

        }

        // POST: Cliente/Create
        [HttpPost]
        public ActionResult Create(Cliente c)
        {
            try
            {
                using (RMClientEntity db = new RMClientEntity())
                {

                    db.Cliente.Add(c);
                    db.SaveChanges();
                    return RedirectToAction("Index");

                }

            }
            catch (Exception ex)
            {
                ModelState.AddModelError("Error al validar", ex);
                return View();

            }
        }

        // GET: Cliente/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Cliente/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Cliente/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Cliente/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
