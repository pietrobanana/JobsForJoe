//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JobsForJoe.Data.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class OpenPosition
    {
        public int OpenPositionID { get; set; }
        public int PositionID { get; set; }
        public int LocationID { get; set; }
    
        public virtual Location Location { get; set; }
        public virtual Position Position { get; set; }
    }
}
