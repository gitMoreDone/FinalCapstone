using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Sprout.Service.Migrations
{
    /// <inheritdoc />
    public partial class init : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "plants",
                columns: table => new
                {
                    plantid = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    plantname = table.Column<string>(type: "text", nullable: false),
                    scientificname = table.Column<string>(type: "text", nullable: false),
                    planttype = table.Column<string>(type: "text", nullable: false),
                    plantzone = table.Column<string>(type: "text", nullable: true),
                    plantdescription = table.Column<string>(type: "text", nullable: true),
                    waterlevel = table.Column<string>(type: "text", nullable: true),
                    lightlevel = table.Column<string>(type: "text", nullable: true),
                    plantcare = table.Column<string>(type: "text", nullable: true),
                    plantmaturity = table.Column<string>(type: "text", nullable: true),
                    sowtype = table.Column<string>(type: "text", nullable: true),
                    difficultylevel = table.Column<int>(type: "integer", nullable: true),
                    plantimage1 = table.Column<string>(type: "text", nullable: true),
                    plantimage2 = table.Column<string>(type: "text", nullable: true),
                    plantimage3 = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_plants", x => x.plantid);
                });

            migrationBuilder.CreateTable(
                name: "users",
                columns: table => new
                {
                    userid = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    username = table.Column<string>(type: "text", nullable: false),
                    password = table.Column<string>(type: "text", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_users", x => x.userid);
                });

            migrationBuilder.CreateTable(
                name: "gardens",
                columns: table => new
                {
                    gardenid = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    plantid = table.Column<int>(type: "integer", nullable: false),
                    userid = table.Column<int>(type: "integer", nullable: false),
                    plantqty = table.Column<int>(type: "integer", nullable: false),
                    notes = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_gardens", x => x.gardenid);
                    table.ForeignKey(
                        name: "FK_gardens_plants_plantid",
                        column: x => x.plantid,
                        principalTable: "plants",
                        principalColumn: "plantid",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_gardens_users_userid",
                        column: x => x.userid,
                        principalTable: "users",
                        principalColumn: "userid",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_gardens_plantid",
                table: "gardens",
                column: "plantid");

            migrationBuilder.CreateIndex(
                name: "IX_gardens_userid",
                table: "gardens",
                column: "userid");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "gardens");

            migrationBuilder.DropTable(
                name: "plants");

            migrationBuilder.DropTable(
                name: "users");
        }
    }
}
