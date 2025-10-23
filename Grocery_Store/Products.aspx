<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="GroceryStore.Products" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FreshMart - Products</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap, Font Awesome & jQuery -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #f9f9f9; color: #333; }
        .navbar { background: linear-gradient(90deg, #2c3e50, #27ae60); padding: 12px 0; }
        .navbar-brand { font-weight: bold; color: #fff !important; font-size: 1.6rem; letter-spacing: 1px; }
        .nav-link { color: #f1f1f1 !important; margin-left: 14px; font-weight: 500; transition: 0.3s; }
        .nav-link:hover { color: #f1c40f !important; text-decoration: none; }
        .welcome-label { color: #f1c40f; font-weight: 600; margin-left: 12px; }

        .product-card { border: none;  border-radius: 12px; overflow: hidden; background: #fff;
                        box-shadow: 0 4px 12px rgba(0,0,0,0.1); transition: 0.3s; }
        .product-card:hover { transform: translateY(-6px); }
        .product-card img { height: 400px; object-fit: cover; }
        .product-card h3 { font-weight: 600; font-size: 18px; }
        .product-card p { color: #27ae60; font-weight: bold; }

        .hidden-product { display: none; }
        .category-section { margin-bottom: 50px;  }

        .search-bar { padding: 30px 0; background: #fff; box-shadow: 0 4px 10px rgba(0,0,0,0.06); margin-bottom: 20px; }
        .search-bar input { max-width: 400px; border-radius: 25px; padding: 12px 20px; }
        .search-bar button { border-radius: 25px; padding: 12px 25px; }

        .btn-add {
            background-color: #27ae60;
            border: none;
            color:white;
        }

        .btn-add:hover {
            background-color: #219150;
        }

        /* Footer */
        footer { background: #2c3e50; color: #fff; padding: 40px 0; text-align: center; }
        footer a { color: #fff; margin: 0 10px; font-size: 1.2rem; transition: 0.3s; }
        footer a:hover { color: #f1c40f; }
    </style>
</head>
<body>

    <form id="form1" runat="server">

        <!-- Navbar (fixed + corrected) -->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="Home.aspx">FreshMart</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item"><a class="nav-link" href="Home.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link active" href="Products.aspx">Products</a></li>
                        <li class="nav-item"><a class="nav-link" href="Cart.aspx"><i class="fas fa-shopping-cart"></i> Cart</a></li>
                        <li class="nav-item"><a class="nav-link" href="Orders.aspx"><i class="fas fa-box"></i> Orders</a></li>
                        <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>

                        <!-- Login / Logout button (server control) -->
                        <li class="nav-item">
                            <asp:LinkButton ID="btnLoginLogout" runat="server" CssClass="nav-link" OnClick="btnLoginLogout_Click">
                                Login
                            </asp:LinkButton>
                        </li>

                        <!-- Welcome label (server control) -->
                        <li class="nav-item">
                            <asp:Label ID="lblWelcome" runat="server" CssClass="welcome-label"></asp:Label>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Search Bar -->
        <section class="search-bar text-center mt-5 pt-5 mb-4">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control d-inline-block me-2" 
                         placeholder="Search products..." Width="300"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-success" OnClick="btnSearch_Click" />
        </section>

        <!-- Categories + Products -->
        <div class="container mt-3">
            <asp:Repeater ID="rptCategories" runat="server">
                <ItemTemplate>
                    <div class="category-section">
                        <h3 class="mb-3"><%# Eval("CategoryName") %></h3>
                        <div class="row" id="cat_<%# Eval("CategoryID") %>">
                            <asp:Repeater ID="rptProducts" runat="server" DataSource='<%# Eval("Products") %>'>
                                <ItemTemplate>
                                    <div class="col-md-3 mb-4 <%# Container.ItemIndex >= 4 ? "hidden-product" : "" %>">
                                        <div class="card product-card h-100">
                                            <!-- ✅ Make image clickable -->
                                      
                                                <img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' class="card-img-top" />
                                          

                                            <div class="card-body text-center">
                                                <h3><%# Eval("Name") %></h3>
                                                <p><%# Eval("Description") %></p>
                                                <p>₹ <%# Eval("Price") %></p>

                                             

                                                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-add btn-lg mt-2" CommandArgument='<%# Eval("ProductID") %>' OnClick="btnAddToCart_Click"/>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <!-- View All / Show Less Button -->
                        <button type="button" class="btn btn-outline-primary mt-2 view-all-btn" data-target="cat_<%# Eval("CategoryID") %>">View All</button>
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

    <!-- JS Toggle for View All -->
    <script>
        $(document).ready(function () {
            $(".view-all-btn").click(function () {
                var target = $(this).data("target");
                $("#" + target + " .hidden-product").slideToggle();
                var btn = $(this);
                btn.text(btn.text() === "View All" ? "Show Less" : "View All");
            });
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
