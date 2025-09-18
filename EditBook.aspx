<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="EditBook.aspx.cs" Inherits="BookNexusWebsite.EditBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sections" runat="server">
    <div class="form-container">
        <h2>Edit Book</h2>
        
        <div class="form-group">
            <label for="txtBookID">Book ID:</label>
            <asp:TextBox ID="txtBookID" runat="server" CssClass="form-control" required="true" TextMode="Number"></asp:TextBox>
        </div>
        
        <asp:Button ID="btnFindBook" runat="server" Text="Find Book" CssClass="btn-info" OnClick="btnFindBook_Click" />
        
        <asp:Panel ID="pnlEditForm" runat="server" Visible="false">
            <div class="form-group">
                <label for="txtTitle">Title:</label>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" required="true"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtAuthor">Author:</label>
                <asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control" required="true"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtGenre">Genre:</label>
                <asp:TextBox ID="txtGenre" runat="server" CssClass="form-control" required="true"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtLanguage">Language:</label>
                <asp:TextBox ID="txtLanguage" runat="server" CssClass="form-control" required="true"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtPrice">Price:</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" required="true" TextMode="Number" step="0.01"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtQuantity">Quantity:</label>
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" required="true" TextMode="Number"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtImageURL">Image URL:</label>
                <asp:TextBox ID="txtImageURL" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            
            <asp:Button ID="btnUpdateBook" runat="server" Text="Update Book" CssClass="btn-primary" OnClick="btnUpdateBook_Click" />
        </asp:Panel>
        
        <asp:Panel ID="pnlMessage" runat="server" CssClass="message" Visible="false">
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </asp:Panel>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
