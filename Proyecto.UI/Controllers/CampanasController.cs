using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Proyecto.UI.Models;

namespace Proyecto.UI.Controllers
{
    public class CampanasController : Controller
    {
        private RMClientEntity db = new RMClientEntity();

        // GET: Campanas
        public ActionResult Index()
        {
            var campana = db.Campana.Include(c => c.Canton).Include(c => c.Empleado).Include(c => c.Empleado1).Include(c => c.EstadoCampana).Include(c => c.Sede).Include(c => c.TipoCampana);
            return View(campana.ToList());
        }

        // GET: Campanas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Campana campana = db.Campana.Find(id);
            if (campana == null)
            {
                return HttpNotFound();
            }
            return View(campana);
        }

        // GET: Campanas/Create
        public ActionResult Create()
        {
            ViewBag.idCanton = new SelectList(db.Canton, "idCanton", "nombre");
            ViewBag.idEmpleadoAprobador = new SelectList(db.Empleado, "idEmpleado", "cedula");
            ViewBag.idEmpleadoCreador = new SelectList(db.Empleado, "idEmpleado", "cedula");
            ViewBag.idEstadoCampana = new SelectList(db.EstadoCampana, "idEstadoCampana", "nombre");
            ViewBag.idSede = new SelectList(db.Sede, "idSede", "nombre");
            ViewBag.idTipoCampana = new SelectList(db.TipoCampana, "idTipoCampana", "nombre");
            return View();
        }

        // POST: Campanas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idCampana,idTipoCampana,idSede,idEstadoCampana,nombre,descripcion,idProvincia,idCanton,fechaInicio,fechaFinal,descuentoMinimo,descuentoMaximo,idEmpleadoCreador,idEmpleadoAprobador")] Campana campana)
        {
            if (ModelState.IsValid)
            {
                db.Campana.Add(campana);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idCanton = new SelectList(db.Canton, "idCanton", "nombre", campana.idCanton);
            ViewBag.idEmpleadoAprobador = new SelectList(db.Empleado, "idEmpleado", "cedula", campana.idEmpleadoAprobador);
            ViewBag.idEmpleadoCreador = new SelectList(db.Empleado, "idEmpleado", "cedula", campana.idEmpleadoCreador);
            ViewBag.idEstadoCampana = new SelectList(db.EstadoCampana, "idEstadoCampana", "nombre", campana.idEstadoCampana);
            ViewBag.idSede = new SelectList(db.Sede, "idSede", "nombre", campana.idSede);
            ViewBag.idTipoCampana = new SelectList(db.TipoCampana, "idTipoCampana", "nombre", campana.idTipoCampana);
            return View(campana);
        }

        // GET: Campanas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Campana campana = db.Campana.Find(id);
            if (campana == null)
            {
                return HttpNotFound();
            }
            ViewBag.idCanton = new SelectList(db.Canton, "idCanton", "nombre", campana.idCanton);
            ViewBag.idEmpleadoAprobador = new SelectList(db.Empleado, "idEmpleado", "cedula", campana.idEmpleadoAprobador);
            ViewBag.idEmpleadoCreador = new SelectList(db.Empleado, "idEmpleado", "cedula", campana.idEmpleadoCreador);
            ViewBag.idEstadoCampana = new SelectList(db.EstadoCampana, "idEstadoCampana", "nombre", campana.idEstadoCampana);
            ViewBag.idSede = new SelectList(db.Sede, "idSede", "nombre", campana.idSede);
            ViewBag.idTipoCampana = new SelectList(db.TipoCampana, "idTipoCampana", "nombre", campana.idTipoCampana);
            return View(campana);
        }

        // POST: Campanas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idCampana,idTipoCampana,idSede,idEstadoCampana,nombre,descripcion,idProvincia,idCanton,fechaInicio,fechaFinal,descuentoMinimo,descuentoMaximo,idEmpleadoCreador,idEmpleadoAprobador")] Campana campana)
        {
            if (ModelState.IsValid)
            {
                db.Entry(campana).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCanton = new SelectList(db.Canton, "idCanton", "nombre", campana.idCanton);
            ViewBag.idEmpleadoAprobador = new SelectList(db.Empleado, "idEmpleado", "cedula", campana.idEmpleadoAprobador);
            ViewBag.idEmpleadoCreador = new SelectList(db.Empleado, "idEmpleado", "cedula", campana.idEmpleadoCreador);
            ViewBag.idEstadoCampana = new SelectList(db.EstadoCampana, "idEstadoCampana", "nombre", campana.idEstadoCampana);
            ViewBag.idSede = new SelectList(db.Sede, "idSede", "nombre", campana.idSede);
            ViewBag.idTipoCampana = new SelectList(db.TipoCampana, "idTipoCampana", "nombre", campana.idTipoCampana);
            return View(campana);
        }

        // GET: Campanas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Campana campana = db.Campana.Find(id);
            if (campana == null)
            {
                return HttpNotFound();
            }
            return View(campana);
        }

        // POST: Campanas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Campana campana = db.Campana.Find(id);
            db.Campana.Remove(campana);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult CalendarioCampana()
        {
            return View();
        }


    }
    }

