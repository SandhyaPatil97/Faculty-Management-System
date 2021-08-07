<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="signin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Login</title>
    <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
       
        <!-- Favicon-->
        
<link rel="icon" href="assets/img/favicon.png" />

        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>
<body onload="showBoth()">
    <form id="form1" runat="server">
    <div>
    <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="Default.aspx">Faculty Management System</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="Default.aspx">
                                Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <%--<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Services</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>--%>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Page Content-->
        <div class="container">
        <br />
        <br />
            <!-- Jumbotron Header-->
             <asp:Panel ID="pnl_warning" runat="server" Visible="false">
                                        <div class="form-group card-header text-center">
                                            <div class="alert-danger">
                                                <asp:Label ID="lbl_warning" runat="server" Text="Label" CssClass="col-form-label text-center"></asp:Label>
                                            </div>
                                        </div>
                                    </asp:Panel>
            <!-- Page Features-->
            <div class="row text-center">
            <br />
                <div class="col-lg-3 col-md-6 mb-4">
                   
                </div>
                <div class="col-lg-6 col-md-6 mb-4">

               
                    <div class="card h-100">
                        
                        <div class="card-body">
                            <h4 class="card-title">Secure Login</h4>
                            <p class="card-text"> </p>

                            <table class="table">
                            <tr>
                            <td>Email ID:</td>
                            <td> 
            <asp:TextBox ID="txtEmail" CssClass="form-control"  runat="server" autofocus="" placeholder="Enter Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rqr_emil" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            
            </td>
                            </tr>

                            <tr>
                            <td>Password:</td>
                            <td>
                            <asp:TextBox ID="txtPassword" CssClass="form-control"  runat="server" placeholder="Enter password" TextMode="Password" onfocus="showPass()"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqr_pass" runat="server" ErrorMessage="Enter password" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            
                            </tr>

                            <tr>
                            <td colspan="2">
                             <div class="form-group">
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <asp:CheckBox ID="chk_remember" runat="server" CssClass="form-check-input remembermecustom" />
                                                    Remember Password</label>

                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <asp:CheckBox ID="CheckBox2" runat="server" CssClass="form-check-input remembermecustom" />
                                                    Keep last ID & Password
                                                </label>
                                            </div>
                                        </div>
                            </td>
                            </tr>



                            <tr>
                            <td colspan="2">
                <asp:Button ID="btnlogin" CssClass=" btn btn-success btn-block" runat="server" Text="Login" 
                                    onclick="btnlogin_Click"  /></td>
                            <%--<td> <asp:Button ID="btncancel" CssClass=" btn btn-danger" runat="server" 
                                    Text="Cancel" onclick="btncancel_Click" /></td>--%>
                            </tr>
                            </table>
                        </div>
                        <div class="card-footer"><a class="btn btn-link" href="signup.aspx">New Account SignUp!</a></div>
                    </div>
                </div>
               
                <div class="col-lg-3 col-md-6 mb-4">
                    
                </div>
            </div>
        </div>
        <!-- Footer-->
        <br />
        <br />
        
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright © FacultyManagementSystem 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

        </div>
    </form>

    <script type="text/javascript">

        function showPass() {
            var cookies = document.cookie;
            var allcookie = cookies.split(";");
            for (ctr = 0; ctr < allcookie.length; ctr++) {
                var dt = allcookie[ctr];
                var str = dt.split("=");
                if (str[0].trim() == document.getElementById("txtEmail").value.trim()) {
                    document.getElementById("txtPassword").value = str[1];
                    break;
                }
            }
        }
        function showBoth() {
            var cookies = document.cookie;
            var allcookie = cookies.split(";");
            for (c = 0; c < allcookie.length; c++) {
                var a = allcookie[c];
                var v = a.split("=");
                if (v[0].trim() == "erplastid")
                    document.getElementById("txtEmail").value = v[1];
                if (v[0].trim() == "erplastpass") {
                    document.getElementById("txtPassword").value = v[1];
                    break;
                }

            }
        }

    </script>
    
    
</body>
</html>
