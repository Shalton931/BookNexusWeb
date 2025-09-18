<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BookNexusWebsite.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Sections" runat="server">
    <div class="cart-container">
        <h1 class="cart-header">Your Shopping Cart</h1>
        
        <asp:Label ID="lblMessage" runat="server" CssClass="error-message" EnableViewState="false"></asp:Label>
        
        <asp:Panel ID="pnlCartItems" runat="server" Visible="false">
            <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="false" CssClass="cart-table" 
                OnRowCommand="gvCart_RowCommand" OnRowDataBound="gvCart_RowDataBound" ShowFooter="true">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Book Title" />
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            R<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price", "{0:N2}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <div class="quantity-controls">
                                <asp:Button ID="btnDecrease" runat="server" Text="-" CommandName="DecreaseQuantity" 
                                    CommandArgument='<%# Container.DataItemIndex %>' CssClass="quantity-btn" />
                                <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>' 
                                    CssClass="quantity-input" ReadOnly="true" />
                                <asp:Button ID="btnIncrease" runat="server" Text="+" CommandName="IncreaseQuantity" 
                                    CommandArgument='<%# Container.DataItemIndex %>' CssClass="quantity-btn" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subtotal">
                        <ItemTemplate>
                            R<asp:Label ID="lblSubtotal" runat="server" 
                                Text='<%# (Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity"))).ToString("N2") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remove">
                        <ItemTemplate>
                            <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandName="RemoveFromCart" 
                                CommandArgument='<%# Container.DataItemIndex %>' CssClass="remove-btn" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle Font-Bold="true" BackColor="#f8f0fc" />
            </asp:GridView>
            
            <div class="cart-summary">
                <h3>Order Summary</h3>
                <p><strong>Total: R<asp:Label ID="lblCartTotal" runat="server" Text="0.00"></asp:Label></strong></p>
            </div>
            
            <div class="cart-actions">
                <a href="Home.aspx" class="btn-continue">Continue Shopping</a>
                <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" 
                    OnClick="btnCheckout_Click" CssClass="btn-checkout" />
            </div>
        </asp:Panel>
        
        <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false" CssClass="empty-cart">
            <h2>Your cart is empty</h2>
            <p>Looks like you haven't added any items to your cart yet.</p>
            <a href="Home.aspx" class="btn-continue">Browse Books</a>
        </asp:Panel>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>