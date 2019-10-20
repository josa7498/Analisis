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
    
    public partial class Vehiculo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Vehiculo()
        {
            this.DetalleCotizacions = new HashSet<DetalleCotizacion>();
        }
    
        public int idVehiculo { get; set; }
        public int idProveedor { get; set; }
        public int idTipoVehiculo { get; set; }
        public string codigo { get; set; }
        public string marca { get; set; }
        public string modelo { get; set; }
        public string parametroVersion { get; set; }
        public int annio { get; set; }
        public int cantidadDisponible { get; set; }
        public System.DateTime fechaIngreso { get; set; }
        public Nullable<System.DateTime> fechaSalida { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DetalleCotizacion> DetalleCotizacions { get; set; }
        public virtual Proveedor Proveedor { get; set; }
        public virtual TipoVehiculo TipoVehiculo { get; set; }
    }
}
