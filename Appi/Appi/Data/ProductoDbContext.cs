using Microsoft.EntityFrameworkCore;
using Appi.Models;

namespace Appi.Data
{
    public class ProductoDbContext: DbContext
    {
        public ProductoDbContext(DbContextOptions<ProductoDbContext> options) : base(options) { }

        public DbSet<Producto> Productos { get; set; }
    }
}
