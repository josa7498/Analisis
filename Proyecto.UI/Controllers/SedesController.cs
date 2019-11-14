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
    public class SedesController : Controller
    {
        private RMClientEntity db = new RMClientEntity();

        // GET: Sedes
        public ActionResult Index()
        {
            var sede = db.Sede.Include(s => s.Distrito).Include(s => s.EstadoSede);
            return View(sede.ToList());
        }

        // GET: Sedes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sede sede = db.Sede.Find(id);
            if (sede == null)
            {
                return HttpNotFound();
            }
            return View(sede);
        }

        // GET: Sedes/Create
        public ActionResult Create()
        {
            ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre");
            ViewBag.idEstadoSede = new SelectList(db.EstadoSede, "idEstadoSede", "nombre");
            return View();
        }

        // POST: Sedes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idSede,nombre,telefono,correo,idProvincia,idCanton,idDistrito,direccionExacta,idEstadoSede")] Sede sede)
        {
            if (ModelState.IsValid)
            {
                db.Sede.Add(sede);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre", sede.idDistrito);
            ViewBag.idEstadoSede = new SelectList(db.EstadoSede, "idEstadoSede", "nombre", sede.idEstadoSede);
            return View(sede);
        }

        // GET: Sedes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sede sede = db.Sede.Find(id);
            if (sede == null)
            {
                return HttpNotFound();
            }
            ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre", sede.idDistrito);
            ViewBag.idEstadoSede = new SelectList(db.EstadoSede, "idEstadoSede", "nombre", sede.idEstadoSede);
            return View(sede);
        }

        // POST: Sedes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idSede,nombre,telefono,correo,idProvincia,idCanton,idDistrito,direccionExacta,idEstadoSede")] Sede sede)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sede).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre", sede.idDistrito);
            ViewBag.idEstadoSede = new SelectList(db.EstadoSede, "idEstadoSede", "nombre", sede.idEstadoSede);
            return View(sede);
        }

        // GET: Sedes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sede sede = db.Sede.Find(id);
            if (sede == null)
            {
                return HttpNotFound();
            }
            return View(sede);
        }

        // POST: Sedes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Sede sede = db.Sede.Find(id);
            db.Sede.Remove(sede);
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
