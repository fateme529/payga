//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace payga
{
    using System;
    using System.Collections.Generic;
    
    public partial class product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public product()
        {
            this.added_to = new HashSet<added_to>();
        }
    
        public int id { get; set; }
        public string category { get; set; }
        public byte[] image { get; set; }
        public decimal current_price { get; set; }
        public int stock_count { get; set; }
        public string brand { get; set; }
        public string model { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<added_to> added_to { get; set; }
        public virtual cooler cooler { get; set; }
        public virtual cpu cpu { get; set; }
        public virtual gpu gpu { get; set; }
        public virtual hdd hdd { get; set; }
        public virtual motherboard motherboard { get; set; }
        public virtual p_case p_case { get; set; }
        public virtual power_supply power_supply { get; set; }
        public virtual ram_stick ram_stick { get; set; }
        public virtual SSD SSD { get; set; }
    }
}
