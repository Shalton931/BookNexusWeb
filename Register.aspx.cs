using BookNexusWebsite.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BookNexusWebsite
{
    public partial class Register : System.Web.UI.Page
    {
        Service1Client client = new Service1Client();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Get references from master page
            var master = Master as Main;

            // Check if user is logged in and get their type
            char type = 'G'; // Default to Guest
            if (Session["type"] != null)
            {
                type = Convert.ToChar(Session["type"]);
            }

            // Set navigation visibility based on user type
            if (type == 'C')
            {
                master.getRegisterID.Visible = false;
                master.getLoginID.Visible = false;
                master.getLogoutID.Visible = true;
                userTypeContainer.Visible = false; // Customers can't set user type
            }
            else if (type == 'M')
            {
                master.getRegisterID.Visible = false;
                master.getLoginID.Visible = false;
                master.getLogoutID.Visible = true;
                master.getUserManagemnentId.Visible = true;
                master.getProductManagementID.Visible = true;
                userTypeContainer.Visible = true; // Managers can set user type
            }
            else
            {
                master.getRegisterID.Visible = true;
                master.getLoginID.Visible = true;
                master.getLogoutID.Visible = false;
                userTypeContainer.Visible = false; // Guests can't set user type
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string firstName = txtName.Text;
            string lastName = txtSurname.Text;
            string Email = txtEmail.Text;
            string password = txtPassword.Text;
            string confirmPass = txtConfirmPassword.Text;

            // Determine user type based on who is registering
            char userType = 'C'; // Default to Customer

            // If a manager is registering someone, use their selection
            if (Session["type"] != null && Convert.ToChar(Session["type"]) == 'M')
            {
                userType = Convert.ToChar(ddlUserType.SelectedValue);
            }

            if (password == confirmPass)
            {
                var response = client.Register(firstName, lastName, Email, password, userType);

                if (response == 0)
                {
                    // User registered successfully
                    if (Session["type"] != null && Convert.ToChar(Session["type"]) == 'M')
                    {
                        // If manager added a user, show success and stay on page
                        lblResponse.ForeColor = System.Drawing.Color.Green;
                        lblResponse.Text = "User registered successfully!";

                        // Clear form for potential next registration
                        txtName.Text = "";
                        txtSurname.Text = "";
                        txtEmail.Text = "";
                        txtPassword.Text = "";
                        txtConfirmPassword.Text = "";
                    }
                    else
                    {
                        // Regular user registration, redirect to login
                        Response.Redirect("Login.aspx");
                    }
                }
                else if (response == 1)
                {
                    // User already exists
                    lblResponse.ForeColor = System.Drawing.Color.Red;
                    lblResponse.Text = "Account already exists, try logging in!";
                }
                else if (response == -1)
                {
                    // Some error occurred
                    lblResponse.ForeColor = System.Drawing.Color.Red;
                    lblResponse.Text = "Internal server error. Please try again later.";
                }
            }
            else
            {
                // Passwords do not match
                lblResponse.ForeColor = System.Drawing.Color.Red;
                lblResponse.Text = "Passwords do not match";
            }
        }

        // Property to access the user type container (for master page if needed)
        public HtmlControl UserTypeContainer
        {
            get { return userTypeContainer; }
        }
    }
}