using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BookNexusWebsite
{
    public partial class Main : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateCartCount();

                // Set welcome message if user is logged in
                if (Session["Username"] != null)
                {
                    lblWelcome.Text = "Welcome, " + Session["Username"].ToString();
                    lblWelcome.Visible = true;
                }
            }
        }

        public void UpdateCartCount()
        {
            DataTable cart = Session["Cart"] as DataTable;
            int count = 0;

            if (cart != null)
            {
                foreach (DataRow row in cart.Rows)
                {
                    count += Convert.ToInt32(row["Quantity"]);
                }
            }

            lblCartCount.Text = count.ToString();
        }

        public HtmlControl getRegisterID
        {
            get { return registerID; }
        }

        public HtmlControl getLoginID
        {
            get { return loginID; }
        }

        public HtmlControl getLogoutID
        {
            get { return logoutID; }
        }
        
       public HtmlControl getProductManagementID
        {
            get { return ProductManagementId; }
        }
       
        public HtmlControl getUserManagemnentId
        {
            get { return UserManagemnentId; }
        }

    }
 }






