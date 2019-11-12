using Proyecto.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Proyecto.UI.Controllers
{
    public class CampañaController : Controller
    {

        // GET: Campaña
        public ActionResult Index()
        {
            var db = new Models.RMClientEntity();
            //db.Campana.ToList();    


            return View(db.Campana.ToList());
        }

        // GET: Campaña/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }


        // GET: Campaña/Create
        public ActionResult Create()
        {
            var db = new Models.RMClientEntity();
            ViewBag.TipoCampana = new SelectList(db.TipoCampana, "idTipoCampana", "nombre");
            ViewBag.Sede = new SelectList(db.Sede, "idSede", "nombre");
            ViewBag.Provincia = new SelectList(db.Provincia, "idProvincia", "nombre");
            ViewBag.Canton = new SelectList(db.Canton, "idCanton", "nombre");
            ViewBag.Empleado = new SelectList(db.Empleado, "idEmpleado", "nombre");
            Campana campana = new Campana()
            {
                idTipoCampana=1,
                idSede=1,
                idProvincia=1,
                idEmpleadoCreador=1
            };

            return View(campana);
        }

        // POST: Campaña/Create
        [HttpPost]
        public ActionResult Create(Campana c)
        {
            //if (!ModelState.IsValid)
            //    return View();
            try
            {
                using (RMClientEntity db = new RMClientEntity())
                { 
                    db.Campana.Add(c);
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

        // GET: Campaña/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Campaña/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
             return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Campaña/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Campaña/Delete/5
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

        public ActionResult CalendarioCampana()
        {
          
                return View();
            
        }
    }
}
