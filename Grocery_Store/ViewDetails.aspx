<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="GroceryStore.ViewDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Details - FreshMart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f8f9fa;
        }

        .product-container {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 50px;
        }

        .product-image {
            text-align: center;
        }

        .product-image img {
            width: 100%;
            max-height: 350px;
            object-fit: cover;
            border-radius: 12px;
            transition: transform 0.3s ease;
        }

        .product-image img:hover {
            transform: scale(1.03);
        }

        .product-title {
            margin-top: 15px;
            font-size: 1.8rem;
            font-weight: 700;
            color: #2c3e50;
        }

        .product-info h4 {
            color: #27ae60;
            font-weight: 600;
            margin-top: 10px;
        }

        .product-info p {
            font-size: 1.1rem;
            color: #555;
            line-height: 1.6;
        }

        .btn-add {
            background-color: #27ae60;
            border: none;
        }

        .btn-add:hover {
            background-color: #219150;
        }

        .quantity-select {
            width: 100px;
            display: inline-block;
        }

        @media (max-width: 768px) {
            .product-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row product-container align-items-center">
                <!-- Left Side: Image + Name -->
                <div class="col-md-5 product-image">
                    <asp:Image ID="imgProduct" runat="server" CssClass="img-fluid rounded" />
                    <div class="product-title">
                        <asp:Label ID="lblName" runat="server" />
                    </div>
                </div>

                <!-- Right Side: Details -->
                <div class="col-md-7 product-info">
                    <p><asp:Label ID="lblDescription" runat="server" /></p>
                    <h4>₹ <asp:Label ID="lblPrice" runat="server" /></h4>

                    <div class="mt-3">
                        <label for="ddlQuantity" class="form-label fw-semibold">Quantity:</label>
                        <asp:DropDownList ID="ddlQuantity" runat="server" CssClass="form-select quantity-select">
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-add btn-lg mt-3" />
                    <br />
                    <a href="Products.aspx" class="btn btn-secondary mt-3">Back to Products</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
