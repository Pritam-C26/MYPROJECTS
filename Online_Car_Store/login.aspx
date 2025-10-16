<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Online_Car_Store.login" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login & Register - Wheelz</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .bg-video {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
      z-index: -1;
    }
    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0,0,0,0.6);
      z-index: 0;
    }
    .auth-card {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(12px);
      border-radius: 15px;
      padding: 2rem;
      color: white;
      box-shadow: 0 0 25px rgba(0,0,0,0.4);
    }
    .auth-card h2 {
      font-weight: bold;
      margin-bottom: 1.5rem;
    }
    .form-control {
      background: rgba(255, 255, 255, 0.15);
      border: none;
      color: white;
    }
    .form-control:focus {
      background: rgba(255, 255, 255, 0.25);
      box-shadow: none;
      border: 1px solid #0d6efd;
    }
    .btn-custom {
      background: #0d6efd;
      border: none;
      border-radius: 30px;
      padding: 10px;
      font-weight: bold;
      transition: 0.3s;
    }
    .btn-custom:hover {
      background: #0b5ed7;
    }
    .switch-link {
      color: #0d6efd;
      cursor: pointer;
      font-weight: bold;
      text-decoration: none;
    }
    .switch-link:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <!-- Background Video -->
  <video autoplay muted loop class="bg-video">
    <source src="../images/login-video.mp4" type="video/mp4">
  </video>
  <div class="overlay"></div>

  <!-- Auth Section -->
  <div class="d-flex justify-content-center align-items-center vh-100">
    <div class="auth-card col-md-4 text-center">
      
      <!-- ASP.NET Form -->
      <form id="form1" runat="server">
        
        <!-- Login Form -->
        <div id="loginForm">
          <h2>Login</h2>
          <div class="mb-3">
            <asp:TextBox ID="txtLoginEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
          </div>
          <div class="mb-3">
            <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
          </div>
          <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-custom w-100" Text="Login" OnClick="btnLogin_Click" />
          <p class="mt-3">Don't have an account? 
            <a class="switch-link" onclick="showRegister()">Register</a>
          </p>
        </div>

        <!-- Register Form -->
        <div id="registerForm" style="display:none;">
          <h2>Register</h2>
          <div class="mb-3">
            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
          </div>
          <div class="mb-3">
            <asp:TextBox ID="txtRegisterEmail" runat="server" CssClass="form-control" placeholder="Email" value="Email"></asp:TextBox>
          </div>
              <div class="mb-3">
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Phone Number"></asp:TextBox>
              </div>
          <div class="mb-3">
            <asp:TextBox ID="txtRegisterPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
          </div>
          <div class="mb-3">
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm Password"></asp:TextBox>
          </div>
             <div class="mb-3">
               <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="State"></asp:TextBox>
             </div>
          <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-custom w-100" Text="Register" OnClick="btnRegister_Click" />
          <p class="mt-3">Already have an account? 
            <a class="switch-link" onclick="showLogin()">Login</a>
          </p>
        </div>
      </form>
    </div>
  </div>

  <script>
      function showRegister() {
          document.getElementById("loginForm").style.display = "none";
          document.getElementById("registerForm").style.display = "block";
      }
      function showLogin() {
          document.getElementById("loginForm").style.display = "block";
          document.getElementById("registerForm").style.display = "none";
      }
  </script>

</body>
</html>
