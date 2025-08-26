<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="BookNexusWeb.Frontend.Admin" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Admin Dashboard - BookNexus</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Book Nexus - Admin Dashboard</h1>
            <p><em><u>Administrative Control Panel</u></em></p>
            <asp:Label ID="lblAdminWelcome" runat="server"></asp:Label>
        </header>

        <nav>
            <asp:LinkButton ID="lnkSales" runat="server" Text="Sales Tracking" OnClick="lnkSales_Click" CssClass="tab active"></asp:LinkButton>
            <asp:LinkButton ID="lnkComplaints" runat="server" Text="Complaints" OnClick="lnkComplaints_Click" CssClass="tab"></asp:LinkButton>
            <asp:LinkButton ID="lnkReports" runat="server" Text="Reports" OnClick="lnkReports_Click" CssClass="tab"></asp:LinkButton>
            <asp:LinkButton ID="lnkProducts" runat="server" Text="Product Management" OnClick="lnkProducts_Click" CssClass="tab"></asp:LinkButton>
            <asp:LinkButton ID="lnkUsers" runat="server" Text="User Management" OnClick="lnkUsers_Click" CssClass="tab"></asp:LinkButton>
            <asp:LinkButton ID="lnkInvoices" runat="server" Text="Invoices" OnClick="lnkInvoices_Click" CssClass="tab"></asp:LinkButton>
            <asp:LinkButton ID="lnkLogOut" runat="server" Text="Log Out" OnClick="lnkLogOut_Click" CssClass="tab"></asp:LinkButton>
        </nav>

        <div class="admin-stats">
            <div class="stat-card">
                <div class="stat-label">Total Books Sold</div>
                <div class="stat-number"><asp:Label ID="lblTotalSold" runat="server" Text="0"></asp:Label></div>
            </div>

            <div class="stat-card">
                <div class="stat-label">Revenue</div>
                <div class="stat-number">R<asp:Label ID="lblTotalRevenue" runat="server" Text="0"></asp:Label></div>
            </div>

            <div class="stat-card">
                <div class="stat-label">Pending Complaints</div>
                <div class="stat-number"><asp:Label ID="lblPendingComplaints" runat="server" Text="0"></asp:Label></div>
            </div>

            <div class="stat-card">
                <div class="stat-label">Registered Users</div>
                <div class="stat-number"><asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label></div>
            </div>

            <asp:Repeater ID="rptComplaints" runat="server">
                <ItemTemplate>
                     <div>
                          <b><%# Eval("UserName") %></b> - <%# Eval("Status") %> - <%# Eval("ComplaintText") %> - <%# Eval("SubmissionDate") %>
                     </div>
                </ItemTemplate>
           </asp:Repeater>


        </div>

        <!-- Tables / placeholders -->
        <asp:GridView ID="gvSales" runat="server" AutoGenerateColumns="true"></asp:GridView>
        <asp:GridView ID="gvComplaints" runat="server" AutoGenerateColumns="true"></asp:GridView>
        <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="true"></asp:GridView>
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="true"></asp:GridView>
        <asp:GridView ID="gvInvoices" runat="server" AutoGenerateColumns="true"></asp:GridView>

        <footer>
            <p>&copy; 2025 Book Nexus Book Shop. All rights reserved.</p>
        </footer>
    </form>
</body>
</html>
