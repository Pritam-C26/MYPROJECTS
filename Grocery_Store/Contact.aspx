<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="GroceryStore.Contact" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us - FreshMart Grocery</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

    <style>
        body { font-family: 'Segoe UI', sans-serif; line-height: 1.6; color: #333; background-color: #f9f9f9; }

        /* Navbar (copied from Home.aspx) */
        .navbar { background: linear-gradient(90deg, #2c3e50, #27ae60); padding: 12px 0; }
        .navbar-brand { font-weight: bold; color: #fff !important; font-size: 1.6rem; letter-spacing: 1px; }
        .nav-link { color: #f1f1f1 !important; margin-left: 18px; font-weight: 500; transition: 0.3s; }
        .nav-link:hover { color: #f1c40f !important; text-decoration: none; }
        .welcome-label { color: #f1c40f; font-weight: 600; margin-left: 15px; }

        /* Contact Page */
        .contact-header {
            background: linear-gradient(90deg, #2c3e50, #27ae60);
            height: 60vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            color: #fff;
        }
        .contact-header::before {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(0,0,0,0.4);
        }
        .contact-header h1 {
            position: relative;
            z-index: 2;
            font-size: 3rem;
            font-weight: 700;
        }

        .contact-section {
            padding: 80px 0;
        }
        .contact-info {
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .contact-info i {
            font-size: 1.8rem;
            color: #27ae60;
            margin-right: 15px;
        }
        .contact-info h5 {
            font-weight: 600;
            margin-bottom: 10px;
        }
        .contact-form {
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .contact-form .form-control {
            border-radius: 8px;
            padding: 12px 15px;
        }
        .btn-submit {
            background: #27ae60;
            color: #fff;
            border: none;
            padding: 12px 25px;
            border-radius: 30px;
            transition: 0.3s;
        }
        .btn-submit:hover {
            background: #219150;
        }

        /* Map */
        .map iframe {
            width: 100%;
            height: 400px;
            border: none;
            border-radius: 15px;
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
                        <li class="nav-item"><a class="nav-link" href="Orders.aspx"><i class="fas fa-box"></i> Orders</a></li>
                        <li class="nav-item"><a class="nav-link active" href="Contact.aspx">Contact</a></li>
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

        <!-- Header Section -->
        <section class="contact-header">
            <h1>Contact Us</h1>
        </section>

        <!-- Contact Section -->
        <section class="contact-section">
            <div class="container">
                <div class="row g-4">
                    <!-- Contact Info -->
                    <div class="col-md-5">
                        <div class="contact-info">
                            <h3 class="mb-4 text-success">Get in Touch</h3>
                            <p><i class="fas fa-map-marker-alt"></i> 123 Green Street, Kolkata, India</p>
                            <p><i class="fas fa-phone"></i> +91 98765 43210</p>
                            <p><i class="fas fa-envelope"></i> support@freshmart.com</p>
                            <p><i class="fas fa-clock"></i> Mon - Sat: 8 AM - 8 PM</p>
                            <hr />
                            <h5>Follow Us</h5>
                            <div class="mt-2">
                                <a href="#"><i class="fab fa-facebook fa-lg me-3"></i></a>
                                <a href="#"><i class="fab fa-instagram fa-lg me-3"></i></a>
                                <a href="#"><i class="fab fa-twitter fa-lg me-3"></i></a>
                                <a href="#"><i class="fab fa-whatsapp fa-lg"></i></a>
                            </div>
                        </div>
                    </div>

                    <!-- Contact Form -->
                    <div class="col-md-7">
                        <div class="contact-form">
                            <h3 class="mb-4 text-success">Send Us a Message</h3>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your Email"></asp:TextBox>
                                </div>
                                <div class="col-12">
                                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>
                                </div>
                                <div class="col-12">
                                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Your Message"></asp:TextBox>
                                </div>
                                <div class="col-12 text-end">
                                    <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn-submit" OnClick="btnSend_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Map -->
                <div class="row mt-5">
                    <div class="col-12 map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3683.6619826186563!2d88.36389557530196!3d22.57386788516859!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a0277af32b1b4ff%3A0x9efb4efb5c8b41e5!2sKolkata%2C%20West%20Bengal!5e0!3m2!1sen!2sin!4v1700000000000!5m2!1sen!2sin"></iframe>
                    </div>
                </div>
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

