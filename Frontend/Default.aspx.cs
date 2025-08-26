using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using BookNexusWeb;
using System.Linq;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Show home section by default
            ShowSection("home");

            // Initialize mostly bought books grid
            InitializeBooksGrid();

            // Check if user is logged in
            if (Session["Username"] != null)
            {
                lblWelcome.Text = "Welcome, " + Session["Username"].ToString();
                lblWelcome.Visible = true;
            }

            // Initialize cart if it doesn't exist
            if (Session["Cart"] == null)
            {
                Session["Cart"] = new List<CartItem>();
            }
        }
    }

    protected void ShowSection(object sender, EventArgs e)
    {
        // Handle both LinkButton and Button clicks
        if (sender is LinkButton linkButton)
        {
            ShowSection(linkButton.CommandArgument);
        }
        else if (sender is Button button)
        {
            ShowSection(button.CommandArgument);
        }
    }

    private void ShowSection(string sectionId)
    {
        // Hide all sections
        pnlHome.Visible = false;
        pnlBought.Visible = false;
        pnlCart.Visible = false;
        pnlCheckout.Visible = false;
        pnlItEndsWithUs.Visible = false;
        pnlTillSummer.Visible = false;
        pnlFourthDaughter.Visible = false;
        pnlCouldBeYours.Visible = false;
        pnlBinding13.Visible = false;
       /* pnlFlawless.Visible = false;
        pnlHeartless.Visible = false;
        pnlThatKindOfGuy.Visible = false;
        pnlTheSinsOfSilas.Visible = false;
        pnlOnceUponABrokenHeart.Visible = false;
        pnlLightsOut.Visible = false;
        */
        // Show the selected section
        switch (sectionId)
        {
            case "home":
                pnlHome.Visible = true;
                break;
            case "bought":
                pnlBought.Visible = true;
                break;
            case "cart-section":
                pnlCart.Visible = true;
                UpdateCartDisplay();
                break;
            case "checkout-section":
                pnlCheckout.Visible = true;
                break;
            case "it-ends-with-us":
                pnlItEndsWithUs.Visible = true;
                break;
            case "Till-Summer-Do-Us-Part":
                pnlTillSummer.Visible = true;
                break;
            case "The-Fourth-Daughter":
                pnlFourthDaughter.Visible = true;
                break;
            case "I-Could-Be-Yours":
                pnlCouldBeYours.Visible = true;
                break;
            case "Binding-13":
                pnlBinding13.Visible = true;
                break;
        /*   case "Flawless":
                pnlFlawless.Visible = true;
                break;
            case "Heartless":
                pnlHeartless.Visible = true;
                break;
            case "That-Kind-of-Guy":
                pnlThatKindOfGuy.Visible = true;
                break;
            case "The-Sins-of-Silas":
                pnlTheSinsOfSilas.Visible = true;
                break;
            case "Once-Upon-A-Broken-Heart":
                pnlOnceUponABrokenHeart.Visible = true;
                break;
            case "Lights-Out":
                pnlLightsOut.Visible = true;
                break;*/
        }
    }

    protected void AddToCart_Click(object sender, EventArgs e)
    {
        try
        {
            Button button = (Button)sender;
            string commandArgs = button.CommandArgument;

            // More robust manual parsing
            int titleStart = commandArgs.IndexOf("\"title\":\"") + 9;
            int titleEnd = commandArgs.IndexOf("\"", titleStart);
            string title = commandArgs.Substring(titleStart, titleEnd - titleStart);

            int priceStart = commandArgs.IndexOf("\"price\":") + 8;
            int priceEnd = commandArgs.IndexOf("}", priceStart);
            if (priceEnd == -1) priceEnd = commandArgs.Length;
            string priceStr = commandArgs.Substring(priceStart, priceEnd - priceStart).Trim();
            priceStr = priceStr.TrimEnd('}').Trim();
            int price = int.Parse(priceStr);

            // Get or create cart
            List<CartItem> cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();

            // Check if item already exists in cart and update quantity
            CartItem existingItem = cart.FirstOrDefault(item => item.Title == title);
            if (existingItem != null)
            {
                existingItem.Quantity += 1;
            }
            else
            {
                // Add new item to cart
                cart.Add(new CartItem { Title = title, Price = price, Quantity = 1 });
            }

            // Save cart to session
            Session["Cart"] = cart;

            // Update cart count
            lblCartCount.Text = cart.Sum(item => item.Quantity).ToString();

            // Show confirmation message
            ScriptManager.RegisterStartupScript(this, GetType(), "AddedToCart",
                $"alert('{title} added to cart!');", true);
        }
        catch (Exception ex)
        {
            // Log the error
            System.Diagnostics.Debug.WriteLine($"Error adding to cart: {ex.Message}");

            // Show error message to user
            ScriptManager.RegisterStartupScript(this, GetType(), "AddToCartError",
                "alert('There was an error adding the item to your cart. Please try again.');", true);
        }
    }

    protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "RemoveFromCart")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            List<CartItem> cart = Session["Cart"] as List<CartItem>;

            if (cart != null && index >= 0 && index < cart.Count)
            {
                string removedItem = cart[index].Title;
                cart.RemoveAt(index);
                Session["Cart"] = cart;
                UpdateCartDisplay();

                // Show confirmation message
                ScriptManager.RegisterStartupScript(this, GetType(), "RemovedFromCart",
                    $"alert('{removedItem} removed from cart!');", true);
            }
        }
    }

    protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            // Calculate total
            List<CartItem> cart = Session["Cart"] as List<CartItem>;
            decimal total = 0;

            if (cart != null)
            {
                foreach (CartItem item in cart)
                {
                    total += item.Price;
                }
            }

            // Update the total label
            //lblCartTotal.Text = total.ToString();

            // Add footer cells
            e.Row.Cells.Clear();
            e.Row.Cells.Add(new TableCell { Text = "Total:", ColumnSpan = 1 });
            e.Row.Cells.Add(new TableCell { Text = "R" + total.ToString(), ColumnSpan = 1 });
            e.Row.Cells.Add(new TableCell { ColumnSpan = 1 }); // Empty cell for the remove column
        }
    }

    private void UpdateCartDisplay()
    {
        List<CartItem> cart = Session["Cart"] as List<CartItem>;
        if (cart == null)
        {
            cart = new List<CartItem>();
            Session["Cart"] = cart;
        }

        gvCart.DataSource = cart;
        gvCart.DataBind();

        // Calculate and update total
        decimal total = 0;
        foreach (CartItem item in cart)
        {
            total += item.Price;
        }
        // lblCartTotal.Text = total.ToString();

        // Update cart count
        lblCartCount.Text = cart.Count.ToString();
    }

    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        List<CartItem> cart = Session["Cart"] as List<CartItem>;
        if (cart == null || cart.Count == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "EmptyCart",
                "alert('Your cart is empty!');", true);
            return;
        }

        // Process checkout (in a real app, this would save to database)
        decimal total = 0;
        foreach (CartItem item in cart)
        {
            total += item.Price;
        }

        // Clear cart
        Session["Cart"] = new List<CartItem>();
        lblCartCount.Text = "0";

        // Show checkout section
        ShowSection("checkout-section");

        // Show confirmation message
        ScriptManager.RegisterStartupScript(this, GetType(), "CheckoutSuccess",
            $"alert('Checkout successful! Total amount: R{total}');", true);
    }

    private void InitializeBooksGrid()
    {
        List<Book> books = new List<Book>
        {
            new Book { Rank = 1, Title = "It Ends With Us", Author = "Colleen Hoover", Price = 220 },
            new Book { Rank = 2, Title = "Till Summer Do Us Part", Author = "Meghan Quinn", Price = 300 },
            new Book { Rank = 3, Title = "The Fourth Daughter", Author = "Lyn Liao Butler", Price = 280 },
            new Book { Rank = 4, Title = "I Could Be Yours", Author = "Helena Hunting", Price = 270 },
            new Book { Rank = 5, Title = "Binding 13", Author = "Chloe Walsh", Price = 290 },
            new Book { Rank = 6, Title = "Flawless", Author = "Elsie Silver", Price = 350 },
            new Book { Rank = 7, Title = "Heartless", Author = "Elsie Silver", Price = 250 },
            new Book { Rank = 8, Title = "That Kind of Guy", Author = "Stephanie Archer", Price = 280 },
            new Book { Rank = 9, Title = "The Sins of Silas", Author = "Kylie Snow", Price = 320 },
            new Book { Rank = 10, Title = "Once Upon A Broken Heart", Author = "Stephanie Garber", Price = 350 },
            new Book { Rank = 11, Title = "Lights Out", Author = "Navessa Allen", Price = 200 }
        };

        gvBooks.DataSource = books;
        gvBooks.DataBind();
    }

    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        // Clear session and redirect
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
}
