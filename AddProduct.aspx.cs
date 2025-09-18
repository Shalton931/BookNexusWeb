using BookNexusWebsite.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookNexusWebsite
{
    public partial class AddProduct : System.Web.UI.Page
    {
        Service1Client client = new Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            try
            {
                // Create a new Book object with form values
                Book newBook = new Book
                {
                    title = txtTitle.Text.Trim(),
                    author = txtAuthor.Text.Trim(),
                    price = decimal.Parse(txtPrice.Text),
                    quantity = int.Parse(txtQuantity.Text),
                    genre = txtGenre.Text.Trim(),
                    language = txtLanguage.Text.Trim(),
                    Image = txtImage.Text.Trim(),
                    description = txtDescription.Text.Trim(),
                    isActive = 1 // Set default value for isActive
                };

                // Call the service method to add product
                bool result = client.AddProduct(newBook);

                if (result)
                {
                    lblResponse.Text = "Book added successfully!";
                    lblResponse.CssClass = "response-message success";

                    // Clear the form
                    ClearForm();
                }
                else
                {
                    lblResponse.Text = "Error adding book. It may already exist in the database.";
                    lblResponse.CssClass = "response-message error";
                }
            }
            catch (FormatException)
            {
                lblResponse.Text = "Please check your input values. Price and Quantity must be numbers.";
                lblResponse.CssClass = "response-message error";
            }
            catch (Exception ex)
            {
                lblResponse.Text = "An error occurred: " + ex.Message;
                lblResponse.CssClass = "response-message error";
            }
        }

        private void ClearForm()
        {
            txtTitle.Text = "";
            txtAuthor.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "1";
            txtGenre.Text = "";
            txtLanguage.Text = "";
            txtImage.Text = "";
            txtDescription.Text = "";
        }
    }
    
}