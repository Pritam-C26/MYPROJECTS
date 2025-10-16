<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarBooking.aspx.cs" Inherits="Online_Car_Store.CarBooking" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Your Car</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #fff;
            color: #111;
        }

        /* Hero Section */
        .hero {
            position: relative;
            width: 100%;
            height: 70vh;
            overflow: hidden;
        }

        .hero img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(65%); /* darken for contrast */
        }

        /* Overlay text on hero */
        .hero-text {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
            color: #fff;
        }

        .hero-text h1 {
            font-size: 2.8rem;
            font-weight: 700;
            text-transform: uppercase;
        }

        /* Floating Booking Form */
        .booking-container {
            position: relative;
            max-width: 700px;
            margin: -100px auto 50px auto;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 6px 25px rgba(0,0,0,0.15);
            padding: 40px;
            z-index: 10;
        }

        .booking-container h2 {
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 15px;
            color: #111;
        }

        .booking-container p {
            font-size: 1rem;
            color: #444;
        }

        .form-label {
            font-weight: 600;
            color: #000;
        }

        /* Button - Black & White Theme */
        .btn-book {
            background: #000;
            color: #fff;
            border-radius: 30px;
            padding: 12px 35px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-book:hover {
            background: #fff;
            color: #000;
            border: 2px solid #000;
            transform: scale(1.05);
            box-shadow: 0 6px 18px rgba(0,0,0,0.2);
        }

        .btn-back {
             background: #000;
             color: #fff;
             border-radius: 30px;
             padding: 12px 35px;
             font-weight: 600;
             transition: all 0.3s ease;
             border: none;
        }
        .btn-back:hover {
               background: #fff;
               color: #000;
               border: 2px solid #000;
               transform: scale(1.05);
               box-shadow: 0 6px 18px rgba(0,0,0,0.2);
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Hero Image Section -->
        <div class="hero">
            <asp:Image ID="imgCar" runat="server" />
            <div class="hero-text">
                <h1><asp:Label ID="lblCarName" runat="server"></asp:Label></h1>
            </div>
        </div>

        <!-- Floating Booking Form -->
        <div class="booking-container">
            <h2>Car Details</h2>
            <p><strong>Brand:</strong> <asp:Label ID="lblBrand" runat="server"></asp:Label></p>
            <p><strong>Model:</strong> <asp:Label ID="lblModel" runat="server"></asp:Label></p>
            <p><strong>Total Price:</strong> $<asp:TextBox ID="txtTotalPrice" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox></p>

            <div class="mb-3">
                <label for="txtBookingAmount" class="form-label">Booking Amount:</label>
                <asp:TextBox ID="txtBookingAmount" runat="server" CssClass="form-control" Placeholder="Enter booking amount"></asp:TextBox>
            </div>


            <div class="d-flex gap-3 mt-3">
            <asp:Button ID="btnConfirmBooking" runat="server" Text="Proceed to Payment" CssClass="btn btn-book mt-3" OnClick="btnConfirmBooking_Click" />
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-secondary btn-back mt-3" OnClick="btnBack_Click" />
            </div>
      </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
