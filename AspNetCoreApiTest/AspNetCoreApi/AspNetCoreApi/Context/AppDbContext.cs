using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreApi.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace AspNetCoreApi.Models
{
    public class AppDbContext : IdentityDbContext<Usuario>
    {
        private readonly DbContextOptions _options;
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
            _options = options;
        }
        protected override void OnModelCreating(ModelBuilder builder){

            string AdminId = "3183cc93-3310-488b-98fe-b19ebe2681aa";
            string VendedorId = "9bcec916-31d6-4548-9c2d-a7dc747f5148";
            string ClienteId = "b2000f92-ea6e-4524-a5fc-618e63869c31";

            string AdminRoleId = "3183cc03-331q-488b-98fw-b19ebe2681ae";
            string VendedorRoleId = "9bcec911-31dr-454t-9c2y-a7dc747f514u";
            string ClienteRoleId = "b2000f9h-ea6i-452o-a5fp-618e63869c3z";

            //seed admin role
            builder.Entity<IdentityRole>().HasData(new IdentityRole
            {
                Name = "administrador",
                NormalizedName = "administrador",
                Id = AdminRoleId,
                ConcurrencyStamp = AdminRoleId
            }, 
            new IdentityRole
            {
                Name = "vendedor",
                NormalizedName = "vendedor",
                Id = VendedorRoleId,
                ConcurrencyStamp = VendedorRoleId
            },
            new IdentityRole
            {
                Name = "cliente",
                NormalizedName = "cliente",
                Id = ClienteRoleId,
                ConcurrencyStamp = ClienteRoleId
            });

            //create user
            var admin = new Usuario
            {
                Id = AdminId,
                Email = "frank@gmail.com",
                EmailConfirmed = true,
                NormalizedEmail = "FRANK@GMAIL.COM",
                Nombre = "Frank",
                Apellido = "Ofoedu",
                UserName = "frank"
           };

            var vendedor = new Usuario
            {
                Id = VendedorId,
                Email = "jhon@gmail.com",
                EmailConfirmed = true,
                NormalizedEmail = "JHON@GMAIL.COM",
                Nombre = "Jhon",
                Apellido = "Whick",
                UserName = "jhon"
            };
            var cliente = new Usuario
            {
                Id = ClienteId,
                Email = "shaw@gmail.com",
                EmailConfirmed = true,
                NormalizedEmail = "SHAW@GMAIL.COM",
                Nombre = "Shaw",
                Apellido = "Owen",
                UserName = "shaw"
            };
            //set user admin password
            PasswordHasher<Usuario> phAdmin = new PasswordHasher<Usuario>();
            admin.PasswordHash = phAdmin.HashPassword(admin, "Admin123!");

            //set user vendedor password
            PasswordHasher<Usuario> phVendedor = new PasswordHasher<Usuario>();
            vendedor.PasswordHash = phVendedor.HashPassword(vendedor, "Vendedor123!");

            //set user cliente password
            PasswordHasher<Usuario> phCliente = new PasswordHasher<Usuario>();
            cliente.PasswordHash = phCliente.HashPassword(cliente, "Clente123!");


            //seed user
            builder.Entity<Usuario>().HasData(admin, vendedor, cliente);

            //set user role to admin
            builder.Entity<IdentityUserRole<string>>().HasData(new IdentityUserRole<string>
            {
                RoleId = AdminRoleId,
                UserId = AdminId
            },
            new IdentityUserRole<string>
            {
                RoleId = VendedorRoleId,
                UserId = VendedorId
            },
            new IdentityUserRole<string>
            {
                RoleId = ClienteRoleId,
                UserId = ClienteId
            });

            base.OnModelCreating(builder);
        }
    

        public DbSet<Producto> Productos { get; set; }
        public DbSet<Orden> Ordenes { get; set; }
    }

}
