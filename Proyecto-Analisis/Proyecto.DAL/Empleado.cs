//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Proyecto.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Empleado
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Empleado()
        {
            this.Campanas = new HashSet<Campana>();
            this.Campanas1 = new HashSet<Campana>();
            this.EncabezadoCotizacions = new HashSet<EncabezadoCotizacion>();
        }
    
        public int idEmpleado { get; set; }
        public string cedula { get; set; }
        public string nombre { get; set; }
        public string apellido1 { get; set; }
        public string apellido2 { get; set; }
        public string idGenero { get; set; }
        public string telefonoCelular { get; set; }
        public string otroTelefono { get; set; }
        public string correo { get; set; }
        public int idProvincia { get; set; }
        public int idCanton { get; set; }
        public int idDistrito { get; set; }
        public string direccionExacta { get; set; }
        public int idSede { get; set; }
        public int idDepartamento { get; set; }
        public int idUsuario { get; set; }
        public int idEstado { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Campana> Campanas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Campana> Campanas1 { get; set; }
        public virtual Departamento Departamento { get; set; }
        public virtual Estado Estado { get; set; }
        public virtual Genero Genero { get; set; }
        public virtual Usuario Usuario { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EncabezadoCotizacion> EncabezadoCotizacions { get; set; }
    }
}
