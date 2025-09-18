<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AboutProduct.aspx.cs" Inherits="BookNexusWebsite.AboutProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sections" runat="server">
    <div class="container main-content">
        <div class="book-card">
            <div class="book-header">
                <h2>Book Details</h2>
            </div>
            <div class="book-details-container">
                <div class="book-image" id="imageID" runat="server">
                    <!-- Image will be populated server-side -->
                </div>
                <div class="book-info">
                    <div class="book-title" id="productNameID" runat="server">
                        <!-- Product name will be populated server-side -->
                    </div>
                    <div class="book-description">
                        <p id="productDescriptionID" runat="server">
                            <!-- Description will be populated server-side -->
                        </p>
                    </div>
                    
                    <div class="book-meta">
                        <p id="authorID" runat="server">
                            <!-- Author will be populated server-side -->
                        </p>
                        <p id="productPriceIS" runat="server">
                            <!-- Price will be populated server-side -->
                        </p>
                        <p id="genreID" runat="server">
                            <!-- Genre will be populated server-side -->
                        </p>
                    </div>
                    
                    <div class="book-actions">
                        <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" 
                            CssClass="add-to-cart" OnClick="btnAddToCart_Click" />
                        <asp:Button ID="btnAddToWishlist" runat="server" Text="Add to Wishlist" 
                            CssClass="wishlist" OnClick="btnAddToWishlist_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
