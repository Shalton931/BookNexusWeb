<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BookNexusWeb.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register - BookNexus</title>
    <link rel="stylesheet" href="Style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Book Nexus</h1>
            <p><em><u>Where your reading experience is elevated</u></em></p>
        </header>
        
        <nav>
            <ul>
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="Default.aspx#bought">Most Bought</a></li>
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="Register.aspx">Register</a></li>
            </ul>
        </nav>

        <div class="form-container">
            <h2><u>Register New Account</u></h2>
            <div class="form-grid">
                <div class="form-group">
                    <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName" Text="Name:"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" required="true"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="lblSurname" runat="server" AssociatedControlID="txtSurname" Text="Surname:"></asp:Label>
                    <asp:TextBox ID="txtSurname" runat="server" required="true"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="Email:"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" required="true"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Password:"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required="true"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtConfirmPassword" Text="Confirm Password:"></asp:Label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" required="true"></asp:TextBox>
                </div>
                
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="btn" />
                
                <div class="auth-switch">
                    Already have an account? <a href="Login.aspx">Sign in</a>
                </div>
            </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
        </div>
        
        <footer>
            <p>&copy; 2025 Book Nexus Book Shop. All rights reserved.</p>
        </footer>
    </form>
</body>
</html>