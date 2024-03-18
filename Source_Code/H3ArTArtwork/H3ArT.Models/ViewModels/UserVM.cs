using H3ArT.Models.Models;
using System.Collections.Generic;

namespace H3ArT.Models.ViewModels
{
    public class UserVM
    {
        public ApplicationUser Artist { get; set; }

        public IEnumerable<Artwork> ArtworkList { get; set; }
    }
}
