<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="BookNexusWebsite.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Sections" runat="server">
    <div class="container main-content">
        <div class="checkout-container">
            <h1 class="checkout-header">Checkout</h1>
            
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" EnableViewState="false" Visible="false"></asp:Label>
            
            <asp:Panel ID="pnlCheckoutForm" runat="server" Visible="false">
                <div class="checkout-summary">
                    <h3>Order Summary</h3>
                    <asp:GridView ID="gvOrderSummary" runat="server" AutoGenerateColumns="false" CssClass="cart-table">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Book Title" />
                            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="R{0:N2}" />
                            <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                            <asp:TemplateField HeaderText="Subtotal">
                                <ItemTemplate>
                                    R<%# (Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity"))).ToString("N2") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <div class="order-total">
                        <strong>Total: R<asp:Label ID="lblOrderTotal" runat="server" Text="0.00"></asp:Label></strong>
                    </div>
                </div>

                <div class="checkout-form">
                    <h3>Shipping Information</h3>
                    <div class="form-grid">
                        <div class="form-group">
                            <label>Full Name</label>
                            <asp:TextBox ID="txtFullName" runat="server" Required="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Required="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" Required="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" Required="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>City</label>
                            <asp:TextBox ID="txtCity" runat="server" Required="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Postal Code</label>
                            <asp:TextBox ID="txtPostalCode" runat="server" Required="true"></asp:TextBox>
                        </div>
                    </div>

                    <h3>Payment Information</h3>
                    <div class="form-grid">
                        <div class="form-group">
                            <label>Card Number</label>
                            <asp:TextBox ID="txtCardNumber" runat="server" Required="true" placeholder="XXXX XXXX XXXX XXXX"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Expiry Date</label>
                            <asp:TextBox ID="txtExpiryDate" runat="server" Required="true" placeholder="MM/YY"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>CVV</label>
                            <asp:TextBox ID="txtCVV" runat="server" Required="true" placeholder="XXX" MaxLength="3"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Cardholder Name</label>
                            <asp:TextBox ID="txtCardholderName" runat="server" Required="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="checkout-actions">
                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick="btnPlaceOrder_Click" CssClass="btn-checkout" />
                        <a href="Cart.aspx" class="btn-continue">Back to Cart</a>
                    </div>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlOrderConfirmation" runat="server" Visible="false" CssClass="order-confirmation">
                <h2>Order Confirmation</h2>
                <p>Thank you for your order, <asp:Label ID="lblCustomerName" runat="server" Font-Bold="true"></asp:Label>!</p>
                <p>Your order has been successfully placed.</p>
                <div class="order-details">
                    <h4>Order Details:</h4>
                    <p><strong>Order Number:</strong> <asp:Label ID="lblOrderNumber" runat="server"></asp:Label></p>
                    <p><strong>Order Total:</strong> R<asp:Label ID="lblConfirmationTotal" runat="server"></asp:Label></p>
                    <p><strong>Shipping Address:</strong> <asp:Label ID="lblShippingAddress" runat="server"></asp:Label></p>
                </div>
                <div class="confirmation-actions">
                    <a href="Home.aspx" class="btn-continue">Continue Shopping</a>
                    <asp:Button ID="btnPrintReceipt" runat="server" Text="Print Receipt" OnClientClick="window.print(); return false;" CssClass="btn-details" />
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>