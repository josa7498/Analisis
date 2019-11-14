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
    public class DetalleCotizacionsController : Controller
    {
        private RMClientEntity db = new RMClientEntity();

        // GET: DetalleCotizacions
        public ActionResult Index()
        {
            var detalleCotizacion = db.DetalleCotizacion.Include(d => d.EncabezadoCotizacion).Include(d => d.Vehiculo);
            return View(detalleCotizacion.ToList());
        }

        // GET: DetalleCotizacions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleCotizacion detalleCotizacion = db.DetalleCotizacion.Find(id);
            if (detalleCotizacion == null)
            {
                return HttpNotFound();
            }
            return View(detalleCotizacion);
        }

        // GET: DetalleCotizacions/Create
        public ActionResult Create()
        {
            ViewBag.idEncabezadoCotizacion = new SelectList(db.EncabezadoCotizacion, "idEncabezadoCotizacion", "idEncabezadoCotizacion");
            ViewBag.idVehiculo = new SelectList(db.Vehiculo, "idVehiculo", "codigo");
            return View();
        }

        // POST: DetalleCotizacions/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idDetalleCotizacion,idEncabezadoCotizacion,idVehiculo,cantidad,porcentajeDescuento,precio,montoDescuento,montoImpuesto,montoTotal")] DetalleCotizacion detalleCotizacion)
        {
            if (ModelState.IsValid)
            {
                db.DetalleCotizacion.Add(detalleCotizacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idEncabezadoCotizacion = new SelectList(db.EncabezadoCotizacion, "idEncabezadoCotizacion", "idEncabezadoCotizacion", detalleCotizacion.idEncabezadoCotizacion);
            ViewBag.idVehiculo = new SelectList(db.Vehiculo, "idVehiculo", "codigo", detalleCotizacion.idVehiculo);
            return View(detalleCotizacion);
        }

        // GET: DetalleCotizacions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleCotizacion detalleCotizacion = db.DetalleCotizacion.Find(id);
            if (detalleCotizacion == null)
            {
                return HttpNotFound();
            }
            ViewBag.idEncabezadoCotizacion = new SelectList(db.EncabezadoCotizacion, "idEncabezadoCotizacion", "idEncabezadoCotizacion", detalleCotizacion.idEncabezadoCotizacion);
            ViewBag.idVehiculo = new SelectList(db.Vehiculo, "idVehiculo", "codigo", detalleCotizacion.idVehiculo);
            return View(detalleCotizacion);
        }

        // POST: DetalleCotizacions/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idDetalleCotizacion,idEncabezadoCotizacion,idVehiculo,cantidad,porcentajeDescuento,precio,montoDescuento,montoImpuesto,montoTotal")] DetalleCotizacion detalleCotizacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(detalleCotizacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idEncabezadoCotizacion = new SelectList(db.EncabezadoCotizacion, "idEncabezadoCotizacion", "idEncabezadoCotizacion", detalleCotizacion.idEncabezadoCotizacion);
            ViewBag.idVehiculo = new SelectList(db.Vehiculo, "idVehiculo", "codigo", detalleCotizacion.idVehiculo);
            return View(detalleCotizacion);
        }

        // GET: DetalleCotizacions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleCotizacion detalleCotizacion = db.DetalleCotizacion.Find(id);
            if (detalleCotizacion == null)
            {
                return HttpNotFound();
            }
            return View(detalleCotizacion);
        }

        // POST: DetalleCotizacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DetalleCotizacion detalleCotizacion = db.DetalleCotizacion.Find(id);
            db.DetalleCotizacion.Remove(detalleCotizacion);
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
    }
}
