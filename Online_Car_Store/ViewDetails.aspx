<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="Online_Car_Store.ViewDetails" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Car Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />

    <style>
        body {
            background: #f5f6fa;
            font-family: 'Poppins', sans-serif;
            color: #333;
        }

        /* Section 1: Hero */
        .car-hero {
            position: relative;
            height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            overflow: hidden;
        }

        .car-hero img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(0.6);
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;
        }

        .car-hero-content {
            z-index: 1;
            color: #fff;
        }

        .car-hero-content h1 {
            font-size: 3rem;
            font-weight: 700;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.6);
        }

        .car-hero-content h4 {
            font-size: 1.5rem;
            font-weight: 500;
            margin-top: 10px;
        }

        /* Section 2: Details */
        .car-details {
            padding: 60px 20px;
        }

        .car-details h2 {
            text-align: center;
            font-weight: 700;
            margin-bottom: 40px;
            color: #ff4c29;
        }

        .detail-item {
            margin-bottom: 20px;
            font-size: 1.1rem;
        }

        .detail-item i {
            margin-right: 10px;
            color: #ff4c29;
        }

        .car-price {
            font-size: 1.8rem;
            font-weight: 700;
            color: white;
            margin-top: 30px;
            text-align: center;
        }

        .car-description {
            margin-top: 30px;
            font-size: 1.5rem;
            line-height: 1.6;
            text-align: center;
            color: white;
        }

        .car-actions {
            margin-top: 40px;
            text-align: center;
        }

        .car-actions .btn {
    border-radius: 50px;   /* pill shape */
    padding: 14px 40px;    /* more horizontal padding for luxury feel */
    font-weight: 600;
    margin: 0 12px;
    font-size: 1.05rem;
    letter-spacing: 0.5px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 10px rgba(0,0,0,0.15);
    cursor: pointer;
}

