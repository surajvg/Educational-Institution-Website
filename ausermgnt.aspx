<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ausermgnt.aspx.cs" Inherits="TestProject.ausermgnt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin | User Management</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Add AdminLTE CSS and dependencies -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.1.0/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
    <form id="form1" runat="server">
        <div class="wrapper">
            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light" style="height: 77px;">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                </ul>
            </nav>

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-light-primary elevation-4">
                <!-- Brand Logo -->
                <a href="#" class="brand-link">
                    <img src="logo.png" alt="NIE Logo" class="logo" height="50" width="50">
                    &nbsp;
           <span class="brand-text font-weight-light"><b>Admin</b></span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Dashboard -->
                            <li class="nav-item">
                                <a href="adashboard.aspx" class="nav-link">
                                    <i class="nav-icon fas fa-tachometer-alt"></i>
                                    <p>Dashboard</p>
                                </a>
                            </li>
                            <!-- User Management -->
                            <li class="nav-item">
                                <a href="ausermgnt.aspx" class="nav-link active">
                                    <i class="nav-icon fas fa-users"></i>
                                    <p>User Management</p>
                                </a>
                            </li>
                            <!-- Logout -->
                            <li class="nav-item">
                                <a href="login.aspx" class="nav-link">
                                    <i class="nav-icon fas fa-sign-out-alt"></i>
                                    <p>Logout</p>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <h1>Admin Dashboard</h1>
                        &nbsp
                                <h3>User Details :</h3>
                        &nbsp
                                    <asp:GridView ID="GridView1" CssClass="table table-bordered table-responsive" runat="server" AutoGenerateColumns="False"  DataKeyNames="id"  HorizontalAlign="Center"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                            <asp:BoundField DataField="nm" HeaderText="Name" SortExpression="nm" />
                                            <asp:BoundField DataField="em" HeaderText="Email" SortExpression="em" />
                                            <asp:BoundField DataField="ph" HeaderText="Phone" SortExpression="ph" />
                                            <asp:BoundField DataField="gen" HeaderText="Gender" SortExpression="gen" />
                                            <asp:BoundField DataField="dpt" HeaderText="Department" SortExpression="dpt" />
                                            <asp:BoundField DataField="pswd" HeaderText="Password" SortExpression="pswd" />
                                            <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Button ID="Edit" runat="server" CommandName="Edit" Text="Edit"  CssClass="btn btn-success" />
                                             
                                                    <asp:Button ID="Delete" runat="server" CommandName="Delete" Text="Delete"  CssClass="btn btn-danger" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" CssClass="table table-primary" />
                                    </asp:GridView>

                        </div>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <!-- Your content goes here -->
                    </div>
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <!-- Main Footer -->
            <footer class="main-footer">
                <div class="float-right d-none d-sm-block">
                    <b>Version</b> 3.1.0
                </div>
            </footer>
        </div>
        <!-- /.wrapper -->

        <!-- Add AdminLTE JS and dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.1.0/js/adminlte.min.js"></script>
    </form>
</body>
</html>


