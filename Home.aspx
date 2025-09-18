<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BookNexusWebsite.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sections" runat="server">
  <div class="container main-content">
        <div class="catalogue-header">
            <h2><u>Our Catalogue</u></h2>
        </div>
        <div class="category-filters">
            <h3>Filter by Category:</h3>
            <button class="filter-btn active" data-category="all">All Books</button>
            <button class="filter-btn" data-category="babies">Small Babies</button>
            <button class="filter-btn" data-category="toddlers">Toddlers</button>
            <button class="filter-btn" data-category="teenagers">Teenagers</button>
            <button class="filter-btn" data-category="adults">Adults</button>
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="error-message" EnableViewState="false"></asp:Label>
        <div class="product-grid" id="myProduct" runat="server"></div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>