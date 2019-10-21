using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Proyecto.DO.Interfaces;

namespace Proyecto.DAL
{
    public class manteUsuario : CRUD<Usuario>
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
                RMClient1 entities = new RMClient1();
                var result = entities.Usuarios.Find(entity.idUsuario);
                entities.Usuarios.Remove(result);
                entities.SaveChanges();

            }
            catch (Exception ee)
            {

                throw;
            }
        }

        public List<Usuario> GetAll()
        {
            //Inicializamos
            List<Usuario> lista = new List<Usuario>();

            try
            {
                RMClient1 entities = new RMClient1();
                lista = entities.Usuarios.ToList();
                entities.SaveChanges();

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
                RMClient1 entities = new RMClient1();
                entities.Usuarios.Add(entity);
                entities.SaveChanges();

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
