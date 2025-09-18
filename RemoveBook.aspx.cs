using BookNexusWebsite.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookNexusWebsite
{
    public partial class RemoveBook : System.Web.UI.Page
    {
        Service1Client client = new Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFindBook_Click(object sender, EventArgs e)
        {
            try
            {
                int bookId = int.Parse(txtBookID.Text);
                Book book = client.GetProduct(bookId);

                if (book != null)
                {
                    lblTitle.Text = book.title;
                    lblAuthor.Text = book.author;
                    lblGenre.Text = book.genre;
                    lblPrice.Text = book.price.ToString();
                    lblQuantity.Text = book.quantity.ToString();

                    pnlBookDetails.Visible = true;
                    pnlMessage.Visible = false;
                }
                else
                {
                    ShowMessage("Book not found with the given ID.", "error");
                    pnlBookDetails.Visible = false;
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "error");
                pnlBookDetails.Visible = false;
            }
        }

        protected void btnRemoveBook_Click(object sender, EventArgs e)
        {
            try
            {
                int bookId = int.Parse(txtBookID.Text);
                bool result = client.RemoveProductByID(bookId, 0); // Set quantity to 0 and isActive to 0

                if (result)
                {
                    ShowMessage("Book removed successfully!", "success");
                    pnlBookDetails.Visible = false;
                    txtBookID.Text = "";
                }
                else
                {
                    ShowMessage("Failed to remove book.", "error");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "error");
            }

        }
        private void ShowMessage(string message, string type)
        {
            pnlMessage.Visible = true;
            lblMessage.Text = message;
            pnlMessage.CssClass = "message " + type;
        }
    }
}