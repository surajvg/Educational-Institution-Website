<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TestProject.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>NIE | Login</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        span {
            color: red;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-default " role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-main">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="navbar-toggler-icon"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a href="index.aspx"><img src="logo.png" alt="NIE Logo" class="logo" height="50" width="50"></a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse-main">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.aspx">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="registration.aspx">Register</a></li>
                    <li><a href="login.aspx" class="nav-link active">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    
    <h3 align="center">LOGIN</h3>

    <form id="regForm" runat="server">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <img src="login.jpg" id="myImage" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  />
            </div>

            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <form>
                    
                    <label for="email" placeholder="Enter email">Email:<span>*</span></label>
                    <input type="text" id="em" name="email" runat="server" class="form-control"/><br>

                    <label for="password">Password:<span>*</span></label>
                    <input type="password" id="pswd" name="password" runat="server" class="form-control"/><br>

                    <div style="text-align: left;">
                        <asp:Button ID="Logindata" runat="server" onclick="Logindata_Click" CssClass="btn btn-success" Text="Login" OnClientClick="return validateLogin();" />
                    </div>
                    <div style="text-align: center;">
                        <p>Not yet Registered? <a href="registration.aspx">Sign Up</a></p>
                    </div>
                </form>
            </div>
        </div>
    </form>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <footer class="foot text-center">
            All Rights Reserved. &copy; 2023 SvG.
        </footer>
    </div>

    <script>
        function validateLogin() {

            var email = document.getElementById('em').value;
            var password = document.getElementById('pswd').value;

            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (email === "") {
                alert("Please Enter The Email.");
                return false;
            } else if (/^\s/.test(email)) {
                alert("Email should not contain spaces at the beginning.");
                return false;
            } else if (/\s$/.test(email)) {
                alert("Email should not contain spaces at the end.");
                return false;
            } else if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            if (password === "") {
                alert("Please Enter The Password.");
                return false;
            }
            return true;
            debugger;
        }
    </script>
</html>
