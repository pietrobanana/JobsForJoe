using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobsForJoe.Data//.EF.Metadata
{
    [MetadataType(typeof(UserDetailMetadata))]
    public partial class UserDetail { }

    public class UserDetailMetadata
    {
        //public string UserID { get; set; }

        [Required(ErrorMessage ="***Please enter your First Name***")]
        [Display(Name ="First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "***Please enter your Last Name***")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        //[Required(ErrorMessage = "***Please enter your Resume File***")]
        [Display(Name = "Personal Resume")]
        public string ResumeFileName { get; set; }

        [Display(Name = "Picture")]
        public string BaristaImage { get; set; }

        [Required(ErrorMessage = "***Please state if you are employed***")]
        [Display(Name = "Are you currently Employed with this company?")]
        public bool IsEmployed { get; set; }

        [Display(Name = "Tell us a little about yourself")]
        [UIHint("Multiline")]
        public string Bio { get; set; }
    }
}