/* Book Now (Black pill button with white text) */
.car-actions .btn-primary {
    background: linear-gradient(145deg, #000, #222);
    color: #fff;
    border: none;
    box-shadow: 0 6px 16px rgba(0,0,0,0.35);
}

.car-actions .btn-primary:hover {
    background: linear-gradient(145deg, #111, #333);
    transform: translateY(-3px) scale(1.07);
    box-shadow: 0 10px 25px rgba(0,0,0,0.5);
}

/* Back Button (White pill button with black border/text) */
.car-actions .btn-secondary {
    background: linear-gradient(145deg, #fff, #f8f8f8);
    color: #000;
    border: 2px solid #000;
    box-shadow: 0 6px 14px rgba(0,0,0,0.15);
}

.car-actions .btn-secondary:hover {
    background: linear-gradient(145deg, #f0f0f0, #ddd);
    color: #000;
    transform: translateY(-3px) scale(1.07);
    box-shadow: 0 10px 25px rgba(0,0,0,0.35);
}


        /*View detail extra work*/
/* Carousel container */
.owl-carousel {
    margin: 40px auto;
    max-width: 100%;
}

/* Bigger & wider card styling */
.owl-carousel .item .card {
    border: none;
    border-radius: 20px;
    color: #fff;
    padding: 30px 20px;
    min-height: 250px;
    display: flex;
    flex-direction: column;
    justify-content: center;   /* vertical center */
    align-items: center;       /* horizontal center */
    text-align: center;
    background: linear-gradient(135deg, rgba(0,123,255,0.85), rgba(0,0,0,0.85)),
            url('../images/racigncar.jpeg') center/cover no-repeat;
    box-shadow: 0 10px 28px rgba(0, 0, 0, 0.3);
    transition: transform 0.3s, box-shadow 0.3s;
}

/* Hover effect */
.owl-carousel .item .card:hover {
    transform: translateY(-10px) scale(1.04);
    box-shadow: 0 14px 38px rgba(0, 0, 0, 0.45);
}

/* Icons */
.owl-carousel .item .card i {
    color: #ffd700;
    font-size: 3rem;
    margin-bottom: 15px;
    text-shadow: 0 3px 8px rgba(0,0,0,0.5);
}

/* Title */
.owl-carousel .item .card h6 {
    font-weight: 700;
    font-size: 1.4rem;
    color: #fff;
    margin-bottom: 8px;
    text-transform: uppercase;
}

/* Label text */
.owl-carousel .item .card p {
    font-size: 1.1rem;
    font-weight: 500;
    color: #f8f9fa;
    margin: 0;
}

/* Owl Nav buttons */
.owl-nav button {
    position: absolute;
    top: 40%;
    width: 55px;
    height: 55px;
    border-radius: 50%;
    border: none;
    background: linear-gradient(135deg, #007bff, #00c6ff) !important;
    color: #fff !important;
    font-size: 1.8rem !important;
    font-weight: bold;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.3);
    transition: all 0.3s ease;
    z-index: 1000;
}

/* Left/Right positioning */
.owl-nav .owl-prev {
    left: -70px;
}
.owl-nav .owl-next {
    right: -70px;
}

/* Hover effect */
.owl-nav button:hover {
    transform: scale(1.15);
    background: linear-gradient(135deg, #ff416c, #ff4b2b) !important;
    box-shadow: 0 8px 24px rgba(0,0,0,0.45);
}

/* Make the icon inside larger */
.owl-nav button span {
    font-size: 2rem;
    font-weight: bold;
    line-height: 1;
}


/* Dots */
.owl-dots .owl-dot span {
    width: 12px;
    height: 12px;
    background: #ccc;
    border-radius: 50%;
    transition: 0.3s;
}
.owl-dots .owl-dot.active span {
    background: #007bff;
}

/* Responsive (already handled by Owl options, but just in case) */
@media (max-width: 768px) {
    .owl-carousel .item .card {
        min-height: 220px;
        padding: 20px 15px;
    }
}
@media (max-width: 576px) {
    .owl-carousel .item .card {
        min-height: 200px;
        padding: 15px 10px;
    }
}




    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Container 1: Hero Section -->
        <section class="car-hero">
            <asp:Image ID="imgCar" runat="server" />
            <div class="car-hero-content">
                <h1><asp:Label ID="lblCarName" runat="server" /></h1>
                <h4><asp:Label ID="lblModel" runat="server" ></asp:Label></h4>
                <p class="car-description"><asp:Label ID="lblDescription" runat="server" /></p>
                <p class="car-price">Price: $<asp:Label ID="lblPrice" runat="server" /></p>
            </div>
        </section>

        <!-- Container 2: Details -->
        <section class="car-details container">
            <h2>Car Details</h2>

  <!-- Carousel Container -->
<div class="owl-carousel owl-theme">

    <!-- Brand -->
    <div class="item">
        <div class="card car-card text-center">
            <div class="card-body">
                <i class="fas fa-industry fa-2x mb-2"></i>
                <h5>BRAND</h5>
                <p><asp:Label ID="lblBrand" runat="server" /></p>
            </div>
        </div>
    </div>

    <!-- Year -->
    <div class="item">
        <div class="card car-card text-center">
            <div class="card-body">
                <i class="fas fa-calendar fa-2x mb-2"></i>
                <h5>YEAR</h5>
                <p><asp:Label ID="lblYear" runat="server" /></p>
            </div>
        </div>
    </div>

    <!-- Fuel Type -->
    <div class="item">
        <div class="card car-card text-center">
            <div class="card-body">
                <i class="fas fa-gas-pump fa-2x mb-2"></i>
                <h5>FUEL TYPE</h5>
                <p><asp:Label ID="lblFuel" runat="server" /></p>
            </div>
        </div>
    </div>

    <!-- Transmission -->
    <div class="item">
        <div class="card car-card text-center">
            <div class="card-body">
                <i class="fas fa-cogs fa-2x mb-2"></i>
                <h5>TRANSMISSION</h5>
                <p><asp:Label ID="lblTransmission" runat="server" /></p>
            </div>
        </div>
    </div>

    <!-- Mileage -->
    <div class="item">
        <div class="card car-card text-center">
            <div class="card-body">
                <i class="fas fa-tachometer-alt fa-2x mb-2"></i>
                <h5>MILEAGE</h5>
                <p><asp:Label ID="lblMileage" runat="server" /></p>
            </div>
        </div>
    </div>

    <!-- Engine -->
    <div class="item">
        <div class="card car-card text-center">
            <div class="card-body">
                <i class="fas fa-cogs fa-2x mb-2"></i>
                <h5>ENGINE</h5>
                <p><asp:Label ID="lblEngine" runat="server" /></p>
            </div>
        </div>
    </div>

    <!-- Category -->
    <div class="item">
        <div class="card car-card text-center">
            <div class="card-body">
                <i class="fas fa-list fa-2x mb-2"></i>
                <h5>CATEGORY</h5>
                <p><asp:Label ID="lblCategory" runat="server" /></p>
            </div>
        </div>
    </div>

    <!-- Status -->
    <div class="item">
        <div class="card car-card text-center">
            <div class="card-body">
                <i class="fas fa-check-circle fa-2x mb-2"></i>
                <h5>STATUS</h5>
                <p><asp:Label ID="lblStatus" runat="server" /></p>
            </div>
        </div>
    </div>

</div>



            <div class="car-actions">
                <asp:Button ID="btnBookNow" runat="server" Text="Book Now" CssClass="btn btn-primary" OnClick="btnBookNow_Click" />
                <asp:Button ID="btnBack" runat="server" Text="Back to Cars" CssClass="btn btn-secondary" OnClick="btnBack_Click" />
            </div>
        </section>

    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    $(document).ready(function () {
        $(".owl-carousel").owlCarousel({
            loop: true,
            margin: 20,
            nav: true,
            dots: true,
            autoplay: true,
            autoplayTimeout: 4000,
            autoplayHoverPause: true,
            responsive: {
                0: { items: 1 },
                576: { items: 2 },
                992: { items: 3 },
                1200: { items: 4 }
            }
        });
    });
    </script>
</body>
</html>
