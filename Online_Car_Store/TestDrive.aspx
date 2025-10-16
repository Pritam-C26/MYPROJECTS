<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestDrive.aspx.cs" Inherits="Online_Car_Store.TestDrive" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Test Drive Booking - Wheelz</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f9f9f9;
    }

    /* ✅ Navbar */
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
    .navbar .nav-link:hover {
      color: #ffb347 !important;
    }
    .navbar .user-link {
      display: flex;
      align-items: center;
      gap: 8px;
      font-weight: 600;
      color: #fff !important;
    }
    .user-img {
      border-radius: 50%;
      width: 32px; height: 32px;
      object-fit: cover;
      border: 2px solid #fff;
      transition: transform 0.3s ease, border-color 0.3s ease;
    }
    .navbar .user-link:hover .user-img {
      transform: scale(1.1);
      border-color: #ffb347;
    }

     .navbar-brand img {
         max-height: 48px; 

     }
    .logo-img {
      max-height: 50px;
      max-width: 180px;
      width: auto;
      height: auto;
    }

    /* ✅ Hero */
    .hero {
      position: relative;
      height: 60vh;
      width: 100%;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      color: #fff;
    }
    .hero video {
      position: absolute;
      top: 50%; left: 50%;
      min-width: 100%;
      min-height: 100%;
      z-index: -1;
      transform: translate(-50%, -50%);
      object-fit: cover;
      filter: brightness(0.6);
    }
    .hero-content {
      z-index: 1;
      position: relative;
    }
    .hero h1 {
      font-size: 3rem;
      font-weight: 700;
      color: #fff;
      text-shadow: 2px 2px 10px rgba(0,0,0,0.6);
    }
    .hero p {
      font-size: 1.2rem;
      margin-top: 10px;
    }

    /* ✅ Form */
    .form-container {
      max-width: 600px;
      margin: 80px auto 40px auto;
      padding: 25px;
      border: 1px solid #ddd;
      border-radius: 10px;
      background-color: #fff;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    /* ✅ Black & White Button */
    .btn-primary {
      background: #000;
      border: none;
      border-radius: 25px;
      padding: 10px 20px;
      font-weight: 600;
      color: #fff;
    }
    .btn-primary:hover {
      background: #fff;
      color: #000;
      border: 1px solid #000;
    }

  </style>
</head>
<body>
<form id="form1" runat="server">

  <!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
  <div class="container">
    <!-- Brand Logo -->
    <a class="navbar-brand" href="#">
      <img src="images/logo.png" class="logo-img" alt="Wheelz Logo" />
    </a>

    <!-- Toggle button for mobile -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Nav Links -->
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="Home.aspx">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="Cars.aspx">Cars</a></li>
        <li class="nav-item"><a class="nav-link" href="TestDrive.aspx">Test Drive</a></li>
        <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
      </ul>

      <!-- User/Login or Logout Section -->
      <div id="user-section" class="ms-5 user-link"></div>
    </div>
  </div>
</nav>

  <!-- ✅ Hero Section -->
  <section class="hero">
    <video autoplay muted loop>
      <source src="../images/hero-video.mp4" type="video/mp4" />
      Your browser does not support the video tag.
    </video>
    <div class="hero-content">
      <h1>Book Your Test Drive</h1>
      <p>Experience luxury and performance firsthand. Schedule your drive now.</p>
    </div>
  </section>

<!-- ✅ Test Drive Section (2 columns side by side) -->
<div class="container mt-5">
  <div class="row">
    
    <!-- ✅ Left: Booking Form -->
    <div class="col-md-6">
      <div class="form-container">
        <h3 class="text-center mb-4">Test Drive Booking Form</h3>
        <div class="mb-3">
          <label for="ddlCar" class="form-label"><b>Select Car</b></label>
         <asp:DropDownList ID="ddlCar" runat="server" CssClass="form-select" AppendDataBoundItems="true">
            <asp:ListItem Text="<-- Select a car -->" Value=""></asp:ListItem>
        </asp:DropDownList>
        </div>
        <div class="mb-3">
          <label for="txtDate" class="form-label"><b>Preferred Date</b></label>
          <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>
        <div class="mb-3">
          <label for="txtTime" class="form-label"><b>Preferred Time</b></label>
          <asp:TextBox ID="txtTime" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
        </div>
        <div class="d-grid">
          <asp:Button ID="btnSubmit" runat="server" Text="Book Now" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
        </div>
      </div>
    </div>

    <!-- ✅ Right: Booking Status Check Form -->
    <div class="col-md-6">
      <div class="form-container">
        <h3 class="text-center mb-4">Check Booking Status</h3>
        <div class="mb-3">
          <label for="txtBookingId" class="form-label">Enter Booking ID</label>
          <asp:TextBox ID="txtBookingId" runat="server" CssClass="form-control" placeholder="Enter your Booking ID"></asp:TextBox>
        </div>
        <div class="d-grid mb-3">
          <asp:Button ID="btnCheckStatus" runat="server" Text="Check Status" CssClass="btn btn-primary" OnClick="btnCheckStatus_Click"  />
        </div>
        <asp:Label ID="lblStatusResult" runat="server" CssClass="fw-bold text-center d-block"></asp:Label>
      </div>
    </div>

  </div>
</div>


  <!-- ✅ Footer -->
  <footer class="text-white text-center p-3" style="background:#000;">
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
             const userId = getCookie('UserId'); // ✅ Read from cookie

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
