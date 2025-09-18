<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BookNexusWebsite.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sections" runat="server">
  <div class="form-container">
        <h2 id="Register"><u>Register New Account</u></h2>
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
            
            <!-- User Type Selection (Visible only to Managers) -->
            <div id="userTypeContainer" runat="server" class="user-type-container" visible="false">
                <span class="user-type-label">User Type:</span>
                <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                    <asp:ListItem Value="C" Text="Customer" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="M" Text="Manager"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Label ID="lblResponse" runat="server" Text=""></asp:Label>

            <br />
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />

            <div class="auth-switch">
                Already have an account? <a href="Login.aspx">Sign in</a>
            </div>
        </div>
        <asp:Label ID="lblMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
