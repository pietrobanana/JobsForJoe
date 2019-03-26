using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace JobsForJoe.UI.MVC.Models
{
    public class OneClickApply
    {
        [Required]
        public int OpenPositionID { get; set; }
        [Required]
        public string UserID { get; set; }
        [Required]
        public DateTime ApplicationDate { get; set; }
        public string ManagerNotes { get; set; }
        public string BaristaImage { get; set; }
        [Required]
        public bool IsDeclined { get; set; }
        public string ResumeFileName { get; set; }
        
        public bool IsEmployed { get; set; }
        public string Bio { get; set; }
    }
}