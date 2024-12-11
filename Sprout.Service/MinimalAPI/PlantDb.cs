using Microsoft.EntityFrameworkCore;
using System.Data.Common;


namespace Sprout.Service
{
    class PlantDb:DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseNpgsql(@"Host=localhost:5432;Username=postgres;Password=postgres1;Database=PlantDb");

        //public DbSet<Todo> Todos { get; set; }
        public DbSet<user> users { get; set; }
        public DbSet<plant> plants { get; set; }
        public DbSet<garden> gardens { get; set; }

    }
}
