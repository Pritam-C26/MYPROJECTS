<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Online_Car_Store.Home" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Wheelz - Online Car Store</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Animate.css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

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

.logo-img {
  max-height: 50px;
  max-width: 180px;  
  width: auto;
  height: auto;
}
.login-box {
  background: rgba(0, 0, 0, 0.3);
  backdrop-filter: blur(10px);
}
    /* Hero */
    .hero {
      height: 100vh;
      position: relative;
      overflow: hidden;
      color: #fff;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      flex-direction: column;
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
      background: linear-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.3));
      z-index: 1;
    }
    .hero-content {
      position: relative;
      z-index: 2;
    }
    .hero-content h1 {
      font-size: 4rem;
      text-transform: uppercase;
      font-weight: 800;
      color: #ffb347;
      text-shadow: 2px 2px 10px rgba(0,0,0,0.8);
    }
    .hero-content p {
      font-size: 1.2rem;
      margin-top: 15px;
    }
    .btn-hero {
      background: linear-gradient(45deg, #ff4c29, #ffb347);
      color: #fff;
      border-radius: 30px;
      padding: 12px 30px;
      font-weight: bold;
      transition: all 0.3s;
    }
    .btn-custom:hover {
      background: linear-gradient(45deg, #ffb347, #ff4c29);
      box-shadow: 0 0 15px rgba(255,180,71,0.7);
      transform: scale(1.05);
    }

    /* Featured Cars */
    .carousel img {
      height: 350px;
      object-fit: cover;
      border-radius: 12px;
      transition: transform 0.4s ease;
    }
    .carousel img:hover { transform: scale(1.05); }
    .car-name {
      position: absolute;
      bottom: 15px;
      left: 15px;
      background: rgba(0, 0, 0, 0.6);
      color: #fff;
      padding: 6px 12px;
      border-radius: 5px;
      font-weight: bold;
      font-size: 1.2rem;
    }

    /* Cards (Latest Arrivals) */
    .card {
      border: none;
      border-radius: 15px;
      overflow: hidden;
      transition: transform 0.3s, box-shadow 0.3s;
      background: #fff;
    }
    .card:hover {
      transform: translateY(-8px);
      box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    }
    .card-img-top {
      height: 230px;
      object-fit: cover;
      transition: transform 0.4s ease;
    }
    .card:hover .card-img-top { transform: scale(1.05); }


    /* Why Choose Us */
    .bg-light h5 {
      font-weight: 700;
      color: #ff4c29;
    }
    .bg-light p { color: #444; }

    /* Testimonials */
    .bg-dark {
      background: linear-gradient(to right, #111, #222) !important;
    }
    .carousel-item p {
      font-size: 1.2rem;
      font-style: italic;
    }
    .carousel-item h6 {
      margin-top: 10px;
      color: #ffb347;
    }

    /* Newsletter */
    #txtEmail {
      border-radius: 30px;
      padding: 12px 20px;
      border: 2px solid #ddd;
    }
    .btn-custom {
      border-radius: 30px;
      background:black;
      color: white;
      font-weight: bold;
      transition: 0.3s;
    }
    .btn-custom:hover {
      background:white;
      color:black;
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


  <!-- Hero -->
  <section class="hero">
    <video autoplay muted loop playsinline>
      <source src="images/hero-video.mp4" type="video/mp4" />
    </video>
    <div class="hero-overlay"></div>
    <div class="hero-content text-center animate__animated animate__fadeInDown">
      <h1>Welcome to Wheelz</h1>
      <p class="lead">Find your dream car with ease – Buy & Book Test Drives Online</p>
      <asp:Button ID="btnShopNow" runat="server" Text="Shop Now" CssClass="btn btn-hero mt-3" OnClick="btnShopNow_Click" />
      <asp:Button ID="btnBookTestDrive" runat="server" Text="Book a Test Drive" CssClass="btn btn-outline-light mt-3" OnClick="btnBookTestDrive_Click" />
    </div>
  </section>

  <!-- Featured Cars -->
  <section class="my-5 mt-5">
    <h2 class="text-center mb-4 fw-bold">Featured Cars</h2>
    <div id="carCarousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <div class="row">
            <div class="col-md-6">
              <div class="position-relative">
                <asp:Image ID="imgCar1" runat="server" ImageUrl="~/images/car1.jpg" CssClass="d-block w-100" AlternateText="Car 1" />
                <div class="car-name">Tata Nexon EV</div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="position-relative">
                <asp:Image ID="imgCar2" runat="server" ImageUrl="~/images/car2.jpeg" CssClass="d-block w-100" AlternateText="Car 2" />
                <div class="car-name">BMW X5</div>
              </div>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <div class="row">
            <div class="col-md-6">
              <div class="position-relative">
                <asp:Image ID="imgCar3" runat="server" ImageUrl="~/images/car3.jpeg" CssClass="d-block w-100" AlternateText="Car 3" />
                <div class="car-name">Kia Seltos</div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="position-relative">
                <asp:Image ID="imgCar4" runat="server" ImageUrl="~/images/car4.jpg" CssClass="d-block w-100" AlternateText="Car 4" />
                <div class="car-name">Tata Punch</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
      </button>
    </div>
  </section>

  <!-- Why Choose Us -->
  <section class="py-5 bg-light">
    <div class="container text-center">
      <h2 class="fw-bold mb-4">Why Choose Wheelz?</h2>
      <div class="row">
        <div class="col-md-3">
          <i class="bi bi-car-front display-4 text-danger"></i>
          <h5 class="mt-3">Wide Range of Cars</h5>
          <p>From budget to luxury – we have it all.</p>
        </div>
        <div class="col-md-3">
          <i class="bi bi-shield-check display-4 text-danger"></i>
          <h5 class="mt-3">Verified Sellers</h5>
          <p>Buy with confidence from trusted dealers.</p>
        </div>
        <div class="col-md-3">
          <i class="bi bi-credit-card2-front display-4 text-danger"></i>
          <h5 class="mt-3">Easy Financing</h5>
          <p>Flexible EMI & loan options available.</p>
        </div>
        <div class="col-md-3">
          <i class="bi bi-headset display-4 text-danger"></i>
          <h5 class="mt-3">24/7 Support</h5>
          <p>We’re always here to help you.</p>
        </div>
      </div>
    </div>
  </section>

  
<!-- Latest Arrivals -->
<section class="container my-5">
  <h2 class="text-center fw-bold mb-4">Latest Arrivals</h2>
  <div class="row g-4">
    
    <!-- BMW -->
    <div class="col-md-4">
      <div class="card shadow-sm">
        <asp:Image ID="imgBMW" runat="server" ImageUrl="~/images/bmw-m4.jpg" CssClass="card-img-top" AlternateText="BMW M4" />
        <div class="card-body text-center">
          <h5 class="card-title">BMW M4</h5>
          <p class="card-text">$77,000</p>
          <asp:Button ID="btnBMW" runat="server" Text="View Details" CssClass="btn btn-custom"  class="button" 
              PostBackUrl="ViewDetails.aspx?CarId=14" />
        </div>
      </div>
    </div>

    <!-- Bugatti -->
    <div class="col-md-4">
      <div class="card shadow-sm">
        <asp:Image ID="imgBugatti" runat="server" ImageUrl="~/images/bugaddi-chiron.jpg" CssClass="card-img-top" AlternateText="Bugatti Chiron" />
        <div class="card-body text-center">
          <h5 class="card-title">Bugatti Chiron</h5>
          <p class="card-text">$300,000,000</p>
          <asp:Button ID="btnBugatti" runat="server" Text="View Details" CssClass="btn btn-custom" class="button" 
              PostBackUrl="ViewDetails.aspx?CarId=15" />
        </div>
      </div>
    </div>

    <!-- Tesla -->
    <div class="col-md-4">
      <div class="card shadow-sm">
        <asp:Image ID="imgTesla" runat="server" ImageUrl="~/images/tesla-model-s.jpg" CssClass="card-img-top" AlternateText="Tesla Model S" />
        <div class="card-body text-center">
          <h5 class="card-title">Tesla Model S</h5>
          <p class="card-text">$70,000</p>
          <asp:Button ID="btnTesla" runat="server" Text="View Details" CssClass="btn btn-custom" class="button"  
              PostBackUrl="ViewDetails.aspx?CarId=2" />
        </div>
      </div>
    </div>

  </div>
</section>


  <!-- Testimonials -->
  <section class="bg-dark text-white py-5">
    <div class="container">
      <h2 class="text-center fw-bold mb-4">What Our Customers Say</h2>
      <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner text-center">
          <div class="carousel-item active">
            <p class="lead">“Wheelz helped me find my dream car so easily. Highly recommend!”</p>
            <h6>- Rahul Sharma</h6>
          </div>
          <div class="carousel-item">
            <p class="lead">“Great service and quick process. Booked a test drive in minutes.”</p>
            <h6>- Priya Mehta</h6>
          </div>
          <div class="carousel-item">
            <p class="lead">“Wide selection of cars and verified sellers. Trustworthy platform!”</p>
            <h6>- Arjun Singh</h6>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next">
          <span class="carousel-control-next-icon"></span>
        </button>
      </div>
    </div>
  </section>

  <!-- Newsletter -->
  <section class="py-5 bg-light">
    <div class="container text-center">
      <h2 class="fw-bold mb-3">Stay Updated</h2>
      <p>Subscribe to get the latest car deals and offers directly in your inbox.</p>
      <div class="d-flex justify-content-center">
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control w-50" placeholder="Enter your email" />
        <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" CssClass="btn btn-custom ms-2" class="button"  OnClick="btnSubscribe_Click" />
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
