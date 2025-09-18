using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookNexusWebsite
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable cart = Session["Cart"] as DataTable;

                if (cart == null || cart.Rows.Count == 0)
                {
                    lblMessage.Text = "Your cart is empty. Please add items to your cart before checkout.";
                    lblMessage.Visible = true;
                    pnlCheckoutForm.Visible = false;
                    return;
                }

                // Display order summary
                gvOrderSummary.DataSource = cart;
                gvOrderSummary.DataBind();

                // Calculate and display total
                decimal total = 0;
                foreach (DataRow row in cart.Rows)
                {
                    total += Convert.ToDecimal(row["Price"]) * Convert.ToInt32(row["Quantity"]);
                }
                lblOrderTotal.Text = total.ToString("N2");

                pnlCheckoutForm.Visible = true;

                // Pre-fill user information if logged in
                if (Session["Username"] != null)
                {
                    txtFullName.Text = Session["Username"].ToString();
                    // You could pre-fill more fields from user profile if available
                }
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            try
            {
                // Validate form
                if (string.IsNullOrEmpty(txtFullName.Text) ||
                    string.IsNullOrEmpty(txtEmail.Text) ||
                    string.IsNullOrEmpty(txtAddress.Text) ||
                    string.IsNullOrEmpty(txtCardNumber.Text))
                {
                    lblMessage.Text = "Please fill in all required fields.";
                    lblMessage.Visible = true;
                    return;
                }

                DataTable cart = Session["Cart"] as DataTable;
                if (cart == null || cart.Rows.Count == 0)
                {
                    lblMessage.Text = "Your cart is empty.";
                    lblMessage.Visible = true;
                    return;
                }

                // Calculate total
                decimal total = 0;
                foreach (DataRow row in cart.Rows)
                {
                    total += Convert.ToDecimal(row["Price"]) * Convert.ToInt32(row["Quantity"]);
                }

                // Here you would typically:
                // 1. Process payment (integrate with payment gateway)
                // 2. Save order to database
                // 3. Send confirmation email
                // 4. Clear cart

                // For demo purposes, we'll just show a confirmation
                lblCustomerName.Text = txtFullName.Text;
                lblOrderNumber.Text = "ORD" + DateTime.Now.ToString("yyyyMMddHHmmss");
                lblConfirmationTotal.Text = total.ToString("N2");
                lblShippingAddress.Text = txtAddress.Text + ", " + txtCity.Text + ", " + txtPostalCode.Text;

                // Clear the cart
                Session["Cart"] = new DataTable();

                // Update cart count in master page
                var master = Master as Main;
                if (master != null)
                {
                    master.UpdateCartCount();
                }

                // Show confirmation and hide form
                pnlCheckoutForm.Visible = false;
                pnlOrderConfirmation.Visible = true;

            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred during checkout: " + ex.Message;
                lblMessage.Visible = true;
            }
        }
    }
}