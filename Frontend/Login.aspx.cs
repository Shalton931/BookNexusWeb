using BookNexusWeb.ServiceReference1;
using HashPass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookNexusWeb
{
    public partial class Login : System.Web.UI.Page
    {
        Service1Client client = new Service1Client();
        private string connectionString  = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=BookNexusDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
           
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //get name and password to compare to database data then login if user exists
            string email = txtEmail.Text;
            string password = Secrecy.HashPassword(txtPassword.Text);
            
            if (IsValidUser(email, password))
            {
                // Get user details including type
                int userType = GetUserType(email);
                
                // Store user type in session
                Session["UserType"] = userType;
                
                // Redirect based on user type
                if (userType == 2) // Admin
                {
                    Response.Redirect("Admin.aspx");
                }
                else // Regular user
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                lblMessage.Text = "Invalid username or password. Please try again.";
                lblMessage.Visible = true;
            }
        }

        private bool IsValidUser(string email, string password)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM [User] WHERE email = @email AND password = @password AND isActive = 1";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                
                conn.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                
                return count > 0;
            }
        }
        
        private int GetUserType(string email)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT type FROM [User] WHERE email = @email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@email", email);
                
                conn.Open();
                object result = cmd.ExecuteScalar();
                
                if (result != null && result != DBNull.Value)
                {
                    return Convert.ToInt32(result);
                }
                
                return 1; // Default to regular user if type is not set
            }
        }
    }
}