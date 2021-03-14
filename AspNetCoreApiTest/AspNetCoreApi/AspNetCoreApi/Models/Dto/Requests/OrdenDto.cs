using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AspNetCoreApi.Models.Dto.Requests
{
    public class OrdenDto
    {
        [Required]
        public int id { get; set; }

        public int ProductoId { get; set; }

        [Required]
        public string UsuarioId { get; set; }

        [Required]
        public DateTime Fecha { get; set; }

        [Required]
        public string Estado { get; set; }

        [Required]
        public int Cantidad { get; set; }
    }
}
