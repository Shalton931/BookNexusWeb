using BookNexusWebsite.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookNexusWebsite
{
    public partial class Home : System.Web.UI.Page
    {
        Service1Client client = new Service1Client();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialize Session["Cart"] if it doesn't exist with correct columns
            if (Session["Cart"] == null)
            {
                DataTable cart = new DataTable();
                cart.Columns.Add("BookID", typeof(int));
                cart.Columns.Add("Title", typeof(string));
                cart.Columns.Add("Price", typeof(decimal));
                cart.Columns.Add("Quantity", typeof(int));
                Session["Cart"] = cart;
            }

            // get my id's from my master page
            var master = Master as Main;
            char type = Session["type"] != null ? Convert.ToChar(Session["type"]) : 'G'; // Default to Guest

            if (type == 'C')
            {
                master.getRegisterID.Visible = false;
                master.getLoginID.Visible = false;
                master.getLogoutID.Visible = true;
            }
            else if (type == 'M')
            {
                master.getRegisterID.Visible = false;
                master.getLoginID.Visible = false;
                master.getLogoutID.Visible = true;
                master.getUserManagemnentId.Visible = true;
                master.getProductManagementID.Visible = true;
            }
            else
            {
                master.getRegisterID.Visible = true;
                master.getLoginID.Visible = true;
                master.getLogoutID.Visible = false;
            }

            // Handle Add to Cart action
            if (!IsPostBack && Request.QueryString["addtocart"] != null)
            {
                int userId = Session["UserID"] != null ? Convert.ToInt32(Session["UserID"]) : 0;
                int bookId = Convert.ToInt32(Request.QueryString["addtocart"]);
                int quantity = 1;

                if (userId == 0)
                {
                    // Guest: store in session cart
                    DataTable cart = Session["Cart"] as DataTable;

                    // Check if book already in cart
                    DataRow existing = cart.AsEnumerable()
                        .FirstOrDefault(row => row.Field<int>("BookID") == bookId);

                    if (existing != null)
                    {
                        existing["Quantity"] = Convert.ToInt32(existing["Quantity"]) + quantity;
                    }
                    else
                    {
                        // Get book details to add to cart
                        Book book = client.GetProduct(bookId);
                        if (book != null)
                        {
                            DataRow newRow = cart.NewRow();
                            newRow["BookID"] = bookId;
                            newRow["Title"] = book.title;
                            newRow["Price"] = book.price;
                            newRow["Quantity"] = quantity;
                            cart.Rows.Add(newRow);
                        }
                    }

                    Session["Cart"] = cart;
                    Response.Redirect("Cart.aspx"); // Redirect to cart page
                }
                else
                {
                    // Logged in: add to DB cart using the service
                    bool success = client.AddtoCart(userId, bookId, quantity);
                    if (success)
                    {
                        Response.Redirect("Cart.aspx"); // Redirect to cart page
                    }
                    else
                    {
                        lblMessage.Text = "Could not add book to cart.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }

            // Get products from service
            var products = client.GetProducts();

            // Filter by category if needed
            string categoryFilter = Request.QueryString["category"];
            if (!string.IsNullOrEmpty(categoryFilter))
            {
                switch (categoryFilter)
                {
                    case "babies":
                        products = products.Where(p => p.genre.ToLower().Contains("baby") || p.genre.ToLower().Contains("babies")).ToArray();
                        break;
                    case "toddlers":
                        products = products.Where(p => p.genre.ToLower().Contains("toddler")).ToArray();
                        break;
                    case "teenagers":
                        products = products.Where(p => p.genre.ToLower().Contains("teen") || p.genre.ToLower().Contains("teenager")).ToArray();
                        break;
                    case "adults":
                        products = products.Where(p => p.genre.ToLower().Contains("adult")).ToArray();
                        break;
                    default:
                        // Show all if unknown
                        break;
                }
            }

            // Build product cards
            string display = "";
            foreach (Book product in products)
            {
                display += "<div class='product-card'>";
                display += "<img src='" + product.Image + "' alt='" + product.title + "'/>";
                display += "<h3>" + product.title + "</h3>";
                display += "<p><strong><em>" + product.author + "</em></strong></p>";
                display += "<div class='price'>R" + product.price.ToString("0.00") + "<del> R" + (product.price + 30).ToString("0.00") + "</del></div>";
                display += "<div class='product-actions'>";
                display += "<a href='AboutProduct.aspx?Id=" + product.book_ID + "' class='btn-details'>View Details</a>";
                display += "<a href='Home.aspx?addtocart=" + product.book_ID + (categoryFilter != null ? "&category=" + categoryFilter : "") + "' class='add-to-cart'>Add to Cart</a>";
                display += "<button class='wishlist'>♡</button>";
                display += "</div>";
                display += "</div>";
            }

            myProduct.InnerHtml = display;
        }
    }
}