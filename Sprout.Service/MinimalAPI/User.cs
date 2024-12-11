using System.Text.Json.Serialization;

namespace Sprout.Service
{
    public class user
    {
        public int userid { get; set; }
        public String username { get; set; }
        public String password { get; set; }
        [JsonIgnore]
        public List<garden> gardens { get; set; }
    }
}
