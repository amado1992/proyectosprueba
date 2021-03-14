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
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AspNetCoreApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class ProductoController : ControllerBase
    {
        private readonly AppDbContext _context;

        public ProductoController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/<ProductoController>
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Get()
        {
            try {
                return Ok(_context.Productos.ToList());
            } catch (Exception ex) {
                return BadRequest(ex.Message);
            }
        }

        // GET api/<ProductoController>/5
        [HttpGet("{id}", Name="GetProducto")]
        public ActionResult Get(int id)
        {
            try
            {
                var producto = _context.Productos.FirstOrDefault(product => product.id == id);
                return Ok(producto);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // POST api/<ProductoController>
        [HttpPost]
        public ActionResult Post(Producto producto)
        {
            try
            {
            _context.Productos.Add(producto);
            _context.SaveChanges();

                return Ok(producto);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        // PUT api/<ProductoController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Producto producto)
        {
            try
            {
                if (producto.id == id)
                {
                    _context.Entry(producto).State = EntityState.Modified;

                    _context.SaveChanges();
                    return Ok(producto);
                }
                else {

                    return BadRequest();
                }

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // DELETE api/<ProductoController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            try
            {
                var producto = _context.Productos.FirstOrDefault(product => product.id == id);
                if (producto != null) {
                    _context.Productos.Remove(producto);
                    _context.SaveChanges();
                    return Ok(id);
                }else{
                    return BadRequest();
                }

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //[Authorize(Roles = UserRole.Admin)]
        [HttpPost]
        [Route("ComprarProducto")]
        public ActionResult PostComprarProducto(OrdenDto ordenDto)
        {
            try
            {
                var producto = _context.Productos.FirstOrDefault(data => data.id == ordenDto.ProductoId);
                
                if (producto != null && producto.Cantidad >= ordenDto.Cantidad)
                {    
                    producto.Cantidad = producto.Cantidad - ordenDto.Cantidad;
                    _context.Entry(producto).State = EntityState.Modified;

                    var orden = new Orden
                    {
                        ProductoId = ordenDto.ProductoId,
                        Estado = ordenDto.Estado,
                        Cantidad = ordenDto.Cantidad,
                        Fecha = ordenDto.Fecha,
                        UsuarioId = ordenDto.UsuarioId
                    };
                    _context.Ordenes.Add(orden);
                    _context.SaveChanges();

                    return Ok(orden);
                }
                else {
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
