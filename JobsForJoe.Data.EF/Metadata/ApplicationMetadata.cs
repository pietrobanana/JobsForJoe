using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobsForJoe.Data.EF//.Metadata
{
    [MetadataType(typeof(ApplicationMetadata))]
    public partial class Application { }

    public class ApplicationMetadata
    {
        //public int ApplicationsID { get; set; }
        [Required(ErrorMessage ="***Please Enter the Oportunity***")]
        [Display(Name ="Opportunity")]
        public int OpenPositionID { get; set; }

        [Required(ErrorMessage = "***Enter Barista Name***")]
        [Display(Name = "Applicant")]
        public string UserID { get; set; }

        [Required(ErrorMessage = "***Please Enter Date needed***")]
        [Display(Name = "Application Date")]
        [DisplayFormat(DataFormatString = "{0:d}")]
        public System.DateTime ApplicationDate { get; set; }

        [Display(Name ="Manager Notes")]
        [UIHint("Multiline")]
        public string ManagerNotes { get; set; }

        [Required(ErrorMessage ="***Please state if applicant was approved***")]
        [Display(Name ="Hire?")]
        public bool IsDeclined { get; set; }

        [Display(Name ="Resume File")]
        public string ResumeFilename { get; set; }
    }
}
