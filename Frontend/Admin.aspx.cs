using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookNexusWeb.ServiceReference1;

namespace BookNexusWeb.Frontend
{
    public partial class Admin : System.Web.UI.Page

    {
        Service1Client client = new Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblAdminWelcome.Text = "Welcome, Admin!";
                LoadStatistics();
                LoadSales();
                LoadComplaints();
            }

        }
        private void LoadStatistics()
        {
            // Example values; replace with actual DB queries
            lblTotalSold.Text = "127";
            lblTotalRevenue.Text = "12500";
            lblPendingComplaints.Text = "3";
            lblTotalUsers.Text = "42";
        }


        private void LoadSales()
        {
            var sales = new List<Sale>
            {
                new Sale { Title="It Ends With Us", Quantity=15, SaleDate="2025-01-15", Price=220, Total=3300 },
                new Sale { Title="Till Summer Do Us Part", Quantity=12, SaleDate="2025-01-14", Price=300, Total=3600 }
            };
            gvSales.DataSource = sales;
            gvSales.DataBind();
        }

        private void LoadComplaints()
        {
            var complaints = new List<Complaint>
            {
                new Complaint { UserName="John Smith", Status="Pending", ComplaintText="My book arrived damaged", SubmissionDate="2025-01-14" },
                new Complaint { UserName="Emma Johnson", Status="Resolved", ComplaintText="Email not received", SubmissionDate="2025-01-13" }
            };
            rptComplaints.DataSource = complaints;
            rptComplaints.DataBind();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session and redirect
            Session.Clear();
            Response.Redirect("Login.aspx");
        }


        protected void lnkSales_Click(object sender, EventArgs e) { /* Load Sales tab */ }
        protected void lnkComplaints_Click(object sender, EventArgs e) { /* Load Complaints tab */ }
        protected void lnkReports_Click(object sender, EventArgs e) { /* Load Reports tab */ }
        protected void lnkProducts_Click(object sender, EventArgs e) { /* Load Products tab */ }
        protected void lnkUsers_Click(object sender, EventArgs e) { /* Load Users tab */ }
        protected void lnkInvoices_Click(object sender, EventArgs e) { /* Load Invoices tab */ }
        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }





    }

    public class Sale
    {
        public string Title { get; set; }
        public int Quantity { get; set; }
        public string SaleDate { get; set; }
        public decimal Price { get; set; }
        public decimal Total { get; set; }
    }

    public class Complaint
    {
        public string UserName { get; set; }
        public string Status { get; set; }
        public string ComplaintText { get; set; }
        public string SubmissionDate { get; set; }
    }

}
