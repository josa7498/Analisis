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
    public class manteUsuario : CRUD<DAL.Usuario>
    {
        private static manteUsuario Instancia;

        public static manteUsuario _Instancia
        {
            get
            {
                if (Instancia == null)
                {
                    return new manteUsuario();
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

        public void Delete(Usuario entity)
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    DAL.manteUsuario._Instancia.Delete(entity);
                    scope.Complete();
                }
            }
            catch (Exception ee)
            {

                throw;
            }
        }

        public List<Usuario> GetAll()
        {
            List<Usuario> lista = new List<Usuario>();
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    lista = DAL.manteUsuario._Instancia.GetAll();
                    scope.Complete();
                }
                return lista;
            }
            catch (Exception ee)
            {

                throw;
            }
        }

        public Usuario GetOneById(int id)
        {
            throw new NotImplementedException();
        }

        public void Insert(Usuario entity)
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    DAL.manteUsuario._Instancia.Insert(entity);
                    scope.Complete();
                }
            }
            catch (Exception ee)
            {

                throw;
            }
        }

        public void Update(Usuario entity)
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    DAL.manteUsuario._Instancia.Update(entity);
                    scope.Complete();
                }
            }
            catch (Exception ee)
            {

                throw;
            }

        }

        List<Usuario> CRUD<Usuario>.GetAll()
        {
            throw new NotImplementedException();
        }
        Usuario CRUD<Usuario>.GetOneById(int id)
        {
            throw new NotImplementedException();
        }
    }
}
