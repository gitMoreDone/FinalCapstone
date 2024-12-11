namespace Sprout.Service
{
    public class garden
    {
        public int gardenid { get; set; }
        public int plantid { get; set; }
        public plant plant { get; set; }
        public int userid { get; set; }
        public user user { get; set; }
        public int plantqty { get; set; }
        public string? notes { get; set; }
    }
}

