//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EntityProyecto
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrdenesDeCompras
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public OrdenesDeCompras()
        {
            this.AsientosDeItinerarios = new HashSet<AsientosDeItinerarios>();
        }
    
        public long IDOrdenDeCompra { get; set; }
        public System.DateTime FechaPago { get; set; }
        public string NumeroTarjeta { get; set; }
        public string Nombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public decimal Total { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AsientosDeItinerarios> AsientosDeItinerarios { get; set; }
    }
}