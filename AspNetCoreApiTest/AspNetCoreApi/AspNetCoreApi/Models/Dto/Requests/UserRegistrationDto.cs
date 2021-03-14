using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AspNetCoreApi.Models.Dto.Requests
{
    public class UserRegistrationDto
    {
        [Required]
        public string Nombre { get; set; }

        [Required]
        public string Apellido { get; set; }

        [Required]
        public string UserName { get; set; }

        [Required]
        [EmailAddress]    
        public string Email { get; set; }

        [Required]
        public string Password { get; set; }
    }
}
