﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobsForJoe.Data.EF//.Metadata
{
    [MetadataType(typeof(LocationMetadata))]
    public partial class Location { }

    public class LocationMetadata
    {

        public int LocationID { get; set; }

        [Required(ErrorMessage = "***Please Provide Store Name***")]
        [Display(Name = "Store")]
        public string StoreName { get; set; }

        [Required(ErrorMessage = "***Please Provide Store Number***")]
        [Display(Name ="Store Number")]
        public string StoreNumber { get; set; }

        [Required(ErrorMessage = "***Please Provide City Name***")]
        [Display(Name = "City")]
        public string City { get; set; }

        [Required(ErrorMessage = "***Please Provide State Name***")]
        [Display(Name = "State")]
        public string State { get; set; }

        [Required(ErrorMessage = "***Please Provide Manager***")]
        [Display(Name = "Manager")]
        public string ManagerID { get; set; }

        [Display(Name = "Store Image")]
        public string StoreImage { get; set; }
    }
}
