<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Online_Car_Store.Contact" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Contact Us - Wheelz</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Animate.css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  <!--  Font Awsome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f9f9f9;
      color: #333;
    }

    /* Navbar */
    .navbar {
      padding: 0.8rem 1rem;
      background: #111 !important;
      box-shadow: 0 3px 10px rgba(0,0,0,0.4);
    }
    .navbar .nav-link {
      font-weight: 600;
      letter-spacing: 0.5px;
      transition: color 0.3s ease;
    }
    .navbar .nav-link:hover { color: #ffb347 !important; }
    .navbar .user-link { display: flex; align-items: center; gap: 8px; font-weight: 600; color: #fff !important; }
    .user-img { border-radius: 50%; width: 32px; height: 32px; object-fit: cover; border: 2px solid #fff; transition: 0.3s; }
    .navbar .user-link:hover .user-img { transform: scale(1.1); border-color: #ffb347; }
    .logo-img { max-height: 50px; max-width: 180px; }

    /* Hero */
    .hero {
      height: 50vh;
      position: relative;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      overflow: hidden;
    }
    .hero video {
      position: absolute;
      inset: 0;
      width: 100%; height: 100%;
      object-fit: cover;
      z-index: 0;
    }
    .hero-overlay {
      position: absolute;
      inset: 0;
      background: rgba(0,0,0,0.6);
      z-index: 1;
    }
    .hero-content {
      position: relative;
      z-index: 2;
      color: #fff; /* White heading */
    }
    .hero-content h1 {
      font-size: 3rem;
      font-weight: 800;
      color: #fff; /* white text */
    }

    /* Contact Info Cards */
    .contact-card {
      background:#4A4A4A;
      color:white;
      border-radius: 12px;
      padding: 25px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
      transition: transform 0.3s ease;
    }
    .contact-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 25px rgba(0,0,0,0.2);
    }
    .contact-card i {
      font-size: 2rem;
      color: white;
      margin-bottom: 10px;
    }

    .contact-card h5{
        font-weight:bold;
        font-size:22px;
    }

    .contact-card p{
        font-size:18px;
    }

    /* Contact Form */
    .form-control {
      border-radius: 12px;
      padding: 12px;
      border: 2px solid #ddd;
    }
    .btn-custom {
      border-radius: 30px;
      background: black;
      color: white;
      font-weight: bold;
      transition: 0.3s;
      padding: 10px 25px;
    }
    .btn-custom:hover {
      background: white;
      color: black;
      box-shadow: 0 0 12px rgba(255,180,71,0.6);
    }

    /* Footer */
    footer {
      background: #000;
      font-size: 0.9rem;
      letter-spacing: 0.5px;
      padding: 20px 0;
    }
    footer p { margin: 0; color: #bbb; }
  </style>
</head>
<body>
<form id="form1" runat="server">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="Home.aspx">
      <img src="images/logo.png" class="logo-img" alt="Wheelz Logo" />
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="Home.aspx">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="Cars.aspx">Cars</a></li>
        <li class="nav-item"><a class="nav-link" href="TestDrive.aspx">Test Drive</a></li>
        <li class="nav-item"><a class="nav-link active" href="Contact.aspx">Contact</a></li>
      </ul>
      <div id="user-section" class="ms-5 user-link"></div>
    </div>
  </div>
</nav>

<!-- Hero -->
<section class="hero">
  <video autoplay muted loop playsinline>
    <source src="../images/hero-video.mp4" type="video/mp4" />
  </video>
  <div class="hero-overlay"></div>
  <div class="hero-content animate__animated animate__fadeInDown">
    <h1>Contact Us</h1>
    <p class="lead">We’re here to answer your questions 24/7</p>
  </div>
</section>

<!-- Contact Info -->
<section class="container my-5">
  <div class="row g-4 text-center">
    <div class="col-md-4">
      <div class="contact-card">
       <i class="fa-solid fa-phone-volume"></i>
        <h5 class="mt-2">Phone</h5>
        <p>+91 98765 43210</p>
      </div>
    </div>
    <div class="col-md-4">
      <div class="contact-card">
        <i class="fa-solid fa-envelope"></i>
        <h5 class="mt-2">Email</h5>
        <p>support@wheelz.com</p>
      </div>
    </div>
    <div class="col-md-4">
      <div class="contact-card">
        <i class="fa-solid fa-location-dot"></i>
        <h5 class="mt-2">Address</h5>
        <p>123 MG Road, Bengaluru, India</p>
      </div>
    </div>
  </div>
</section>

<!-- Contact Form -->
<section class="container my-5">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card shadow-sm p-4">
        <h3 class="text-center fw-bold mb-4">Send Us a Message</h3>
        <div class="mb-3">
          <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
        </div>
        <div class="mb-3">
          <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your Email"></asp:TextBox>
        </div>
        <div class="mb-3">
          <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>
        </div>
        <div class="mb-3">
          <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Your Message"></asp:TextBox>
        </div>
        <div class="text-center">
          <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn btn-custom" OnClick="btnSend_Click"  />
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="text-white text-center p-3">
  <p>&copy; 2025 Wheelz - Online Car Store | All Rights Reserved</p>
</footer>

</form>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
        return null;
    }

    window.onload = function () {
        const userSection = document.getElementById('user-section');
        const userId = getCookie('UserId');

        if (userId) {
            userSection.innerHTML = `
      <img src="images/user.jpg" class="user-img" alt="User" />
      <a href="Home.aspx" onclick="logout()" class="text-white text-decoration-none">Logout</a>
    `;
        } else {
            userSection.innerHTML = `
      <a href="login.aspx" class="text-white text-decoration-none">
        <img src="images/user.jpg" class="user-img" alt="User" /> Login
      </a>
    `;
        }
    };

    function logout() {
        document.cookie = "UserId=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
        location.reload();
    }
</script>
</body>
</html>
