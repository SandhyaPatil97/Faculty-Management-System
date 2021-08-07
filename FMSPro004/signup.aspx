<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
    <title>SignUP</title>
    
    <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
       
        <!-- Favicon-->
        
<link rel="icon" href="assets/img/favicon.png" />

        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
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
      
            <!-- Jumbotron Header-->
            
            <!-- Page Features-->
            <div class="row text-center">
            <br />
                <div class="col-lg-3 col-md-6 mb-4">
                   
                </div>
                <div class="col-lg-6 col-md-6 mb-4">

               
                    <div class="card h-100">
                        
                        <div class="card-body">
                            <h4 class="card-title">User Registration</h4>
                            <p class="card-text"> </p>

                            <table class="table table-bordered table-sm">
                             <tr>
                            <td>User Name:</td>
                            <td> 
            <asp:TextBox ID="txtUserName1" CssClass="form-control"  runat="server" autofocus="" placeholder="Enter Full UserName" style=" text-transform:uppercase"></asp:TextBox>
            </td>
                            </tr>


                             <tr>
                            <td>Email ID:</td>
                            <td> 
            <asp:TextBox ID="txtEmail1" CssClass="form-control"  runat="server" placeholder="Enter Email"></asp:TextBox> </td>
                            </tr>

                            

                            <tr>
                            <td>Password:</td>
                            <td>
                            <asp:TextBox ID="txtPassword1" CssClass="form-control"  runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                            </td>
                            
                            </tr>

                             <tr>
                            <td>Confirm Password:</td>
                            <td>
                            <asp:TextBox ID="txtConfirmpass" CssClass="form-control"  runat="server"  TextMode="Password" ></asp:TextBox>
                            </td>
                            
                            </tr>

                            <tr>
                            <td>City:</td>
                            <td> 
            <asp:TextBox ID="txtCity" CssClass="form-control"  runat="server"></asp:TextBox> </td>
                            </tr>



                            <tr>
                            <td>District:</td>
                            <td> 
            <asp:TextBox ID="txtDist" CssClass="form-control"  runat="server"></asp:TextBox> </td>
                            </tr>

                            <tr>
                            <td>Security Question:</td>
                            <td> 
                <asp:DropDownList ID="ddlSecQues" CssClass="form-control" runat="server">
                <asp:ListItem Text="Select Question" Value="Select Question"></asp:ListItem>
                <asp:ListItem Text="What is the name of your first pet" Value="What is the name of your first pet"></asp:ListItem>
                <asp:ListItem Text="What was your first car" Value="What was your first car"></asp:ListItem>
                <asp:ListItem Text="What elementary school did you attend" Value="What elementary school did you attend"></asp:ListItem>
                <asp:ListItem Text="What is the name of the town where you were born" Value="What is the name of the town where you were born"></asp:ListItem>
                <asp:ListItem Text="Who was your childhood hero" Value="Who was your childhood hero"></asp:ListItem>
                <asp:ListItem Text="Where was your best family vacation as a kid" Value="Where was your best family vacation as a kid"></asp:ListItem>
                <asp:ListItem Text="What is the first and last name of your first boyfriend or girlfriend" Value="What is the first and last name of your first boyfriend or girlfriend"></asp:ListItem>
                <asp:ListItem Text="Which phone number do you remember most from your childhood" Value="Which phone number do you remember most from your childhood"></asp:ListItem>
                <asp:ListItem Text="What is the name of your first school" Value="What is the name of your first school"></asp:ListItem>
                <asp:ListItem Text="What is your favorite movie" Value="What is your favorite movie"></asp:ListItem>
                <asp:ListItem Text="When is your anniversary" Value="When is your anniversary"></asp:ListItem>
                </asp:DropDownList>
                            </td>
                            </tr>


                            <tr>
                            <td>Answer:</td>
                            <td> 
            <asp:TextBox ID="txtquesAns" CssClass="form-control"  runat="server"></asp:TextBox> </td>
                            </tr>




                            <tr>
                            <td>
                <asp:Button ID="btnlogin" CssClass=" btn btn-success btn-block" runat="server" Text="Register" 
                                    onclick="btnlogin_Click" /> </td>
                            <td> <asp:Button ID="btncancel" CssClass=" btn btn-danger" runat="server" 
                                    Text="Cancel" onclick="btncancel_Click" /></td>
                            </tr>
                            </table>
                        </div>
                        <div class="card-footer"><a class="btn btn-link" href="signin.aspx">Login!</a></div>
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
    </form>
</body>
</html>
