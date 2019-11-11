using Proyecto.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Proyecto.UI.Controllers
{
    public class EmpleadoController : Controller
    {
        // GET: Empleado
        public ActionResult Index()
        {
            var db = new Models.RMClientEntity();

            return View(db.Empleado.ToList());
        }

        // GET: Empleado/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Empleado/Create
        public ActionResult Create()
        {
            try
            {   var db = new Models.RMClientEntity();
                ViewBag.idGenero = new SelectList(db.Genero, "idGenero", "nombre");
                ViewBag.idProvincia = new SelectList(db.Provincia, "idProvincia", "nombre");
                ViewBag.idCanton = new SelectList(db.Canton, "idCanton", "nombre");
                ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre");
                ViewBag.idSede = new SelectList(db.Sede, "idSede", "nombre");
                ViewBag.idDepartamento = new SelectList(db.Departamento, "idDepartamento", "nombre");
                ViewBag.idUsuario = new SelectList(db.Usuario, "idUsuario", "usuario1");
                ViewBag.idEstadoEmpleado = new SelectList(db.EstadoEmpleado, "idEstadoEmpleado", "nombre");
                Empleado empleado = new Empleado()
                {
                    idGenero = "M"
                };
                return View(empleado);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("Error al validar", ex);
                return View();
            }
        }

        // POST: Empleado/Create
        [HttpPost]
        public ActionResult Create(Empleado e)
        {
            try
            {
                using (RMClientEntity db = new RMClientEntity())
                {
                    db.Empleado.Add(e);
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

        // GET: Empleado/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Empleado/Edit/5
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

        // GET: Empleado/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Empleado/Delete/5
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
