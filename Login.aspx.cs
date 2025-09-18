using BookNexusWebsite.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookNexusWebsite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // get my id's from my master page
            var master = Master as Main;
            char type = Convert.ToChar(Session["type"]);

            if (type == 'C')
            {
                master.getRegisterID.Visible = false;
                master.getLoginID.Visible = false;
                master.getLogoutID.Visible = true;

            }
            else if (type == 'M')
            {
                master.getRegisterID.Visible = false;
                master.getLoginID.Visible = false;
                master.getLogoutID.Visible = true;
                master.getUserManagemnentId.Visible = true;
                master.getProductManagementID.Visible = true;
            }
            else
            {
                master.getRegisterID.Visible = true;
                master.getLoginID.Visible = true;
                master.getLogoutID.Visible = false;
            }
        }

            protected void btnLogin_Click(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            string strEmail = txtEmail.Text;
            string strPassword = txtPassword.Text;
            // login
             var user = client.LoginUser(strEmail, strPassword);

            if (user == null)
            {
                // user does not exist
                lblResponse.ForeColor = System.Drawing.Color.Red;
                lblResponse.Text = "Incorrect Account Details!";
            }
            else
            {
                // user exist
                lblResponse.ForeColor = System.Drawing.Color.Green;
                lblResponse.Text = Convert.ToString(user);
                Session["type"] = user.type;
                Session["UserID"] = user.user_ID;
                Session["isLoggedIn"] = 'Y';
                Response.Redirect("Home.aspx");
            }
        }
    }
}