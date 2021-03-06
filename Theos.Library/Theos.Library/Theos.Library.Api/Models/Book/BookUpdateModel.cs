﻿using System.ComponentModel.DataAnnotations;
using Theos.Library.Api.Models.Base;

namespace Theos.Library.Api.Models.Book
{
    public class BookUpdateModel : BaseUpdateModel
    {
        [Required]
        [StringLength(100)]
        public string Title { get; set; }
        [Required]
        [StringLength(100)]
        public string Author { get; set; }
        [Required]
        [StringLength(500)]
        public string Description { get; set; }
        [StringLength(100)]
        [RegularExpression(@"(http|HTTP)(s|S)?://[\d\D]+/[\d\D]+.([jJ][pP][gP]|[pP][nN][gG])", ErrorMessage = "Image URL not acceptable")]
        public string Cover { get; set; }
    }
}
