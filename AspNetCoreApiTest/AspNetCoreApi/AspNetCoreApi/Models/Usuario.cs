using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AspNetCoreApi.Models
{
    public class Usuario : IdentityUser
    {
        [Required]
        [PersonalData]
        public string Nombre { get; set; }

        [Required]
        [PersonalData]
        public string Apellido { get; set; }
    }
}
