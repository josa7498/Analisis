using Proyecto.DO.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto.DAL
{
    public class manteVehiculos : CRUD<Vehiculo>
    {
        private static manteVehiculos Instancia;

        public static manteVehiculos _Instancia
        {
            get
            {
                if (Instancia == null)
                {
                    return new manteVehiculos();
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


        public void Delete(Vehiculo entity)
        {
            try
            {
                RMClientEntities entities = new RMClientEntities();
                var result = entities.Vehiculoes.Find(entity.idVehiculo);
                entities.Vehiculoes.Remove(result);
                entities.SaveChanges();

            }
            catch (Exception ee)
            {

                throw;
            }
        }

        public List<Vehiculo> GetAll()
        {
            //Inicializamos
            List<Vehiculo> lista = new List<Vehiculo>();

            try
            {
                RMClientEntities entities = new RMClientEntities();
                lista = entities.Vehiculoes.ToList();
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


        public void Insert(Vehiculo entity)
        {
            try
            {
                RMClientEntities entities = new RMClientEntities();
                entities.Vehiculoes.Add(entity);
                entities.SaveChanges();

            }
            catch (Exception ee)
            {

                throw;
            }
        }  

        public void Update(Vehiculo entity)
        {
            try
            {
                using (RMClientEntities entities = new RMClientEntities())
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


        List<Vehiculo> CRUD<Vehiculo>.GetAll()
        {
            throw new NotImplementedException();
        }

        Vehiculo CRUD<Vehiculo>.GetOneById(int id)
        {
            throw new NotImplementedException();
        }   
    }
}
