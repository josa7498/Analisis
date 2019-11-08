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
            Campana campana = new Campana()
            {
                idTipoCampana=1,
                idSede=1
            };

            return View(campana);
        }

        // POST: Campaña/Create
        [HttpPost]
        public ActionResult Create(Campana c)
        {

        
            //try
            //{
            //    // TODO: Add insert logic here

            //    return RedirectToAction("Index");
            //}
            //catch
            //{
            //    return View();
            //}
            return View();
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
                // TODO: Add update logic here

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
    }
}
