using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;
using Proyecto.DAL;
using Proyecto.DO.Interfaces;

namespace Proyecto.BL
{
    public class manteEmpleado : CRUD<DAL.Empleado>
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
                using (TransactionScope scope = new TransactionScope())
                {
                    DAL.manteEmpleado._Instancia.Delete(entity);
                    scope.Complete();
                }
            }
            catch (Exception ee)
            {

                throw;
            }
        }

       

        public List<Empleado> GetAll()
        {
            List<Empleado> lista = new List<Empleado>();
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    lista = DAL.manteEmpleado._Instancia.GetAll();
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

        public void Insert(Empleado entity)
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    DAL.manteEmpleado._Instancia.Insert(entity);
                    scope.Complete();
                }
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
                using (TransactionScope scope = new TransactionScope())
                {
                    DAL.manteEmpleado._Instancia.Update(entity);
                    scope.Complete();
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

