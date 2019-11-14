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
    public class EncabezadoCotizacionsController : Controller
    {
        private RMClientEntity db = new RMClientEntity();

        // GET: EncabezadoCotizacions
        public ActionResult Index()
        {
            var encabezadoCotizacion = db.EncabezadoCotizacion.Include(e => e.Campana).Include(e => e.Cliente).Include(e => e.Empleado).Include(e => e.EstadoCotizacion);
            return View(encabezadoCotizacion.ToList());
        }

        // GET: EncabezadoCotizacions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EncabezadoCotizacion encabezadoCotizacion = db.EncabezadoCotizacion.Find(id);
            if (encabezadoCotizacion == null)
            {
                return HttpNotFound();
            }
            return View(encabezadoCotizacion);
        }

        // GET: EncabezadoCotizacions/Create
        public ActionResult Create()
        {
            ViewBag.idCampana = new SelectList(db.Campana, "idCampana", "nombre");
            ViewBag.idCliente = new SelectList(db.Cliente, "idCliente", "cedula");
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "cedula");
            ViewBag.idEstadoCotizacion = new SelectList(db.EstadoCotizacion, "idEstadoCotizacion", "nombre");
            return View();
        }

        // POST: EncabezadoCotizacions/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idEncabezadoCotizacion,fechaCreacion,idCliente,idEmpleado,numeroLineas,idCampana,idEstadoCotizacion,subTotal,montoDescuento,impuestoVentas,total")] EncabezadoCotizacion encabezadoCotizacion)
        {
            if (ModelState.IsValid)
            {
                db.EncabezadoCotizacion.Add(encabezadoCotizacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idCampana = new SelectList(db.Campana, "idCampana", "nombre", encabezadoCotizacion.idCampana);
            ViewBag.idCliente = new SelectList(db.Cliente, "idCliente", "cedula", encabezadoCotizacion.idCliente);
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "cedula", encabezadoCotizacion.idEmpleado);
            ViewBag.idEstadoCotizacion = new SelectList(db.EstadoCotizacion, "idEstadoCotizacion", "nombre", encabezadoCotizacion.idEstadoCotizacion);
            return View(encabezadoCotizacion);
        }

        // GET: EncabezadoCotizacions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EncabezadoCotizacion encabezadoCotizacion = db.EncabezadoCotizacion.Find(id);
            if (encabezadoCotizacion == null)
            {
                return HttpNotFound();
            }
            ViewBag.idCampana = new SelectList(db.Campana, "idCampana", "nombre", encabezadoCotizacion.idCampana);
            ViewBag.idCliente = new SelectList(db.Cliente, "idCliente", "cedula", encabezadoCotizacion.idCliente);
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "cedula", encabezadoCotizacion.idEmpleado);
            ViewBag.idEstadoCotizacion = new SelectList(db.EstadoCotizacion, "idEstadoCotizacion", "nombre", encabezadoCotizacion.idEstadoCotizacion);
            return View(encabezadoCotizacion);
        }

        // POST: EncabezadoCotizacions/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idEncabezadoCotizacion,fechaCreacion,idCliente,idEmpleado,numeroLineas,idCampana,idEstadoCotizacion,subTotal,montoDescuento,impuestoVentas,total")] EncabezadoCotizacion encabezadoCotizacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(encabezadoCotizacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCampana = new SelectList(db.Campana, "idCampana", "nombre", encabezadoCotizacion.idCampana);
            ViewBag.idCliente = new SelectList(db.Cliente, "idCliente", "cedula", encabezadoCotizacion.idCliente);
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "cedula", encabezadoCotizacion.idEmpleado);
            ViewBag.idEstadoCotizacion = new SelectList(db.EstadoCotizacion, "idEstadoCotizacion", "nombre", encabezadoCotizacion.idEstadoCotizacion);
            return View(encabezadoCotizacion);
        }

        // GET: EncabezadoCotizacions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EncabezadoCotizacion encabezadoCotizacion = db.EncabezadoCotizacion.Find(id);
            if (encabezadoCotizacion == null)
            {
                return HttpNotFound();
            }
            return View(encabezadoCotizacion);
        }

        // POST: EncabezadoCotizacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EncabezadoCotizacion encabezadoCotizacion = db.EncabezadoCotizacion.Find(id);
            db.EncabezadoCotizacion.Remove(encabezadoCotizacion);
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
