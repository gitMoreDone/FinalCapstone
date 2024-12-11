using System.Text.Json.Serialization;
using static System.Net.Mime.MediaTypeNames;

namespace Sprout.Service
{
    public class plant
    {
        public int plantid { get; set; }
        public string plantname { get; set; }
        public string scientificname { get; set; }
        public string planttype { get; set; }
        public string? plantzone { get; set; }
        public string? plantdescription { get; set; }
        public string? waterlevel { get; set; }
        public string? lightlevel { get; set; }
        public string? plantcare { get; set; }
        public string? plantmaturity { get; set; }
        public string? sowtype { get; set; }
        public int? difficultylevel { get; set; }
        public string? plantimage1 { get; set; }
        public string? plantimage2 { get; set; }
        public string? plantimage3 { get; set; }
        [JsonIgnore]
        public List<garden> gardens { get; set; }
    }
}
