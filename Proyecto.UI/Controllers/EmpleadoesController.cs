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
    public class EmpleadoesController : Controller
    {
        private RMClientEntity db = new RMClientEntity();

        // GET: Empleadoes
        public ActionResult Index()
        {
            var empleado = db.Empleado.Include(e => e.Departamento).Include(e => e.Distrito).Include(e => e.EstadoEmpleado).Include(e => e.Genero).Include(e => e.Usuario);
            return View(empleado.ToList());
        }

        // GET: Empleadoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleado empleado = db.Empleado.Find(id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            return View(empleado);
        }

        // GET: Empleadoes/Create
        public ActionResult Create()
        {
            ViewBag.idDepartamento = new SelectList(db.Departamento, "idDepartamento", "nombre");
            ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre");
            ViewBag.idEstadoEmpleado = new SelectList(db.EstadoEmpleado, "idEstadoEmpleado", "nombre");
            ViewBag.idGenero = new SelectList(db.Genero, "idGenero", "nombre");
            ViewBag.idUsuario = new SelectList(db.Usuario, "idUsuario", "usuario1");
            return View();
        }

        // POST: Empleadoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idEmpleado,cedula,nombre,apellido1,apellido2,idGenero,telefonoCelular,otroTelefono,correo,idProvincia,idCanton,idDistrito,direccionExacta,idSede,idDepartamento,idUsuario,idEstadoEmpleado")] Empleado empleado)
        {
            if (ModelState.IsValid)
            {
                db.Empleado.Add(empleado);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idDepartamento = new SelectList(db.Departamento, "idDepartamento", "nombre", empleado.idDepartamento);
            ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre", empleado.idDistrito);
            ViewBag.idEstadoEmpleado = new SelectList(db.EstadoEmpleado, "idEstadoEmpleado", "nombre", empleado.idEstadoEmpleado);
            ViewBag.idGenero = new SelectList(db.Genero, "idGenero", "nombre", empleado.idGenero);
            ViewBag.idUsuario = new SelectList(db.Usuario, "idUsuario", "usuario1", empleado.idUsuario);
            return View(empleado);
        }

        // GET: Empleadoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleado empleado = db.Empleado.Find(id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            ViewBag.idDepartamento = new SelectList(db.Departamento, "idDepartamento", "nombre", empleado.idDepartamento);
            ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre", empleado.idDistrito);
            ViewBag.idEstadoEmpleado = new SelectList(db.EstadoEmpleado, "idEstadoEmpleado", "nombre", empleado.idEstadoEmpleado);
            ViewBag.idGenero = new SelectList(db.Genero, "idGenero", "nombre", empleado.idGenero);
            ViewBag.idUsuario = new SelectList(db.Usuario, "idUsuario", "usuario1", empleado.idUsuario);
            return View(empleado);
        }

        // POST: Empleadoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idEmpleado,cedula,nombre,apellido1,apellido2,idGenero,telefonoCelular,otroTelefono,correo,idProvincia,idCanton,idDistrito,direccionExacta,idSede,idDepartamento,idUsuario,idEstadoEmpleado")] Empleado empleado)
        {
            if (ModelState.IsValid)
            {
                db.Entry(empleado).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idDepartamento = new SelectList(db.Departamento, "idDepartamento", "nombre", empleado.idDepartamento);
            ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre", empleado.idDistrito);
            ViewBag.idEstadoEmpleado = new SelectList(db.EstadoEmpleado, "idEstadoEmpleado", "nombre", empleado.idEstadoEmpleado);
            ViewBag.idGenero = new SelectList(db.Genero, "idGenero", "nombre", empleado.idGenero);
            ViewBag.idUsuario = new SelectList(db.Usuario, "idUsuario", "usuario1", empleado.idUsuario);
            return View(empleado);
        }

        // GET: Empleadoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleado empleado = db.Empleado.Find(id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            return View(empleado);
        }

        // POST: Empleadoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Empleado empleado = db.Empleado.Find(id);
            db.Empleado.Remove(empleado);
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
