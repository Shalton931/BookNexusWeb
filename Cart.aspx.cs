using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookNexusWebsite
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            DataTable cart = Session["Cart"] as DataTable;

            if (cart == null || cart.Rows.Count == 0)
            {
                pnlCartItems.Visible = false;
                pnlEmptyCart.Visible = true;
                return;
            }

            pnlCartItems.Visible = true;
            pnlEmptyCart.Visible = false;

            gvCart.DataSource = cart;
            gvCart.DataBind();

            UpdateCartTotal();
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            DataTable cart = Session["Cart"] as DataTable;

            if (cart == null || index < 0 || index >= cart.Rows.Count)
                return;

            switch (e.CommandName)
            {
                case "RemoveFromCart":
                    cart.Rows.RemoveAt(index);
                    lblMessage.Text = "Item removed from cart.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    break;

                case "IncreaseQuantity":
                    int currentQty = Convert.ToInt32(cart.Rows[index]["Quantity"]);
                    cart.Rows[index]["Quantity"] = currentQty + 1;
                    break;

                case "DecreaseQuantity":
                    int currentQtyDec = Convert.ToInt32(cart.Rows[index]["Quantity"]);
                    if (currentQtyDec > 1)
                    {
                        cart.Rows[index]["Quantity"] = currentQtyDec - 1;
                    }
                    else
                    {
                        cart.Rows.RemoveAt(index);
                        lblMessage.Text = "Item removed from cart.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    break;
            }

            Session["Cart"] = cart;
            LoadCart();

            // Update cart count in master page
            var master = Master as Main;
            if (master != null)
            {
                master.UpdateCartCount();
            }
        }

        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                // Calculate total
                DataTable cart = Session["Cart"] as DataTable;
                decimal total = 0;

                if (cart != null)
                {
                    foreach (DataRow row in cart.Rows)
                    {
                        total += Convert.ToDecimal(row["Price"]) * Convert.ToInt32(row["Quantity"]);
                    }
                }

                // Add footer cells
                e.Row.Cells.Clear();
                e.Row.Cells.Add(new TableCell { Text = "Total:", ColumnSpan = 3, HorizontalAlign = HorizontalAlign.Right });
                e.Row.Cells.Add(new TableCell { Text = "R" + total.ToString("N2"), ColumnSpan = 2 });
            }
        }

        private void UpdateCartTotal()
        {
            DataTable cart = Session["Cart"] as DataTable;
            decimal total = 0;

            if (cart != null)
            {
                foreach (DataRow row in cart.Rows)
                {
                    total += Convert.ToDecimal(row["Price"]) * Convert.ToInt32(row["Quantity"]);
                }
            }

            lblCartTotal.Text = total.ToString("N2");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            DataTable cart = Session["Cart"] as DataTable;
            if (cart == null || cart.Rows.Count == 0)
            {
                lblMessage.Text = "Your cart is empty!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Redirect to checkout page instead of processing here
            Response.Redirect("Checkout.aspx");
        }
    }
}