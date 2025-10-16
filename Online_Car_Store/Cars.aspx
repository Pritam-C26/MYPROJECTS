<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="Online_Car_Store.Cars" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Available Cars - Wheelz</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f6f8;
        }

        /* ---------- NAVBAR ---------- */
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
        /* ---------- HERO ---------- */
        .hero { 
            position: relative; 
            height: 100vh; /* Full screen hero */
            min-height: 500px; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            color: #fff; 
            margin-bottom: 80px; /* pushes car list below */
            overflow: hidden;
        }
        .hero video { 
            position: absolute; 
            top:50%; left:50%; 
            transform:translate(-50%,-50%); 
            min-width:100%; min-height:100%; 
            object-fit:cover; 
            filter: brightness(0.55); 
        }
        .hero .hero-overlay { 
            position:absolute; inset:0; 
            background: rgba(0,0,0,0.45); 
        }
        .hero .hero-content { 
            position:relative; 
            z-index:2; 
            text-align:center; 
        }
        .hero h1 { font-size: 2.6rem; font-weight: 800; }
        .hero p { font-size: 1.1rem; opacity: .95; }
        .btn-hero { 
            padding:.65rem 1.25rem; 
            border-radius: 36px; 
            border:2px solid #fff; 
            color:#fff; 
            background:transparent; 
            font-weight:700; 
        }
        .btn-hero:hover { background:#fff; color:#000; }

        /* ---------- PAGE TITLE ---------- */
        .page-title { text-align:center; margin:34px 0 22px; font-weight:700; font-size:1.9rem; }

        /* ---------- CAR ROW ---------- */
        .car-row { 
            background:#fff; 
            border-radius:14px; 
            box-shadow:0 10px 30px rgba(16,24,40,0.06); 
            overflow:hidden; 
            transition: all .28s ease; 
        }
        .car-row:hover { 
            transform: translateY(-6px); 
            box-shadow:0 20px 40px rgba(16,24,40,0.1); 
        }

        .car-image { width:100%; height:420px; object-fit:cover; }

        .overlay-text {
            position: absolute;
            left: 20px; bottom: 20px;
            background: rgba(0,0,0,0.65);
            color: #fff;
            padding: 14px 20px;
            border-radius: 12px;
            max-width: 80%;
        }
        .overlay-text h3 { margin:0; font-size:1.6rem; font-weight:700; }
        .overlay-text p { margin:4px 0 0; font-size:.95rem; opacity:.95; }
        .overlay-text .price { font-size:1.15rem; font-weight:700; margin-top:4px; color:#ffd700; }

        .car-description { font-size:1.15rem; color:#374151; line-height:1.6; margin-bottom:20px; }

        /* ---------- BUTTONS ---------- */
        .btn-custom { padding: 10px 22px; border-radius: 30px; font-weight: 700; border:2px solid #000; transition:.25s; }
        .btn-view { background:#fff; color:#000; margin-right:10px; }
        .btn-view:hover { background:#000; color:#fff; }
        .btn-book { background:#000; color:#fff; }
        .btn-book:hover { background:#fff; color:#000; }

        @media (max-width:768px){
            .hero h1 { font-size:1.8rem; }
            .car-image { height:260px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="Default.aspx"><img src="images/logo.png" alt="Wheelz" /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="Home.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link active" href="Cars.aspx">Cars</a></li>
                        <li class="nav-item"><a class="nav-link" href="TestDrive.aspx">Test Drive</a></li>
                        <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
                    </ul>
                    <!-- User/Login Section -->
                    <div id="user-section" class="ms-5 user-link"></div>
                </div>
            </div>
        </nav>

        <!-- HERO -->
        <section class="hero mt-5 pt-4"> 
            <video autoplay muted loop playsinline>
                <source src="../images/hero-video.mp4" type="video/mp4" />
            </video>
            <div class="hero-overlay"></div>
            <div class="hero-content container">
                <h1>Find Your Dream Car</h1>
                <p>Premium selection — handpicked for performance, comfort and style.</p>
                <asp:Button ID="btnBookTestDrive" runat="server" CssClass="btn-hero" Text="Book a Test Drive" OnClick="btnBookTestDrive_Click" />
            </div>
        </section>

        <!-- LISTINGS -->
        <main class="container py-5">
            <h2 class="page-title ">Available Cars</h2>

            <asp:Repeater ID="rptCars" runat="server">
                <ItemTemplate>
                    <div class="row g-4 mb-4">
                        <div class="col-12 car-row p-0">
                            <div class="row g-0 align-items-stretch">
                                <!-- Left: Image + overlay -->
                                <div class="col-md-8 position-relative">
                                    <img src='<%# ResolveUrl(Eval("ImagePath").ToString()) %>' alt='<%# Eval("CarName") %>' class="car-image" />
                                    <div class="overlay-text">
                                        <h3><%# Eval("CarName") %></h3>
                                        <p><%# Eval("Brand") %> • <%# Eval("Model") %></p>
                                        <div class="price">$<%# String.Format("{0:N0}", Eval("Price")) %></div>
                                    </div>
                                </div>
                                <!-- Right: description + actions -->
                                <div class="col-md-4 p-4 d-flex flex-column justify-content-center">
                                    <p class="car-description"><%# Eval("Description") %></p>
                                    <div class="d-flex flex-wrap align-items-center">
                                        <asp:Button ID="btnViewDetails" runat="server" Text="View Details"
                                            PostBackUrl='<%# "ViewDetails.aspx?CarId=" + Eval("CarId") %>'
                                            CssClass="btn btn-custom btn-view me-2 mb-2" />
                                        <asp:Button ID="btnBookNow" runat="server" Text="Book Now"
                                            PostBackUrl='<%# "CarBooking.aspx?CarId=" + Eval("CarId") %>'
                                            CssClass="btn btn-custom btn-book mb-2" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </main>

        <!-- FOOTER -->
        <footer class="text-center py-3" style="background:#0b1220; color:#fff;">
            <div class="container"><small>&copy; 2025 Wheelz - Online Car Store | All Rights Reserved</small></div>
        </footer>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- User/Login Script -->
    <script>
        function getCookie(name) {
            const v = `; ${document.cookie}`;
            const parts = v.split(`; ${name}=`);
            if (parts.length === 2) return parts.pop().split(';').shift();
            return null;
        }
        (function () {
            const userSection = document.getElementById('user-section');
            if (!userSection) return;
            const userId = getCookie('UserId');
            if (userId) {
                userSection.innerHTML = `
                    <img src="images/user.jpg" class="user-img" alt="User" />
                    <a href="javascript:void(0)" onclick="logout()" class="text-white text-decoration-none">Logout</a>
                `;
            } else {
                userSection.innerHTML = `
                    <a href="login.aspx" class="text-white text-decoration-none d-flex align-items-center" style="gap:.5rem;">
                        <img src="images/user.jpg" class="user-img" alt="User" /> Login
                    </a>
                `;
            }
        })();
        function logout() {
            document.cookie = "UserId=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            location.reload();
        }
    </script>
</body>
</html>
