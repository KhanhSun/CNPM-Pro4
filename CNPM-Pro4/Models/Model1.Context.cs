﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CNPM_Pro4.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BookEntities : DbContext
    {
        public BookEntities()
            : base("name=BookEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<bansaosach> bansaosaches { get; set; }
        public virtual DbSet<chitietmuonsach> chitietmuonsaches { get; set; }
        public virtual DbSet<chitiettacgia> chitiettacgias { get; set; }
        public virtual DbSet<nguoimuon> nguoimuons { get; set; }
        public virtual DbSet<nhaphathanh> nhaphathanhs { get; set; }
        public virtual DbSet<sach> saches { get; set; }
        public virtual DbSet<tacgia> tacgias { get; set; }
        public virtual DbSet<taikhoan> taikhoans { get; set; }
        public virtual DbSet<themuon> themuons { get; set; }
        public virtual DbSet<thongtinmuontrasach> thongtinmuontrasaches { get; set; }
        public virtual DbSet<thuthu> thuthus { get; set; }
    }
}
