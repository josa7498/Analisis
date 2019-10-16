using Proyecto.DAL;
using Proyecto.DO.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace Proyecto.BL
{
   public class manteVehiculos : CRUD<DAL.Vehiculo>
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
                using (TransactionScope scope = new TransactionScope())
                {
                    DAL.manteVehiculos._Instancia.Delete(entity);
                    scope.Complete();
                }
            }
            catch (Exception ee)
            {

                throw;
            }
        }



        public List<Vehiculo> GetAll()
        {
            List<Vehiculo> lista = new List<Vehiculo>();
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    lista = DAL.manteVehiculos._Instancia.GetAll();
                    scope.Complete();
                }
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
                using (TransactionScope scope = new TransactionScope())
                {
                    DAL.manteVehiculos._Instancia.Insert(entity);
                    scope.Complete();
                }
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
                using (TransactionScope scope = new TransactionScope())
                {
                    DAL.manteVehiculos._Instancia.Update(entity);
                    scope.Complete();
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

