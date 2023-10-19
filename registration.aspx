<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="TestProject.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>NIE | Registration</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>

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

    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-main">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="navbar-toggler-icon"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a href="index.aspx">
                    <img src="logo.png" alt="NIE Logo" class="logo" height="50" width="50">
                </a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse-main">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.aspx">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="registration.aspx" class="nav-link active">Register</a></li>
                    <li><a href="login.aspx">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

  
    <h3 align="center">REGISTRATION FORM</h3>
   
    <form id="regForm" runat="server">
        
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <img src="register.jpeg" id="myImage" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  />
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            
                    <label for="studentName">Name:<span>*</span></label>
                    <input type="text" id="nm" name="studentName" runat="server" class="form-control"/><br>

                    <label for="email">Email:<span>*</span></label>
                    <input type="text" id="em" name="email" runat="server" class="form-control"/><br>

                    <label for="phone">Phone No:<span>*</span></label>
                    <input type="text" id="ph" name="phone" runat="server" class="form-control"/><br>

                    <label for="gender">Gender:<span>*</span></label>
                    <input type="text" id="gen" name="gender" runat="server" class="form-control"/><br>

                    <label for="department">Department:<span>*</span></label>
                    <input id="dpt" name="department" runat="server" class="form-control"/><br>

                    <label for="password">Password:<span>*</span></label>
                    <input type="password" id="pswd" name="password" runat="server" class="form-control"/><br>

                    <asp:Button ID="savedata" runat="server" OnClick="savedata_Click" CssClass="btn btn-success btn" Text="Save User Info" OnClientClick="return validateForm();" />
                    <button type="reset" class="btn btn-danger">Reset</button>
   
            </div>
        </div>

    </form>

    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <footer class="foot text-center">
            All Rights Reserved. &copy; 2023 SvG.
        </footer>
    </div>

    <script>
        function validateForm() {
            var name = document.getElementById('nm').value;
            var email = document.getElementById('em').value;
            var phone = document.getElementById('ph').value;
            var department = document.getElementById('dpt').value;
            var password = document.getElementById('pswd').value;


            var namePattern = /^[a-zA-Z ]{3,30}$/;
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            var phonePattern = /^(?!0)\d{10}$/;

            if (name === "") {
                alert("Please Enter The Name.");
                return false;
            } else if (!namePattern.test(name)) {
                alert("Please Enter a Valid Name.");
                return false;
            } else if (/^\s/.test(name)) {
                alert("Name should not contain spaces at the beginning.");
                return false;
            }

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

            if (phone === "") {
                alert("Please Enter The Phone Number.");
                return false;
            } else if (/\s/.test(phone)) {
                alert("Phone Number should not contain spaces.");
                return false;
            } else if (!phonePattern.test(phone)) {
                alert("Please Enter a Valid 10 digit Phone Number.");
                return false;
            }

            if (department.trim() === "") {
                alert("Please enter the department.");
                return false;
            } else if (/^\s/.test(department)) {
                alert("Department should not contain spaces at the beginning.");
                return false;
            }

            if (password.trim() === "") {
                alert("Please Enter The Password.");
                return false;
            } else if (password.length < 6) {
                alert("Password must be at least 6 characters long.");
                return false;
            } else if (/\s/.test(password)) {
                alert("Password should not contain spaces.");
                return false;
            }

            return true;
            debugger;
        }
    </script>
</body>
</html>
