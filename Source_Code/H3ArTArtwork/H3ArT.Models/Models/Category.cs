using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace H3ArT.Models.Models
{
    public class Category
    {
        [Key]
        public int CategoryId { get; set; }

        [Required]
        [DisplayName("Category Name")]
        public string CategoryName { get; set; }

        [DisplayName("Display Order")]
        public int DisplayOrder { get; set; }
    }
}
