<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RemoveBook.aspx.cs" Inherits="BookNexusWebsite.RemoveBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sections" runat="server">
     <div class="form-container">
        <h2>Remove Book</h2>
        
        <div class="form-group">
            <label for="txtBookID">Book ID:</label>
            <asp:TextBox ID="txtBookID" runat="server" CssClass="form-control" required="true" TextMode="Number"></asp:TextBox>
        </div>
        
        <asp:Button ID="btnFindBook" runat="server" Text="Find Book" CssClass="btn-primary" OnClick="btnFindBook_Click" />
        
        <asp:Panel ID="pnlBookDetails" runat="server" CssClass="book-details" Visible="false">
            <h3>Book Details</h3>
            <p><strong>Title:</strong> <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></p>
            <p><strong>Author:</strong> <asp:Label ID="lblAuthor" runat="server" Text=""></asp:Label></p>
            <p><strong>Genre:</strong> <asp:Label ID="lblGenre" runat="server" Text=""></asp:Label></p>
            <p><strong>Price:</strong> R<asp:Label ID="lblPrice" runat="server" Text=""></asp:Label></p>
            <p><strong>Quantity:</strong> <asp:Label ID="lblQuantity" runat="server" Text=""></asp:Label></p>
            
            <asp:Button ID="btnRemoveBook" runat="server" Text="Remove Book" CssClass="btn-danger" OnClick="btnRemoveBook_Click" />
        </asp:Panel>
        
        <asp:Panel ID="pnlMessage" runat="server" CssClass="message" Visible="false">
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </asp:Panel>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
