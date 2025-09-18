using BookNexusWebsite.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookNexusWebsite
{
    public partial class EditBook : System.Web.UI.Page

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
                    txtTitle.Text = book.title;
                    txtAuthor.Text = book.author;
                    txtDescription.Text = book.description;
                    txtGenre.Text = book.genre;
                    txtLanguage.Text = book.language;
                    txtPrice.Text = book.price.ToString();
                    txtQuantity.Text = book.quantity.ToString();
                    txtImageURL.Text = book.Image;

                    pnlEditForm.Visible = true;
                    pnlMessage.Visible = false;
                }
                else
                {
                    ShowMessage("Book not found with the given ID.", "error");
                    pnlEditForm.Visible = false;
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "error");
                pnlEditForm.Visible = false;
            }

        }
        protected void btnUpdateBook_Click(object sender, EventArgs e)
        {
            try
            {
                int bookId = int.Parse(txtBookID.Text);

                Book book = new Book
                {
                    book_ID = bookId,
                    title = txtTitle.Text,
                    author = txtAuthor.Text,
                    description = txtDescription.Text,
                    genre = txtGenre.Text,
                    language = txtLanguage.Text,
                    price = decimal.Parse(txtPrice.Text),
                    quantity = int.Parse(txtQuantity.Text),
                    Image = txtImageURL.Text,
                    isActive = 1
                };

                
                bool result = client.UpdateProduct(book);

                if (result)
                {
                    ShowMessage("Book updated successfully!", "success");
                }
                else
                {
                    ShowMessage("Failed to update book.", "error");
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