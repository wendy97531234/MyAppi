using Appi.Data;
using Appi.DTOs;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Appi.Models;

namespace Appi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoControllers : ControllerBase
    {
        public ProductoDbContext _context;

        public ProductoControllers(ProductoDbContext context)
        {
            _context = context;
        }

        //
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductoDTO>>> ObtenerProducto()
        {
            var productos = await _context.Productos.ToListAsync();
            var productosDTO = productos.Select(p => new ProductoDTO
            {
                id = p.Id,
                name = p.Name,
                precio = p.Precio,
                Stock = p.Stock
            }).ToList();

            return Ok(productosDTO);
        }

        //
        [HttpGet("{id}")]
        public async Task<ActionResult<ProductoDTO>> ObtenerProductoPorId(int id)
        {
            var producto = await _context.Productos.FindAsync(id);
            if (producto == null)
            {
                return NotFound();
            }
            var productoDTO = new ProductoDTO
            {
                id = producto.Id,
                name = producto.Name,
                precio = producto.Precio,
                Stock = producto.Stock
            };
            return Ok(productoDTO);
        }

        [HttpPost]
        public async Task<ActionResult> CrearProducto(ProductoDTO productoDTO)
        {
            var producto = new Producto
            {
                Name = productoDTO.name,
                Precio = productoDTO.precio,
                Stock = productoDTO.Stock
            };
            _context.Productos.Add(producto);
            await _context.SaveChangesAsync();
            return StatusCode(StatusCodes.Status201Created);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> ActualizarProducto(int id, ProductoDTO productoDTO)
        {
            var producto = await _context.Productos.FindAsync(id);
            if (producto == null)
            {
                return NotFound();
            }
            producto.Name = productoDTO.name;
            producto.Precio = productoDTO.precio;
            producto.Stock = productoDTO.Stock;
            await _context.SaveChangesAsync();
            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> EliminarProducto(int id)
        {
            var producto = await _context.Productos.FindAsync(id);
            if (producto == null)
            {
                return NotFound();
            }
            _context.Productos.Remove(producto);
            await _context.SaveChangesAsync();
            return Ok();
        }
    }
}
