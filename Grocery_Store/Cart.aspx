<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="GroceryStore.Cart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Cart - FreshMart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f9f9f9; }
        .navbar { background: linear-gradient(90deg, #2c3e50, #27ae60); padding: 12px 0; }
        .navbar-brand { font-weight: bold; color: #fff !important; font-size: 1.6rem; letter-spacing: 1px; }
        .nav-link { color: #f1f1f1 !important; margin-left: 18px; font-weight: 500; transition: 0.3s; }
        .nav-link:hover { color: #f1c40f !important; }
        .welcome-label { color: #f1c40f; font-weight: 600; margin-left: 15px; }
        
        /* Cart Section */
        .cart-container { background: #fff; border-radius: 15px; padding: 40px; box-shadow: 0 6px 20px rgba(0,0,0,0.08); margin-top: 120px; margin-bottom: 50px; }
        .cart-header { font-weight: 700; color: #2c3e50; text-align: center; margin-bottom: 30px; }
        .cart-total { font-size: 1.5rem; font-weight: bold; text-align: right; color: #27ae60; margin-top: 20px; }
        .btn-order { background: #f39c12; color: #fff; font-size: 1.2rem; border: none; border-radius: 30px; padding: 10px 35px; transition: 0.3s; }
        .btn-order:hover { background: #d35400; transform: translateY(-2px); }
        .cart-empty { text-align: center; padding: 50px 0; font-size: 1.2rem; color: #777; }

        /* Footer */
        footer { background: #2c3e50; color: #fff; padding: 40px 0; text-align: center; }
        footer a { color: #fff; margin: 0 10px; font-size: 1.2rem; transition: 0.3s; }
        footer a:hover { color: #f1c40f; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <a class="navbar-brand" href="Home.aspx">FreshMart</a>
                <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item"><a class="nav-link" href="Home.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Products.aspx">Products</a></li>
                        <li class="nav-item"><a class="nav-link active" href="Cart.aspx"><i class="fas fa-shopping-cart"></i> Cart</a></li>
                        <li class="nav-item"><a class="nav-link" href="Orders.aspx"><i class="fas fa-box"></i> Orders</a></li>
                        <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
                        <li class="nav-item"><asp:LinkButton ID="btnLoginLogout" runat="server" CssClass="nav-link" >Login</asp:LinkButton></li>
                        <li class="nav-item"><asp:Label ID="lblWelcome" runat="server" CssClass="welcome-label"></asp:Label></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Cart Section -->
        <div class="container cart-container">
            <h2 class="cart-header">🛒 Your Shopping Cart</h2>

            <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered text-center align-middle"
                          EmptyDataText="Your cart is empty 😞" ShowHeaderWhenEmpty="True" OnRowCommand="gvCart_RowCommand" DataKeyNames="CartID">
                <Columns>
                    <asp:TemplateField HeaderText="Product Image">
                        <ItemTemplate>
                            <img src='<%# Eval("Image") %>' alt="Product" style="width:80px;height:80px;object-fit:cover;border-radius:10px;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Product Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Price" HeaderText="Price (₹)" DataFormatString="{0:F2}" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:TemplateField HeaderText="Remove">
                        <ItemTemplate>
                            <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandName="RemoveItem" 
                                        CommandArgument='<%# Eval("CartID") %>' CssClass="btn btn-danger btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="cart-total">
                Total Amount: ₹ <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
            </div>

            <div class="text-end mt-4">
                <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="btn-order" OnClick="btnCheckOut_Click" />
            </div>
        </div>

        <!-- Footer -->
        <footer>
            <div class="container">
                <p>&copy; 2025 FreshMart Grocery. All Rights Reserved.</p>
                <div class="mt-3">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-whatsapp"></i></a>
                </div>
            </div>
        </footer>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
