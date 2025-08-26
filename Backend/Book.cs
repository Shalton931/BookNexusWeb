﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookNexusWeb
{
    public class Book
    {
        public int Rank { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public decimal Price { get; set; }
    }
}