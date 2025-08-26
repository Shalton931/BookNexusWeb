<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BookNexusWeb.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - BookNexus</title>
    <link rel="stylesheet" href="Style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Book Nexus</h1>
            <%--<p><em><u>Where your reading experience is elevated</u></em></p>--%>
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
            <h2><u>Login to Your Account</u></h2>
            <div class="form-grid">
                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="Email:"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" required="true"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Password:"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required="true"></asp:TextBox>
                </div>
                
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn" />
                
                <div class="auth-switch">
                    Don't have an account? <a href="Register.aspx">Sign up</a>
                </div>
            </div>
            <p style="text-align: center; margin-top: 15px;"><em><u>Forgot your password?</u></em></p>
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
        </div>
        
        <footer>
            <p>&copy; 2025 Book Nexus Book Shop. All rights reserved.</p>
        </footer>
    </form>
</body>
</html>