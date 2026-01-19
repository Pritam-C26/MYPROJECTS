<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Online_Doctor_Appointment_System.Index" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DocEase | Your Digital Healthcare Partner</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f9fafc;
        }
        .navbar {
            background: #0d47a1;
        }
        .navbar-brand {
            color: #fff !important;
            font-weight: 700;
            font-size: 1.8rem;
            letter-spacing: 1px;
        }
        .nav-link {
            color: #fff !important;
            margin: 0 10px;
        }
        .nav-link:hover {
            text-decoration: underline;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(13, 71, 161, 0.8), rgba(13, 71, 161, 0.8)), 
                        url('https://img.freepik.com/free-photo/medical-banner-with-doctor-wearing-stethoscope_23-2149611219.jpg') no-repeat center center/cover;
            color: white;
            padding: 120px 0;
            text-align: center;
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: 700;
        }
        .hero p {
            font-size: 1.2rem;
            margin-top: 15px;
            color: #e3f2fd;
        }
        .hero .btn {
            margin-top: 30px;
            background-color: #fff;
            color: #0d47a1;
            border-radius: 25px;
            padding: 10px 30px;
            font-weight: 600;
        }
        .hero .btn:hover {
            background-color: #1976d2;
            color: #fff;
        }

        /* About Section */
        .about {
            padding: 80px 0;
        }
        .about h2 {
            color: #0d47a1;
            font-weight: 700;
        }
        .about p {
            color: #555;
            font-size: 17px;
        }

        /* Cards Section */
        .card {
            border: none;
            border-radius: 15px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        .card img {
            width: 90px;
        }

        /* Testimonials */
        .testimonials {
            background-color: #e3f2fd;
            padding: 70px 0;
        }
        .testimonial-box {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        /* Footer */
        footer {
            background-color: #0d47a1;
            color: white;
            padding: 25px 0;
            text-align: center;
        }
        footer a {
            color: #bbdefb;
            text-decoration: none;
        }
        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <a class="navbar-brand" href="#">DocEase</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#login">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="#testimonials">Testimonials</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <section class="hero">
            <div class="container">
                <h1>Your Health, Simplified with DocEase</h1>
                <p>Book appointments, consult trusted doctors, and access your health records — all in one place.</p>
                <a href="#login" class="btn">Get Started</a>
            </div>
        </section>

        <!-- About Section -->
        <section id="about" class="about text-center">
            <div class="container">
                <h2>About DocEase</h2>
                <p class="mt-4">
                    DocEase is your all-in-one digital healthcare companion. From booking doctor appointments to viewing prescriptions 
                    and managing your health records — we make healthcare smarter, faster, and easier.
                </p>
            </div>
        </section>

        <!-- Login Options -->
        <section id="login" class="text-center mb-5">
            <div class="container">
                <h2 class="mb-5 text-primary fw-bold">Login to Continue</h2>
                <div class="row justify-content-center">
                    <!-- Patient Login -->
                    <div class="col-md-5 mb-4">
                        <div class="card shadow text-center p-4">
                            <img src="https://cdn-icons-png.flaticon.com/512/4320/4320362.png" class="mx-auto mb-3" />
                            <h4 class="mb-3">Patient Login</h4>
                            <p>Book appointments, view prescriptions, and manage your medical history easily.</p>
                            <a runat="server" href="~/Patients/PatientLogin.aspx" class="btn btn-primary px-4 rounded-pill">Login as Patient</a>
                        </div>
                    </div>

                    <!-- Doctor Login -->
                    <div class="col-md-5 mb-4">
                        <div class="card shadow text-center p-4">
                            <img src="https://cdn-icons-png.flaticon.com/512/3774/3774299.png" class="mx-auto mb-3" />
                            <h4 class="mb-3">Doctor Login</h4>
                            <p>Manage appointments, view patient history, and update prescriptions.</p>
                            <a runat="server" href="~/Doctors/DoctorLogin.aspx" class="btn btn-primary px-4 rounded-pill">Login as Doctor</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials -->
        <section id="testimonials" class="testimonials text-center">
            <div class="container">
                <h2 class="mb-5 text-primary fw-bold">What Our Users Say</h2>
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="testimonial-box">
                            <p>“DocEase made booking appointments so easy! I found a specialist and booked instantly.”</p>
                            <h6 class="mt-3 text-primary">– Sneha, Patient</h6>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="testimonial-box">
                            <p>“Managing patient schedules is now seamless. It’s a time saver for every doctor.”</p>
                            <h6 class="mt-3 text-primary">– Dr. Mehta</h6>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="testimonial-box">
                            <p>“Clean, fast, and user-friendly platform for both doctors and patients.”</p>
                            <h6 class="mt-3 text-primary">– Arjun, Developer</h6>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer id="contact">
            <p>© 2025 DocEase | Designed by Pritam Chowdhury</p>
            <p>Contact: <a href="mailto:support@docease.com">support@docease.com</a></p>
        </footer>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
