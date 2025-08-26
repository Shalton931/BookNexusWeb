using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookNexusWeb
{
    public class CartItem
    {
        public string Title { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; } = 1;
    }
}