<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Nexus Bookshop</title>
    <link rel="stylesheet" href="Style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Book Nexus</h1>
            <p><em><u>Where your reading experience is elevated</u></em></p>
            <asp:Label ID="lblWelcome" runat="server" CssClass="welcome-message" Visible="false"></asp:Label>
        </header>
        
        <nav>
            <ul>
                <li><asp:LinkButton ID="lnkHome" runat="server" OnClick="ShowSection" CommandArgument="home">Home</asp:LinkButton></li>
                <li><asp:LinkButton ID="lnkBought" runat="server" OnClick="ShowSection" CommandArgument="bought">Most Bought</asp:LinkButton></li>
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="Register.aspx">Register</a></li>
                <li>
                    <asp:LinkButton ID="lnkCart" runat="server" OnClick="ShowSection" CommandArgument="cart-section">
                        🛒 (<asp:Label ID="lblCartCount" runat="server" Text="0"></asp:Label>)
                    </asp:LinkButton>
                <li><asp:LinkButton ID="lnkLogOut" runat="server" Text="Log Out" OnClick="lnkLogOut_Click" CssClass="tab"></asp:LinkButton></li>
                </li>
            </ul>
        </nav>

        <asp:Panel ID="pnlHome" runat="server" CssClass="main-content">
            <div class="container">
                <h3 style="color: darkviolet;"><u>Our Catalogue</u></h3>
                <div class="product-grid">
                    <div class="product-card">
                        <asp:LinkButton ID="lnkBook1" runat="server" OnClick="ShowSection" CommandArgument="it-ends-with-us">
                            <img src="https://m.media-amazon.com/images/I/51-mkfoqamL.jpg" alt="It Ends With Us" />
                            <h3 style="color: pink;">It Ends With Us</h3>
                            <p><strong><em>Colleen Hoover</em></strong></p>
                        </asp:LinkButton>
                        <div class="price">R220 <del>R250</del></div>
                        <asp:Button ID="btnAddCart1" runat="server" CssClass="add-to-cart" Text="Add to Cart" 
                            OnClick="AddToCart_Click" CommandArgument='{"title":"It Ends With Us","price":220}' />
                        <button class="wishlist">♡</button>
                    </div>
                    
                    <div class="product-card">
                        <asp:LinkButton ID="lnkBook2" runat="server" OnClick="ShowSection" CommandArgument="Till-Summer-Do-Us-Part">
                            <img src="https://m.media-amazon.com/images/I/71tmyyAisRL._SY342_.jpg" alt="Till Summer Do Us Part" />
                            <h3 style="color: pink;">Till Summer Do Us Part</h3>
                            <p><strong><em>Meghan Quinn</em></strong></p>
                        </asp:LinkButton>
                        <div class="price">R300 <del>R350</del></div>
                        <asp:Button ID="btnAddCart2" runat="server" CssClass="add-to-cart" Text="Add to Cart" 
                            OnClick="AddToCart_Click" CommandArgument='{"title":"Till Summer Do Us Part","price":300}' />
                        <button class="wishlist">♡</button>
                    </div>
                    
                    <div class="product-card">
                        <asp:LinkButton ID="lnkBook3" runat="server" OnClick="ShowSection" CommandArgument="The-Fourth-Daughter">
                            <img src="https://m.media-amazon.com/images/I/81Ra3BL669L._SY342_.jpg" alt="The Fourth Daughter" />
                            <h3 style="color: pink;">The Fourth Daughter</h3>
                            <p><strong><em>Lyn Liao Butler</em></strong></p>
                        </asp:LinkButton>
                        <div class="price">R280 <del>R320</del></div>
                        <asp:Button ID="btnAddCart3" runat="server" CssClass="add-to-cart" Text="Add to Cart" 
                            OnClick="AddToCart_Click" CommandArgument='{"title":"The Fourth Daughter","price":280}' />
                        <button class="wishlist">♡</button>
                    </div>
                    
                    <div class="product-card">
                        <asp:LinkButton ID="lnkBook4" runat="server" OnClick="ShowSection" CommandArgument="I-Could-Be-Yours">
                            <img src="https://m.media-amazon.com/images/I/813ApiVuCdL._SY342_.jpg" alt="I Could Be Yours" />
                            <h3 style="color: pink;">I Could Be Yours</h3>
                            <p><strong><em>Helena Hunting</em></strong></p>
                        </asp:LinkButton>
                        <div class="price">R270 <del>R300</del></div>
                        <asp:Button ID="btnAddCart4" runat="server" CssClass="add-to-cart" Text="Add to Cart" 
                            OnClick="AddToCart_Click" CommandArgument='{"title":"I Could Be Yours","price":270}' />
                        <button class="wishlist">♡</button>
                    </div>
                    
                    <div class="product-card">
                        <asp:LinkButton ID="lnkBook5" runat="server" OnClick="ShowSection" CommandArgument="Binding-13">
                            <img src="https://m.media-amazon.com/images/I/51SdowshTrL._SY445_SX342_.jpg" alt="Binding 13" />
                            <h3 style="color: pink;">Binding 13</h3>
                            <p><strong><em>Chloe Walsh</em></strong></p>
                        </asp:LinkButton>
                        <div class="price">R290 <del>R330</del></div>
                        <asp:Button ID="btnAddCart5" runat="server" CssClass="add-to-cart" Text="Add to Cart" 
                            OnClick="AddToCart_Click" CommandArgument='{"title":"Binding 13","price":290}' />
                        <button class="wishlist">♡</button>
                    </div>
                    
                   
                    <div class="product-card">
                        <asp:LinkButton ID="lnkBook6" runat="server" OnClick="ShowSection" CommandArgument="Flawless">
                            <img src="https://m.media-amazon.com/images/I/91GUu7WQtdL._SY466_.jpg" alt="Flawless" />
                            <h3 style="color: pink;">Flawless</h3>
                            <p><strong><em>Elsie Silver</em></strong></p>
                        </asp:LinkButton>
                        <div class="price">R350 <del>R400</del></div>
                        <asp:Button ID="btnAddCart6" runat="server" CssClass="add-to-cart" Text="Add to Cart" 
                            OnClick="AddToCart_Click" CommandArgument='{"title":"Flawless","price":350}' />
                        <button class="wishlist">♡</button>
                    </div>
                    
                    <div class="product-card">
                        <asp:LinkButton ID="lnkBook7" runat="server" OnClick="ShowSection" CommandArgument="Heartless">
                            <img src="https://m.media-amazon.com/images/I/41j4D-kX23L._SY445_SX342_.jpg" alt="Heartless" />
                            <h3 style="color: pink;">Heartless</h3>
                            <p><strong><em>Elsie Silver</em></strong></p>
                        </asp:LinkButton>
                        <div class="price">R250 <del>R300</del></div>
                        <asp:Button ID="btnAddCart7" runat="server" CssClass="add-to-cart" Text="Add to Cart" 
                            OnClick="AddToCart_Click" CommandArgument='{"title":"Heartless","price":250}' />
                        <button class="wishlist">♡</button>
                    </div>
                    
                    <div class="product-card">
                        <asp:LinkButton ID="lnkBook8" runat="server" OnClick="ShowSection" CommandArgument="That-Kind-of-Guy">
                            <img src="https://m.media-amazon.com/images/I/71Fl+cahZvL._SY342_.jpg" alt="That Kind of Guy" />
                            <h3 style="color: pink;">That Kind of Guy</h3>
                            <p><strong><em>Stephanie Archer</em></strong></p>
                        </asp:LinkButton>
                        <div class="price">R280 <del>R300</del></div>
                        <asp:Button ID="btnAddCart8" runat="server" CssClass="add-to-cart" Text="Add to Cart" 
                            OnClick="AddToCart_Click" CommandArgument='{"title":"That Kind of Guy","price":280}' />
                        <button class="wishlist">♡</button>
                    </div>
                    
                    <div class="product-card">
                        <asp:LinkButton ID="lnkBook9" runat="server" OnClick="ShowSection" CommandArgument="The-Sins-of-Silas">
                            <img src="https://m.media-amazon.com/images/I/71bpvWVGrhL._SY342_.jpg" alt="The Sins of Silas" />
                            <h3 style="color: pink;">The Sins of Silas</h3>
                            <p><strong><em>Kylie Snow</em></strong></p>
                        </asp:LinkButton>
                        <div class="price">R320 <del>R360</del></div>
                        <asp:Button ID="btnAddCart9" runat="server" CssClass="add-to-cart" Text="Add to Cart" 
                            OnClick="AddToCart_Click" CommandArgument='{"title":"The Sins of Silas","price":320}' />
                        <button class="wishlist">♡</button>
                    </div>
                    
                    <div class="product-card">
                        <asp:LinkButton ID="lnkBook10" runat="server" OnClick="ShowSection" CommandArgument="Once-Upon-A-Broken-Heart">
                            <img src="https://m.media-amazon.com/images/I/51waM0DT-GL._SY445_SX342_.jpg" alt="Once Upon A Broken Heart" />
                            <h3 style="color: pink;">Once Upon A Broken Heart</h3>
                            <p><strong><em>Stephanie Garber</em></strong></p>
                        </asp:LinkButton>
                        <div class="price">R350 <del>R380</del></div>
                        <asp:Button ID="btnAddCart10" runat="server" CssClass="add-to-cart" Text="Add to Cart" 
                            OnClick="AddToCart_Click" CommandArgument='{"title":"Once Upon A Broken Heart","price":350}' />
                        <button class="wishlist">♡</button>
                    </div>
                    
                    <div class="product-card">
                        <asp:LinkButton ID="lnkBook11" runat="server" OnClick="ShowSection" CommandArgument="Lights-Out">
                            <img src="https://m.media-amazon.com/images/I/81OcgtUYWaL._SY342_.jpg" alt="Lights Out" />
                            <h3 style="color: pink;">Lights Out</h3>
                            <p><strong><em>Navessa Allen</em></strong></p>
                        </asp:LinkButton>
                        <div class="price">R200 <del>R300</del></div>
                        <asp:Button ID="btnAddCart11" runat="server" CssClass="add-to-cart" Text="Add to Cart" 
                            OnClick="AddToCart_Click" CommandArgument='{"title":"Lights Out","price":200}' />
                        <button class="wishlist">♡</button>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- Existing book detail panels -->
        <asp:Panel ID="pnlItEndsWithUs" runat="server" CssClass="product-detail" Visible="false">
            <div class="product-detail-image">
                <img src="https://m.media-amazon.com/images/I/51-mkfoqamL.jpg" alt="It Ends With Us" />
            </div>
            <div class="product-detail-info">
                <h1 style="color: purple;">It Ends With Us</h1>
                <p><strong>Author:</strong> <em>Colleen Hoover</em></p>
                <p><strong>Genre:</strong> Contemporary Romance</p>
                <div class="rating">★★★★☆ <strong>4.2/5</strong> (45,678 ratings)</div>
                <h3><u>Description</u></h3>
                <p><em>It Ends With Us</em> is a brave and heartbreaking novel that digs its claws into you and doesn't let go...</p>
                <ul>
                    <li><strong>Publisher:</strong> Atria Books</li>
                    <li><strong>Pages:</strong> 384</li>
                </ul>
                <asp:Button ID="btnBack1" runat="server" CssClass="back-button" Text="Back to Home" OnClick="ShowSection" CommandArgument="home" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlTillSummer" runat="server" CssClass="product-detail" Visible="false">
            <div class="product-detail-image">
                <img src="https://m.media-amazon.com/images/I/71tmyyAisRL._SY342_.jpg" alt="Till Summer Do Us Part" />
            </div>
            <div class="product-detail-info">
                <h1 style="color: purple;">Till Summer Do Us Part</h1>
                <p><strong>Author:</strong> <em>Meghan Quinn</em></p>
                <p><strong>Genre:</strong> Romantic Comedy</p>
                <div class="rating">★★★★☆ <strong>4.5/5</strong> (12,345 ratings)</div>
                <h3><u>Description</u></h3>
                <p><em>Till Summer Do Us Part</em> follows the story of a woman who inherits a beach house and the handsome contractor who helps her renovate it.</p>
                <ul>
                    <li><strong>Publisher:</strong> Montlake Romance</li>
                    <li><strong>Pages:</strong> 318</li>
                </ul>
                <asp:Button ID="btnBack2" runat="server" CssClass="back-button" Text="Back to Home" OnClick="ShowSection" CommandArgument="home" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlFourthDaughter" runat="server" CssClass="product-detail" Visible="false">
            <div class="product-detail-image">
                <img src="https://m.media-amazon.com/images/I/81Ra3BL669L._SY342_.jpg" alt="The Fourth Daughter" />
            </div>
            <div class="product-detail-info">
                <h1 style="color: purple;">The Fourth Daughter</h1>
                <p><strong>Author:</strong> <em>Lyn Liao Butler</em></p>
                <p><strong>Genre:</strong> Psychological Thriller</p>
                <div class="rating">★★★★☆ <strong>4.3/5</strong> (8,765 ratings)</div>
                <h3><u>Description</u></h3>
                <p><em>The Fourth Daughter</em> is a gripping tale about a woman who returns to her childhood home and uncovers dark family secrets.</p>
                <ul>
                    <li><strong>Publisher:</strong> Berkley</li>
                    <li><strong>Pages:</strong> 352</li>
                </ul>
                <asp:Button ID="btnBack3" runat="server" CssClass="back-button" Text="Back to Home" OnClick="ShowSection" CommandArgument="home" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlCouldBeYours" runat="server" CssClass="product-detail" Visible="false">
            <div class="product-detail-image">
                <img src="https://m.media-amazon.com/images/I/813ApiVuCdL._SY342_.jpg" alt="I Could Be Yours" />
            </div>
            <div class="product-detail-info">
                <h1 style="color: purple;">I Could Be Yours</h1>
                <p><strong>Author:</strong> <em>Helena Hunting</em></p>
                <p><strong>Genre:</strong> Contemporary Romance</p>
                <div class="rating">★★★★☆ <strong>4.1/5</strong> (9,876 ratings)</div>
                <h3><u>Description</u></h3>
                <p><em>I Could Be Yours</em> tells the story of two strangers who meet during a destination wedding.</p>
                <ul>
                    <li><strong>Publisher:</strong> Montlake</li>
                    <li><strong>Pages:</strong> 294</li>
                </ul>
                <asp:Button ID="btnBack4" runat="server" CssClass="back-button" Text="Back to Home" OnClick="ShowSection" CommandArgument="home" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlBinding13" runat="server" CssClass="product-detail" Visible="false">
            <div class="product-detail-image">
                <img src="https://m.media-amazon.com/images/I/51SdowshTrL._SY445_SX342_.jpg" alt="Binding 13" />
            </div>
            <div class="product-detail-info">
                <h1 style="color: purple;">Binding 13</h1>
                <p><strong>Author:</strong> <em>Chloe Walsh</em></p>
                <p><strong>Genre:</strong> New Adult Romance</p>
                <div class="rating">★★★★★ <strong>4.7/5</strong> (15,432 ratings)</div>
                <h3><u>Description</u></h3>
                <p><em>Binding 13</em> follows the emotional journey of two teenagers from different worlds.</p>
                <ul>
                    <li><strong>Publisher:</strong> Bloom Books</li>
                    <li><strong>Pages:</strong> 576</li>
                </ul>
                <asp:Button ID="btnBack5" runat="server" CssClass="back-button" Text="Back to Home" OnClick="ShowSection" CommandArgument="home" />
            </div>
        </asp:Panel>

       
        <asp:Panel ID="pnlFlawless" runat="server" CssClass="product-detail" Visible="false">
            <div class="product-detail-image">
                <img src="https://m.media-amazon.com/images/I/91GUu7WQtdL._SY466_.jpg" alt="Flawless" />
            </div>
            <div class="product-detail-info">
                <h1 style="color: purple;">Flawless</h1>
                <p><strong>Author:</strong> <em>Elsie Silver</em></p>
                <p><strong>Genre:</strong> Contemporary Romance</p>
                <div class="rating">★★★★☆ <strong>4.5/5</strong> (12,345 ratings)</div>
                <h3><u>Description</u></h3>
                <p><em>Flawless</em> tells the story of a city girl who finds herself in a small town, clashing with the rugged cowboy who challenges everything she thought she knew about love...</p>
                <ul>
                    <li><strong>Publisher:</strong> Bloom Books</li>
                    <li><strong>Pages:</strong> 412</li>
                    <li><strong>Series:</strong> Chestnut Springs #1</li>
                </ul>
                <asp:Button ID="btnBack6" runat="server" CssClass="back-button" Text="Back to Home" OnClick="ShowSection" CommandArgument="home" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlHeartless" runat="server" CssClass="product-detail" Visible="false">
            <div class="product-detail-image">
                <img src="https://m.media-amazon.com/images/I/41j4D-kX23L._SY445_SX342_.jpg" alt="Heartless" />
            </div>
            <div class="product-detail-info">
                <h1 style="color: purple;">Heartless</h1>
                <p><strong>Author:</strong> <em>Elsie Silver</em></p>
                <p><strong>Genre:</strong> Contemporary Romance</p>
                <div class="rating">★★★★☆ <strong>4.3/5</strong> (9,876 ratings)</div>
                <h3><u>Description</u></h3>
                <p><em>Heartless</em> follows the story of a single dad who never expected to fall for his nanny, especially when he's vowed to never love again...</p>
                <ul>
                    <li><strong>Publisher:</strong> Bloom Books</li>
                    <li><strong>Pages:</strong> 398</li>
                    <li><strong>Series:</strong> Chestnut Springs #2</li>
                </ul>
                <asp:Button ID="btnBack7" runat="server" CssClass="back-button" Text="Back to Home" OnClick="ShowSection" CommandArgument="home" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlThatKindOfGuy" runat="server" CssClass="product-detail" Visible="false">
            <div class="product-detail-image">
                <img src="https://m.media-amazon.com/images/I/71Fl+cahZvL._SY342_.jpg" alt="That Kind of Guy" />
            </div>
            <div class="product-detail-info">
                <h1 style="color: purple;">That Kind of Guy</h1>
                <p><strong>Author:</strong> <em>Stephanie Archer</em></p>
                <p><strong>Genre:</strong> Contemporary Romance</p>
                <div class="rating">★★★★☆ <strong>4.4/5</strong> (7,654 ratings)</div>
                <h3><u>Description</u></h3>
                <p><em>That Kind of Guy</em> is a steamy fake relationship romance about a woman who hires a handsome stranger to pose as her boyfriend at a destination wedding...</p>
                <ul>
                    <li><strong>Publisher:</strong> Berkley</li>
                    <li><strong>Pages:</strong> 368</li>
                    <li><strong>Series:</strong> Queen's Cove #1</li>
                </ul>
                <asp:Button ID="btnBack8" runat="server" CssClass="back-button" Text="Back to Home" OnClick="ShowSection" CommandArgument="home" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlTheSinsOfSilas" runat="server" CssClass="product-detail" Visible="false">
            <div class="product-detail-image">
                <img src="https://m.media-amazon.com/images/I/71bpvWVGrhL._SY342_.jpg" alt="The Sins of Silas" />
            </div>
            <div class="product-detail-info">
                <h1 style="color: purple;">The Sins of Silas</h1>
                <p><strong>Author:</strong> <em>Kylie Snow</em></p>
                <p><strong>Genre:</strong> Dark Romance</p>
                <div class="rating">★★★★☆ <strong>4.6/5</strong> (5,432 ratings)</div>
                <h3><u>Description</u></h3>
                <p><em>The Sins of Silas</em> is a dark, gripping romance about a dangerous man with a haunted past and the woman who sees the goodness he tries to hide...</p>
                <ul>
                    <li><strong>Publisher:</strong> Dark Hearts Press</li>
                    <li><strong>Pages:</strong> 420</li>
                    <li><strong>Content Warning:</strong> Dark themes, violence</li>
                </ul>
                <asp:Button ID="btnBack9" runat="server" CssClass="back-button" Text="Back to Home" OnClick="ShowSection" CommandArgument="home" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlOnceUponABrokenHeart" runat="server" CssClass="product-detail" Visible="false">
            <div class="product-detail-image">
                <img src="https://m.media-amazon.com/images/I/51waM0DT-GL._SY445_SX342_.jpg" alt="Once Upon A Broken Heart" />
            </div>
            <div class="product-detail-info">
                <h1 style="color: purple;">Once Upon A Broken Heart</h1>
                <p><strong>Author:</strong> <em>Stephanie Garber</em></p>
                <p><strong>Genre:</strong> Fantasy Romance</p>
                <div class="rating">★★★★★ <strong>4.7/5</strong> (23,456 ratings)</div>
                <h3><u>Description</u></h3>
                <p><em>Once Upon A Broken Heart</em> follows Evangeline Fox as she makes a dangerous bargain with the Prince of Hearts in a magical world where fairytales are real...</p>
                <ul>
                    <li><strong>Publisher:</strong> Flatiron Books</li>
                    <li><strong>Pages:</strong> 408</li>
                    <li><strong>Series:</strong> Once Upon A Broken Heart #1</li>
                </ul>
                <asp:Button ID="btnBack10" runat="server" CssClass="back-button" Text="Back to Home" OnClick="ShowSection" CommandArgument="home" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlLightsOut" runat="server" CssClass="product-detail" Visible="false">
            <div class="product-detail-image">
                <img src="https://m.media-amazon.com/images/I/81OcgtUYWaL._SY342_.jpg" alt="Lights Out" />
            </div>
            <div class="product-detail-info">
                <h1 style="color: purple;">Lights Out</h1>
                <p><strong>Author:</strong> <em>Navessa Allen</em></p>
                <p><strong>Genre:</strong> Paranormal Romance</p>
                <div class="rating">★★★★☆ <strong>4.2/5</strong> (3,210 ratings)</div>
                <h3><u>Description</u></h3>
                <p><em>Lights Out</em> is a thrilling paranormal romance about a woman who discovers she can see supernatural beings and the vampire who becomes her unlikely protector...</p>
                <ul>
                    <li><strong>Publisher:</strong> Midnight Press</li>
                    <li><strong>Pages:</strong> 375</li>
                    <li><strong>Series:</strong> Nightwalkers #1</li>
                </ul>
                <asp:Button ID="btnBack11" runat="server" CssClass="back-button" Text="Back to Home" OnClick="ShowSection" CommandArgument="home" />
            </div>
        </asp:Panel>

        <!-- Rest of the existing panels (Most Bought, Cart, Checkout, etc.) -->
        <asp:Panel ID="pnlBought" runat="server" CssClass="main-content" Visible="false">
            <div class="container">
                <h2 style="color: pink;"><em><u>Mostly Bought Books</u></em></h2>
                <asp:GridView ID="gvBooks" runat="server" AutoGenerateColumns="false" CssClass="books-table">
                    <Columns>
                        <asp:BoundField DataField="Rank" HeaderText="Rank" />
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Author" HeaderText="Author" />
                        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="R{0}" />
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>

       <asp:Panel ID="pnlCart" runat="server" CssClass="main-content" Visible="false">
    <div class="container">
        <h2 style="color: purple;">Your Shopping Cart</h2>
        <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="false" CssClass="cart-table" 
            OnRowCommand="gvCart_RowCommand" OnRowDataBound="gvCart_RowDataBound" ShowFooter="true">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Book" />
                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server" Text='<%# "R" + (Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity"))).ToString("N2") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                <asp:TemplateField HeaderText="Remove">
                    <ItemTemplate>
                        <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandName="RemoveFromCart" 
                            CommandArgument='<%# Container.DataItemIndex %>' CssClass="remove-btn" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle Font-Bold="true" BackColor="#f5f5f5" />
        </asp:GridView>
        <div style="margin-top: 20px;">
            <strong>Total: R<asp:Label ID="lblCartTotal" runat="server" Text="0.00"></asp:Label></strong>
        </div>
        <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" OnClick="ShowSection" CommandArgument="home" CssClass="back-button" />
        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" CssClass="add-to-cart" />
    </div>
   </asp:Panel>

        <asp:Panel ID="pnlCheckout" runat="server" CssClass="main-content" Visible="false">
            <div class="container">
                <h2 style="color: purple;">Checkout</h2>
                <p>Thank you for your purchase!</p>
                <asp:Button ID="btnReturnHome" runat="server" Text="Return to Home" OnClick="ShowSection" CommandArgument="home" />
            </div>
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" CssClass="main-content most-bought-section" Visible="false">
    <div class="container">
        <div class="most-bought-header">
            <h2><em><u>Mostly Bought Books</u></em></h2>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="books-table">
            <Columns>
                <asp:BoundField DataField="Rank" HeaderText="Rank" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Author" HeaderText="Author" />
                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="R{0}" />
            </Columns>
            <EmptyDataTemplate>
                <div class="empty-state">
                    <p>No book data available at the moment.</p>
                </div>
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
</asp:Panel>
        
        <footer>
            <p>&copy; 2025 Book Nexus Book Shop. All rights reserved.</p>
            <p><em><u>Follow us on social media!</u></em></p>
            <ul>
                <li><a style="color: pink" href="#">Facebook</a></li>
                <li><a style="color: pink" href="#">Twitter</a></li>
                <li><a style="color: pink" href="#">Instagram</a></li>
            </ul>
            <p><em><u>Contact us on:</u></em></p>
            <ul>
                <li><strong>0679918634</strong></li>
                <li><a style="color: pink"><em>muyanalochristinah@gmail.com</em></a></li>
            </ul>
        </footer>
    </form>
    <script src="Script.js"></script>
</body>
</html>