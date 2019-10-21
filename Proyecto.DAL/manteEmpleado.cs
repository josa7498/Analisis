using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Proyecto.DO.Interfaces;

namespace Proyecto.DAL
{
    public class manteEmpleado : CRUD<Empleado>
    {
        private static manteEmpleado Instancia;

        public static manteEmpleado _Instancia
        {
            get
            {
                if (Instancia == null)
                {
                    return new manteEmpleado();
                }
                return Instancia;
            }
            set
            {
                if (Instancia == null)
                {
                    Instancia = value;
                }
            }
        }


        public void Delete(Empleado entity)
        {
            try
            {
                RMClient1 entities = new RMClient1();
                var result = entities.Empleadoes.Find(entity.idEmpleado);
                entities.Empleadoes.Remove(result);
                entities.SaveChanges();

            }
            catch (Exception ee)
            {

                throw;
            }
        }

        public List<Empleado> GetAll()
        {
            //Inicializamos
            List<Empleado> lista = new List<Empleado>();

            try
            {
                RMClient1 entities = new RMClient1();
                lista = entities.Empleadoes.ToList();
                entities.SaveChanges();

                return lista;
            }
            catch (Exception ee)
            {

                throw;
            }
        }

        public Empleado GetOneById(int id)
        {
            throw new NotImplementedException();
        }


        public void Insert(Empleado entity)
        {
            try
            {
                RMClient1 entities = new RMClient1();
                entities.Empleadoes.Add(entity);
                entities.SaveChanges();

            }
            catch (Exception ee)
            {

                throw;
            }
        }

        public void Update(Empleado entity)
        {
            try
            {
                using (RMClient1 entities = new RMClient1())
                {
                    entities.Entry(entity).State = System.Data.Entity.EntityState.Modified;
                    entities.SaveChanges();

                   
                }


            }
            catch (Exception ee)
            {

                throw;
            }
        }
        List<Empleado> CRUD<Empleado>.GetAll()
        {
            throw new NotImplementedException();
        }
        Empleado CRUD<Empleado>.GetOneById(int id)
        {
            throw new NotImplementedException();
        }
    }
}
