using BookNexusWeb.ServiceReference1;
using HashPass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookNexusWeb
{
     
    public partial class Register : System.Web.UI.Page
    {
        Service1Client client = new Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //check to see if passwords match
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "Passwords do not match.";
                lblMessage.Visible = true;
                return;
            }
            //save inputs from textboxes
            string name = txtName.Text;
            string surname = txtSurname.Text;
            string email = txtEmail.Text;
            string password = Secrecy.HashPassword(txtPassword.Text);

            
            try
            {
                bool success = client.Register(name, surname, email, password);
                if (success)
                {
                    Response.Redirect("Login.aspx");
                   /// bool success = client.Register(name, surname, email, password);
                }
                else
                {
                    lblMessage.Text = "Registration failed. Please try a different username.";
                    lblMessage.Visible = true;
                }
            }
            catch(Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
            
        }

    }
}