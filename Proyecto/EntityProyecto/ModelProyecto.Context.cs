﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ProyectoEntities : DbContext
    {
        public ProyectoEntities()
            : base("name=ProyectoEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Aerolineas> Aerolineas { get; set; }
        public virtual DbSet<Aeropuertos> Aeropuertos { get; set; }
        public virtual DbSet<AsientosDeItinerarios> AsientosDeItinerarios { get; set; }
        public virtual DbSet<AsientosDeVuelos> AsientosDeVuelos { get; set; }
        public virtual DbSet<Itinerarios> Itinerarios { get; set; }
        public virtual DbSet<Maletas> Maletas { get; set; }
        public virtual DbSet<OrdenesDeCompras> OrdenesDeCompras { get; set; }
        public virtual DbSet<Pasajeros> Pasajeros { get; set; }
        public virtual DbSet<PuertasDeAbordajes> PuertasDeAbordajes { get; set; }
        public virtual DbSet<Vuelos> Vuelos { get; set; }
        public virtual DbSet<VAerolineas> VAerolineas { get; set; }
    }
}