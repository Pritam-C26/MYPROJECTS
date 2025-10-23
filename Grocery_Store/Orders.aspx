<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="GroceryStore.Orders" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Orders - FreshMart</title>
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

        /* Orders Section */
        .orders-container { background: #fff; border-radius: 15px; padding: 40px; box-shadow: 0 6px 20px rgba(0,0,0,0.08); margin-top: 120px; margin-bottom: 50px; }
        .orders-header { font-weight: 700; color: #2c3e50; text-align: center; margin-bottom: 30px; }
        .order-card { margin-bottom: 20px; }
        .order-img { width: 100%; max-width: 120px; object-fit: cover; border-radius: 10px; }
        .btn-cancel { background: #e74c3c; color: #fff; border-radius: 25px; padding: 5px 20px; border: none; transition: 0.3s; }
        .btn-cancel:hover { background: #c0392b; transform: translateY(-2px); }
        .order-status { font-weight: 600; color: #27ae60; margin-top: 5px; }

       .text-end {
            text-align: right!important;
            font-size: 20px;
            /* padding-right: 91px; */
            font-weight: bold;
            border: 2px solid black;
            /* text-align: center; */
            /* justify-content: center; */
            padding: 20px 20px 20px 20px;
            /* box-sizing: content-box; */
            border-radius: 50px;
       }

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
                        <li class="nav-item"><a class="nav-link" href="Cart.aspx"><i class="fas fa-shopping-cart"></i> Cart</a></li>
                        <li class="nav-item"><a class="nav-link active" href="Orders.aspx"><i class="fas fa-box"></i> Orders</a></li>
                        <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
                        <li class="nav-item"><asp:LinkButton ID="btnLoginLogout" runat="server" CssClass="nav-link" >Login</asp:LinkButton></li>
                        <li class="nav-item"><asp:Label ID="lblWelcome" runat="server" CssClass="welcome-label"></asp:Label></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Orders Section -->
        <div class="container orders-container">
            <h2 class="orders-header">📦 My Orders</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mb-3 d-block text-center"></asp:Label>
<asp:Repeater ID="rptOrders" runat="server" OnItemCommand="rptOrders_ItemCommand" OnItemDataBound="rptOrders_ItemDataBound">
    <ItemTemplate>
        <div class="card order-card shadow-sm">
            <div class="card-body d-flex align-items-center justify-content-between">
                
                <!-- Left: Product Image + Details + Cancel Button -->
                <div class="d-flex align-items-center">
                    <img src='<%# Eval("Image") %>' alt="Product Image" class="order-img me-4" />
                    <div class="order-details">
                        <h5 class="card-title mb-1"><%# Eval("Name") %></h5>
                        <p class="mb-1"><strong>Order ID:</strong> <%# Eval("OrderID") %></p>
                        <p class="mb-1"><strong>Order Date:</strong> <%# Eval("OrderDate", "{0:dd-MMM-yyyy}") %></p>
                        <p class="mb-1"><strong>Payment:</strong> <%# Eval("PaymentMethod") %></p>

                        <!-- Cancel Button Panel -->
                        <asp:Panel ID="pnlCancel" runat="server" class="mt-2">
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" CssClass="btn-cancel"
                                CommandName="CancelOrder" CommandArgument='<%# Eval("OrderID") %>'
                                OnClientClick="return confirm('Are you sure you want to cancel this order?');" />
                        </asp:Panel>
                    </div>
                </div>

                <!-- Right: Status Badge -->
                <div class="text-end">
                    <asp:Label ID="lblStatus" runat="server" CssClass="status-badge"></asp:Label>
                </div>

            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>


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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
