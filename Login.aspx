<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BookNexusWebsite.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sections" runat="server">
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
            <asp:Label ID="lblResponse" runat="server" Text=""></asp:Label>

            <br />

            <div class="login">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </div>


            <div class="auth-switch">
                Don't have an account? <a href="Register.aspx">Sign up</a>3
            </div>
        </div>
        <p style="text-align: center; margin-top: 15px;"><em><u>Forgot your password?</u></em></p>
        <asp:Label ID="lblMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
