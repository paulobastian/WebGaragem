using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace WebGaragem.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<WebGaragem.Models.TipoUsuario> TipoUsuario { get; set; }

        public DbSet<WebGaragem.Models.AcessoTipoUsuario> AcessoTipoUsuario { get; set; }

        public DbSet<WebGaragem.Models.PerfilUsuario> PerfilUsuario { get; set; }

        public DbSet<WebGaragem.Models.Entidades.Marca> Marca { get; set; }

        public DbSet<WebGaragem.Models.Entidades.Modelo> Modelo { get; set; }

        public DbSet<WebGaragem.Models.Entidades.Anuncio> Anuncio { get; set; }

        public DbSet<IdentityUser> Usuario { get; set; }

        //public DbSet<WebGaragem.Models.TipoUsuario> TipoUsuario { get; set; }
        //public DbSet<WebGaragem.Models.AcessoTipoUsuario> AcessoTipoUsuario { get; set; }
        //public DbSet<WebGaragem.Models.PerfilUsuario> PerfilUsuario { get; set; }

        ////public DbSet<IdentityUser> Usuario { get; set; }

        //public DbSet<WebGaragem.Models.Entidades.Marca> Marca { get; set; }

        //public DbSet<WebGaragem.Models.Entidades.Modelo> Modelo { get; set; }

        //public DbSet<WebGaragem.Models.Entidades.Anuncio> Anuncio { get; set; }


    }
}
