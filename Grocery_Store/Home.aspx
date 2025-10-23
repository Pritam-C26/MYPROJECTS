<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GroceryStore.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FreshMart - Online Grocery Shop</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

    <style>
        body { font-family: 'Segoe UI', sans-serif; line-height: 1.6; color: #333; background-color: #f9f9f9; }
        .navbar { background: linear-gradient(90deg, #2c3e50, #27ae60); padding: 12px 0; }
        .navbar-brand { font-weight: bold; color: #fff !important; font-size: 1.6rem; letter-spacing: 1px; }
        .nav-link { color: #f1f1f1 !important; margin-left: 18px; font-weight: 500; transition: 0.3s; }
        .nav-link:hover { color: #f1c40f !important; text-decoration: none; }
        .welcome-label { color: #f1c40f; font-weight: 600; margin-left: 15px; }
        .hero { background: url('../Image/grocery-banner.jpg') center/cover no-repeat; height: 100vh; display:flex; justify-content:center; align-items:center; position:relative; color:#fff; }
        .hero::before { content:""; position:absolute; inset:0; background:rgba(0,0,0,0.4); }
        .hero-content { position:relative; z-index:2; text-align:center; max-width:700px; }
        .hero h1 { font-size:3rem; font-weight:700; margin-bottom:20px; }
        .hero p { font-size:1.3rem; margin-bottom:30px; }
        .btn-hero { background: #f39c12; color: #fff; border: none; padding: 12px 35px; font-size: 1.2rem; border-radius: 30px; transition: 0.3s; }
        .btn-hero:hover { background: #d35400; transform: translateY(-3px); }

        /* Features Section */
        .features { background: #fff; padding: 60px 0; }
        .feature-box { text-align: center; padding: 30px 20px; transition: 0.3s; border-radius: 12px; }
        .feature-box:hover { transform: translateY(-5px); box-shadow: 0 10px 25px rgba(0,0,0,0.1); }
        .feature-box i { font-size: 3rem; color: #27ae60; margin-bottom: 15px; }
        .feature-box h5 { font-weight: 600; margin-bottom: 10px;  }

        /* Products Section */
        .product-card { border: none; border-radius: 15px; overflow: hidden; box-shadow: 0 6px 20px rgba(0,0,0,0.08); transition: transform 0.3s, box-shadow 0.3s; background: #fff; }
        .product-card:hover { transform: translateY(-8px); box-shadow: 0 12px 30px rgba(0,0,0,0.12); }
        .product-card img { height: 400px; object-fit: cover; }
        .product-card .card-title { font-weight: 800; font-size:18px; }
        .product-card .card-text{font-size:18px; font-weight:bold;}

        /* Testimonials Section */
        .testimonials { background: #f0f6f5; padding: 60px 0; }
        .testimonial-card { background: #fff; border-radius: 15px; padding: 30px; box-shadow: 0 6px 20px rgba(0,0,0,0.08); text-align: center; transition: transform 0.3s; }
        .testimonial-card:hover { transform: translateY(-5px); box-shadow: 0 12px 25px rgba(0,0,0,0.12); }
        .testimonial-card i { color: #27ae60; margin-bottom: 15px; font-size: 1.5rem; }
        .testimonial-card p { font-style: italic; margin-bottom: 15px; }
        .testimonial-card h6 { font-weight: 600; color: #27ae60; }

        /* Newsletter Section */
        .newsletter { background: linear-gradient(90deg, #27ae60, #2c3e50); color: #fff; padding: 60px 0; text-align: center; }
        .newsletter input { width: 300px; max-width: 90%; padding: 12px 20px; border: none; border-radius: 30px; margin-right: 10px; }
        .newsletter button { padding: 12px 25px; border: none; border-radius: 30px; background: #f39c12; color: #fff; font-weight: 600; transition: 0.3s; }
        .newsletter button:hover { background: #d35400; }

        /* Brands Section */
        .brands { padding: 50px 0; background: #fff; text-align: center; }
        .brands img {
                max-height: 84px;
                max-width: 491px;
                margin: 31px 121px;
                filter: grayscale(20%);
                transition: 0.3s;
            }
        .brands img:hover { transform: scale(1.1); }

        /* Footer */
        footer { background: #2c3e50; color: #fff; padding: 40px 0; text-align: center; }
        footer a { color: #fff; margin: 0 10px; font-size: 1.2rem; transition: 0.3s; }
        footer a:hover { color: #f1c40f; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

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
                        <li class="nav-item"><a class="nav-link" href="Orders.aspx"><i class="fas fa-box"></i> Orders</a></li>
                        <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
                        <li class="nav-item">
                            <asp:LinkButton ID="btnLoginLogout" runat="server" CssClass="nav-link" OnClick="btnLoginLogout_Click">Login</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:Label ID="lblWelcome" runat="server" CssClass="welcome-label"></asp:Label>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-content">
                <h1>Fresh Groceries Delivered</h1>
                <p>Farm-fresh products delivered to your doorstep, fast and easy.</p>
                <a href="Products.aspx" class="btn btn-hero btn-lg">Shop Now</a>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features">
            <div class="container">
                <div class="row g-4 text-center">
                    <div class="col-md-3">
                        <div class="feature-box">
                            <i class="fas fa-leaf"></i>
                            <h5>100% Fresh</h5>
                            <p>Fresh fruits & veggies directly from farms.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="feature-box">
                            <i class="fas fa-truck-fast"></i>
                            <h5>Fast Delivery</h5>
                            <p>Get your orders delivered within hours.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="feature-box">
                            <i class="fas fa-tags"></i>
                            <h5>Best Prices</h5>
                            <p>High-quality groceries at affordable prices.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="feature-box">
                            <i class="fas fa-seedling"></i>
                            <h5>Organic</h5>
                            <p>Healthy, chemical-free, and natural products.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Featured Products Section -->
        <section class="container py-5">
            <h2 class="text-center mb-5">Featured Products</h2>
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="card product-card">
                        <img src="../Image/apples.jpg" class="card-img-top" alt="Apples" />
                        <div class="card-body text-center">
                            <h5 class="card-title">Fresh Apples</h5>
                            <p class="card-text text-muted">₹120 / Kg</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card product-card">
                        <img src="../Image/banana-chips.jpg" class="card-img-top" alt="banana-chips" />
                        <div class="card-body text-center">
                            <h5 class="card-title">Banana Chips</h5>
                            <p class="card-text text-muted">₹80 / Packet</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card product-card">
                        <img src="../Image/basmati-rice.jpg" class="card-img-top" alt="Rice" />
                        <div class="card-body text-center">
                            <h5 class="card-title">Basmati Rice</h5>
                            <p class="card-text text-muted">₹120 / Kg</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card product-card">
                        <img src="../Image/tomatoes.jpg" class="card-img-top" alt="Tomatoes" />
                        <div class="card-body text-center">
                            <h5 class="card-title">Fresh Tomatoes</h5>
                            <p class="card-text text-muted">₹30 / Kg</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section class="testimonials">
            <div class="container">
                <h2 class="text-center mb-5">What Our Customers Say</h2>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="testimonial-card">
                            <i class="fas fa-quote-left"></i>
                            <p>“FreshMart delivers top-quality produce every time. Highly recommended!”</p>
                            <h6>– Priya Sharma</h6>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="testimonial-card">
                            <i class="fas fa-quote-left"></i>
                            <p>“Fast delivery and great prices. Shopping has never been easier.”</p>
                            <h6>– Rohit Kumar</h6>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="testimonial-card">
                            <i class="fas fa-quote-left"></i>
                            <p>“I love the freshness of the products. Truly organic and healthy.”</p>
                            <h6>– Sneha Verma</h6>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Newsletter Section -->
        <section class="newsletter">
            <div class="container">
                <h2 class="mb-3">Subscribe to Our Newsletter</h2>
                <p>Get the latest offers and updates delivered to your inbox.</p>
                <div class="d-flex justify-content-center mt-3">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" Width="300px"></asp:TextBox>
                    <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" CssClass="btn btn-warning ms-2" OnClick="btnSubscribe_Click" />
                </div>
            </div>
        </section>

        <!-- Brands Section (RE-ADDED) -->
        <section class="brands">
            <div class="container">
                <h2 class="mb-4">Our Trusted Brands</h2>
                <asp:Image ID="imgBrand1" runat="server" ImageUrl="../Image/brand1.png" AlternateText="Brand 1" CssClass="mx-3" />
                <asp:Image ID="imgBrand2" runat="server" ImageUrl="../Image/brand2.png" AlternateText="Brand 2" CssClass="mx-3" />
                <asp:Image ID="imgBrand3" runat="server" ImageUrl="../Image/brand3.png" AlternateText="Brand 3" CssClass="mx-3" />
                <asp:Image ID="imgBrand4" runat="server" ImageUrl="../Image/brand4.png" AlternateText="Brand 4" CssClass="mx-3" />
                <asp:Image ID="imgBrand5" runat="server" ImageUrl="../Image/brand5.png" AlternateText="Brand 5" CssClass="mx-3" />
                <asp:Image ID="imgBrand6" runat="server" ImageUrl="../Image/brand6.png" AlternateText="Brand 6" CssClass="mx-3" />
            </div>
        </section>

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
