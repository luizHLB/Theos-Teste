﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Theos.Library.Core.Data.Context;

namespace Theos.Library.Core.Data.Migrations
{
    [DbContext(typeof(DataContext))]
    partial class DataContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.1.4-rtm-31024")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Theos.Library.Domain.Books.Book", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<bool>("Active");

                    b.Property<string>("Author")
                        .IsRequired()
                        .HasColumnType("VARCHAR(100)")
                        .HasMaxLength(100);

                    b.Property<DateTime>("Date")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("VARCHAR(500)")
                        .HasMaxLength(500);

                    b.Property<string>("Image")
                        .HasColumnType("VARCHAR(100)")
                        .HasMaxLength(100);

                    b.Property<Guid>("KeyId");

                    b.Property<string>("Title")
                        .IsRequired()
                        .HasColumnType("VARCHAR(100)")
                        .HasMaxLength(100);

                    b.Property<Guid>("UserId");

                    b.Property<int>("Version");

                    b.HasKey("Id");

                    b.HasIndex("KeyId");

                    b.ToTable("Book");
                });

            modelBuilder.Entity("Theos.Library.Domain.Books.BookKey", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.HasKey("Id");

                    b.ToTable("BookKey");
                });

            modelBuilder.Entity("Theos.Library.Domain.Logs.Log", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<bool>("Active");

                    b.Property<DateTime>("Date")
                        .HasColumnType("datetime2");

                    b.Property<string>("Field")
                        .IsRequired()
                        .HasColumnType("VARCHAR(50)")
                        .HasMaxLength(50);

                    b.Property<Guid>("OriginId");

                    b.Property<string>("Table")
                        .IsRequired()
                        .HasColumnType("VARCHAR(100)")
                        .HasMaxLength(100);

                    b.Property<Guid>("UserId");

                    b.Property<string>("Value")
                        .IsRequired()
                        .HasColumnType("VARCHAR(MAX)")
                        .HasMaxLength(8000);

                    b.Property<int>("Version");

                    b.HasKey("Id");

                    b.ToTable("Log");
                });

            modelBuilder.Entity("Theos.Library.Domain.Users.User", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<bool>("Active");

                    b.Property<DateTime>("Date")
                        .HasColumnType("datetime2");

                    b.Property<Guid>("KeyId");

                    b.Property<string>("Login")
                        .IsRequired()
                        .HasColumnType("VARCHAR(100)");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("VARCHAR(100)");

                    b.Property<Guid>("UserId");

                    b.Property<int>("Version");

                    b.HasKey("Id");

                    b.HasIndex("KeyId");

                    b.ToTable("User");
                });

            modelBuilder.Entity("Theos.Library.Domain.Users.UserKey", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.HasKey("Id");

                    b.ToTable("UserKey");
                });

            modelBuilder.Entity("Theos.Library.Domain.Books.Book", b =>
                {
                    b.HasOne("Theos.Library.Domain.Books.BookKey", "Key")
                        .WithMany()
                        .HasForeignKey("KeyId")
                        .OnDelete(DeleteBehavior.Restrict);
                });

            modelBuilder.Entity("Theos.Library.Domain.Users.User", b =>
                {
                    b.HasOne("Theos.Library.Domain.Users.UserKey", "Key")
                        .WithMany()
                        .HasForeignKey("KeyId")
                        .OnDelete(DeleteBehavior.Restrict);
                });
#pragma warning restore 612, 618
        }
    }
}