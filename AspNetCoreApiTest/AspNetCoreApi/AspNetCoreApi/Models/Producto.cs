using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AspNetCoreApi.Models
{
    public class Producto
    {
        [Key]
        public int id { get; set; }
        [Required]
        public string Nombre{ get; set; }
        [Required]
        [MaxLength(100)]
        public string Descripcion { get; set; }
        [Required]
        public int Cantidad { get; set; }
        public string Slug { get; set; }
        [Required]
        public double Precio { get; set; }

    }
}
