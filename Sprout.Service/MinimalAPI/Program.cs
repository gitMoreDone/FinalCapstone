using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Sprout.Service;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.AspNetCore.Authorization;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using Jose;
using System.Security.Cryptography;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<PlantDb>();
//Only do this in dev
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAllOrigins",
        policyBuilder => policyBuilder.AllowAnyHeader()
            .AllowAnyMethod()
            .AllowAnyOrigin()
            //.AllowCredentials()
            .SetIsOriginAllowed(_ => true)
    );
});
builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(o =>
{
    o.TokenValidationParameters = new TokenValidationParameters
    {
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        ValidAudience = builder.Configuration["Jwt:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey
            (Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"])),
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true
    };
    
});
//builder.Services.AddAuthorization();
var app = builder.Build();
//app.UseAuthentication();
//app.UseAuthorization();
app.UseCors("AllowAllOrigins"); //this is the other side of the CORS



#region Plants
app.MapGet("/plants/", (PlantDb db)=> db.plants.ToList());
app.MapGet("/plants/{id}", (int id, PlantDb db) => db.plants.Where(p=>p.plantid==id).FirstOrDefault());

#endregion

#region Garden
app.MapGet("/garden", (PlantDb db,HttpContext http) => {
    var userName = http.User.FindFirstValue(ClaimTypes.Email);
    user? usr = db.users.Where(u => u.username == userName).Include(u=>u.gardens).ThenInclude(g=>g.plant).FirstOrDefault();
    return usr != null && usr.gardens!=null ? Results.Ok(usr.gardens.ToList()) : Results.NotFound();
});

app.MapPost("/garden", (plant plant, PlantDb db, HttpContext http) =>
{
    var userName = http.User.FindFirstValue(ClaimTypes.Email);
    user? usr = db.users.Where(u => u.username == userName).Include(u => u.gardens).FirstOrDefault();
    garden g = new garden()
    {
        userid = usr.userid,
        plantid = plant.plantid
    };
    db.gardens.Add(g);
    db.SaveChanges();
});
app.MapPut("/garden", (garden gardenplant, PlantDb db) =>
{
    db.gardens.Update(gardenplant);
    db.SaveChanges();
});
app.MapDelete("/garden/{id}", (int plantId, PlantDb db, HttpContext http) =>
{
    var userName = http.User.FindFirstValue(ClaimTypes.Email);
    user? usr = db.users.Where(u => u.username == userName).Include(u => u.gardens).FirstOrDefault();
    garden g = db.gardens.Where(g => g.plantid == plantId && g.userid == usr.userid).FirstOrDefault();
    if(g!=null)
        db.gardens.Remove(g);
    db.SaveChanges();
});

#endregion

#region users
app.MapPost("/login",[AllowAnonymous] (user user, PlantDb db) =>
{
    user? u = db.users.Where(u => u.username == user.username && u.password == user.password).FirstOrDefault();

    if (u!=null)
    {
        var issuer = builder.Configuration["Jwt:Issuer"];
        var audience = builder.Configuration["Jwt:Audience"];
        var key = Encoding.ASCII.GetBytes
        (builder.Configuration["Jwt:Key"]);
        var tokenDescriptor = new SecurityTokenDescriptor
        {
            Subject = new ClaimsIdentity(new[]
            {
                new Claim("Id", Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Email, user.username),
                new Claim(JwtRegisteredClaimNames.Jti,
                Guid.NewGuid().ToString())
            }),
            Expires = DateTime.UtcNow.AddMinutes(60),
            Issuer = issuer,
            Audience = audience,
            SigningCredentials = new SigningCredentials
            (new SymmetricSecurityKey(key),
            SecurityAlgorithms.HmacSha512Signature)
        };
        var tokenHandler = new JwtSecurityTokenHandler();
        var token = tokenHandler.CreateToken(tokenDescriptor);
        var stringToken = tokenHandler.WriteToken(token);
        LoginDto dto = new LoginDto()
        {
            token = stringToken,
            user = u
        };
        return Results.Ok(dto);
    }
    return Results.Unauthorized();
});

app.MapPost("/register", [AllowAnonymous] (user usr, PlantDb db) =>
{
    db.users.Add(usr);
    db.SaveChanges();
});

#endregion

app.Run();