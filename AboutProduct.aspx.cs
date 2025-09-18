using BookNexusWebsite.ServiceReference1;
using System;
using System.Web.UI;

namespace BookNexusWebsite
{
    public partial class AboutProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Service1Client client = new Service1Client();
                int productID;
                if (int.TryParse(Request.QueryString["Id"], out productID))
                {
                    // call my getProduct function
                    Book product = client.GetProduct(productID);

                    if (product != null)
                    {
                        imageID.InnerHtml = $"<img src='{product.Image}' alt='{product.title}' style='max-width:250px; border-radius:10px;' />";
                        productNameID.InnerHtml = $"<h2>{product.title}</h2>";
                        productDescriptionID.InnerText = product.description;
                        authorID.InnerHtml = $"<strong>Author:</strong> {product.author}";
                        genreID.InnerHtml = $"<strong>Genre:</strong> {product.genre}";
                        productPriceIS.InnerHtml = $"<strong>Price:</strong> R{product.price:0.00}";
                    }
                    else
                    {
                        productNameID.InnerHtml = "<h2>Book not found.</h2>";
                    }
                }
                else
                {
                    productNameID.InnerHtml = "<h2>Invalid book ID.</h2>";
                }
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            int productID;
            if (int.TryParse(Request.QueryString["Id"], out productID))
            {
                int userId = Session["UserID"] != null ? Convert.ToInt32(Session["UserID"]) : 0;
                if (userId == 0)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                Service1Client client = new Service1Client();
                bool success = client.AddtoCart(userId, productID, 1);
                if (success)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", 
                        "alert('Book added to cart successfully!');", true);
                }
            }
        }

        protected void btnAddToWishlist_Click(object sender, EventArgs e)
        {
            int productID;
            if (int.TryParse(Request.QueryString["Id"], out productID))
            {
                int userId = Session["UserID"] != null ? Convert.ToInt32(Session["UserID"]) : 0;
                if (userId == 0)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                Service1Client client = new Service1Client();
                bool success = false;// client.AddtoWishList(userId, productID);
                if (success)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", 
                        "alert('Book added to wishlist successfully!');", true);
                }
            }
        }
    }
}