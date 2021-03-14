using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace AspNetCoreApi.Models
{
    public class Orden
    {
        [Key]
        public int id { get; set; }
        public int ProductoId { get; set; }
        public Producto Producto { get; set; }

        [Required]
        public string UsuarioId { get; set; }
        public Usuario Usuario { get; set; }

        [Required]
        public DateTime Fecha { get; set; }
        [Required]
        public string Estado { get; set; }
        [Required]
        public int Cantidad { get; set; }


    }
}
