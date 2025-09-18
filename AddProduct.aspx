<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="BookNexusWebsite.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .form-container {
            max-width: 800px;
            margin: 30px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        
        .form-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }
        
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        
        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group textarea {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .form-group textarea {
            min-height: 100px;
            resize: vertical;
        }
        
        .full-width {
            grid-column: span 2;
        }
        
        .btn-add {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            margin: 20px auto 0;
            width: 200px;
        }
        
        .btn-add:hover {
            background-color: #45a049;
        }
        
        .response-message {
            text-align: center;
            padding: 10px;
            margin-top: 15px;
            border-radius: 4px;
        }
        
        .success {
            background-color: #dff0d8;
            color: #3c763d;
            border: 1px solid #d6e9c6;
        }
        
        .error {
            background-color: #f2dede;
            color: #a94442;
            border: 1px solid #ebccd1;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sections" runat="server">
    <div class="form-container">
        <h2><u>Add a New Book</u></h2>
        
        <div class="form-grid">
            <!-- First Column -->
            <div class="form-group">
                <asp:Label ID="lblName" runat="server" Text="Book Title *"></asp:Label>
                <asp:TextBox ID="txtTitle" runat="server" placeholder="Enter book title" required="true"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblAuthor" runat="server" Text="Author *"></asp:Label>
                <asp:TextBox ID="txtAuthor" runat="server" placeholder="Enter author name" required="true"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblPrice" runat="server" Text="Price *"></asp:Label>
                <asp:TextBox ID="txtPrice" runat="server" placeholder="0.00" TextMode="Number" step="0.01" min="0" required="true"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblQuantity" runat="server" Text="Quantity *"></asp:Label>
                <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" min="1" required="true" value="1"></asp:TextBox>
            </div>
            
            <!-- Second Column -->
            <div class="form-group">
                <asp:Label ID="lblGenre" runat="server" Text="Genre *"></asp:Label>
                <asp:TextBox ID="txtGenre" runat="server" placeholder="Enter genre" required="true"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblLanguage" runat="server" Text="Language *"></asp:Label>
                <asp:TextBox ID="txtLanguage" runat="server" placeholder="Enter language" required="true"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblImage" runat="server" Text="Image URL"></asp:Label>
                <asp:TextBox ID="txtImage" runat="server" placeholder="Enter image URL"></asp:TextBox>
            </div>
            
            <!-- Full width elements -->
            <div class="form-group full-width">
                <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" placeholder="Enter book description"></asp:TextBox>
            </div>
        </div>
        
        <asp:Label ID="lblResponse" runat="server" Text="" CssClass="response-message"></asp:Label>
        
        <asp:Button ID="btnAddProduct" runat="server" Text="Add Book" CssClass="btn-add" OnClick="btnAddProduct_Click" />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
