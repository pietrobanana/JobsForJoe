using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobsForJoe.Data.EF//.Metadata
{
    [MetadataType(typeof(PositionMetadata))]
    public partial class Position { }

    public class PositionMetadata
    {
        //public int PositionID { get; set; }

        [Required(ErrorMessage = "***Please enter a Job Title")]
        [Display(Name ="Job Title")]
        public string Title { get; set; }

        [Display(Name ="Job Description")]
        [UIHint("Multiline")]
        public string JobDescription { get; set; }
    }
}
