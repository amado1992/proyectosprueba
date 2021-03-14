using AspNetCoreApi.Configuracion;
using AspNetCoreApi.Models;
using AspNetCoreApi.Models.Dto.Requests;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AspNetCoreApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class OrdenController : ControllerBase
    {
        private readonly AppDbContext _context;

        public OrdenController(AppDbContext context)
        {
            _context = context;
        }
        // PUT api/<OrdenController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, string estado)
        {
            try
            {
                var orden = _context.Ordenes.FirstOrDefault(data => data.id == id);
                if (orden != null && (estado.Equals(Estado.confirmed.ToString()) 
                                  || estado.Equals(Estado.canceled.ToString())
                                  || estado.Equals(Estado.created.ToString())))
                {
                    orden.Estado = estado;
                    _context.Entry(orden).State = EntityState.Modified;

                    _context.SaveChanges();
                    return Ok(orden);
                }
                else
                {

                    return BadRequest();
                }

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // DELETE api/<OrdenController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            try
            {
                var orden = _context.Ordenes.FirstOrDefault(data => data.id == id);
                if (orden != null && (orden.Estado.Equals(Estado.created.ToString()) || orden.Estado.Equals(Estado.canceled.ToString())))
                {
                    _context.Ordenes.Remove(orden);
                    _context.SaveChanges();
                    return Ok(id);
                }
                else
                {
                    return BadRequest();
                }

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
