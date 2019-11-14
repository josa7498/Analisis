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
    public class ClientesController : Controller
    {
        private RMClientEntity db = new RMClientEntity();

        // GET: Clientes
        public ActionResult Index()
        {
            var cliente = db.Cliente.Include(c => c.Distrito).Include(c => c.EstadoCliente).Include(c => c.Genero).Include(c => c.Ocupacion).Include(c => c.TipoCliente).Include(c => c.Vehiculo);
            return View(cliente.ToList());
        }

        // GET: Clientes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cliente cliente = db.Cliente.Find(id);
            if (cliente == null)
            {
                return HttpNotFound();
            }
            return View(cliente);
        }

        // GET: Clientes/Create
        public ActionResult Create()
        {
            ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre");
            ViewBag.idEstadoCliente = new SelectList(db.EstadoCliente, "idEstadoCliente", "nombre");
            ViewBag.idGenero = new SelectList(db.Genero, "idGenero", "nombre");
            ViewBag.idOcupacion = new SelectList(db.Ocupacion, "idOcupacion", "nombre");
            ViewBag.idTipoCliente = new SelectList(db.TipoCliente, "idTipoCliente", "nombre");
            ViewBag.idVehiculoInteres = new SelectList(db.Vehiculo, "idVehiculo", "codigo");
            return View();
        }

        // POST: Clientes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idCliente,idTipoCliente,cedula,nombre,apellido1,apellido2,idGenero,idOcupacion,numeroCelular,otroTelefono,correo,fechaNacimiento,ingresoSalarial,idProvincia,idCanton,idDistrito,direccionExacta,idVehiculoInteres,idEstadoCliente")] Cliente cliente)
        {
            if (ModelState.IsValid)
            {
                db.Cliente.Add(cliente);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre", cliente.idDistrito);
            ViewBag.idEstadoCliente = new SelectList(db.EstadoCliente, "idEstadoCliente", "nombre", cliente.idEstadoCliente);
            ViewBag.idGenero = new SelectList(db.Genero, "idGenero", "nombre", cliente.idGenero);
            ViewBag.idOcupacion = new SelectList(db.Ocupacion, "idOcupacion", "nombre", cliente.idOcupacion);
            ViewBag.idTipoCliente = new SelectList(db.TipoCliente, "idTipoCliente", "nombre", cliente.idTipoCliente);
            ViewBag.idVehiculoInteres = new SelectList(db.Vehiculo, "idVehiculo", "codigo", cliente.idVehiculoInteres);
            return View(cliente);
        }

        // GET: Clientes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cliente cliente = db.Cliente.Find(id);
            if (cliente == null)
            {
                return HttpNotFound();
            }
            ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre", cliente.idDistrito);
            ViewBag.idEstadoCliente = new SelectList(db.EstadoCliente, "idEstadoCliente", "nombre", cliente.idEstadoCliente);
            ViewBag.idGenero = new SelectList(db.Genero, "idGenero", "nombre", cliente.idGenero);
            ViewBag.idOcupacion = new SelectList(db.Ocupacion, "idOcupacion", "nombre", cliente.idOcupacion);
            ViewBag.idTipoCliente = new SelectList(db.TipoCliente, "idTipoCliente", "nombre", cliente.idTipoCliente);
            ViewBag.idVehiculoInteres = new SelectList(db.Vehiculo, "idVehiculo", "codigo", cliente.idVehiculoInteres);
            return View(cliente);
        }

        // POST: Clientes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idCliente,idTipoCliente,cedula,nombre,apellido1,apellido2,idGenero,idOcupacion,numeroCelular,otroTelefono,correo,fechaNacimiento,ingresoSalarial,idProvincia,idCanton,idDistrito,direccionExacta,idVehiculoInteres,idEstadoCliente")] Cliente cliente)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cliente).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idDistrito = new SelectList(db.Distrito, "idDistrito", "nombre", cliente.idDistrito);
            ViewBag.idEstadoCliente = new SelectList(db.EstadoCliente, "idEstadoCliente", "nombre", cliente.idEstadoCliente);
            ViewBag.idGenero = new SelectList(db.Genero, "idGenero", "nombre", cliente.idGenero);
            ViewBag.idOcupacion = new SelectList(db.Ocupacion, "idOcupacion", "nombre", cliente.idOcupacion);
            ViewBag.idTipoCliente = new SelectList(db.TipoCliente, "idTipoCliente", "nombre", cliente.idTipoCliente);
            ViewBag.idVehiculoInteres = new SelectList(db.Vehiculo, "idVehiculo", "codigo", cliente.idVehiculoInteres);
            return View(cliente);
        }

        // GET: Clientes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cliente cliente = db.Cliente.Find(id);
            if (cliente == null)
            {
                return HttpNotFound();
            }
            return View(cliente);
        }

        // POST: Clientes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Cliente cliente = db.Cliente.Find(id);
            db.Cliente.Remove(cliente);
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
