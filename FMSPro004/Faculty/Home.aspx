<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacultyMasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Faculty_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Faculty Dashboard</title>
<link rel="icon" href="assets/img/favicon.png" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<header class="jumbotron my-4 container">
                <h4 class="display-3">A Warm Welcome!</h4>
                <p class="lead">This System Should Keep track of  faculty members records.</p>
                <%--<a class="btn btn-primary btn-lg" href="#!">Call to action!</a>--%>
            </header>
            <div class="container">
            
            
            

             <div class="row text-center">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <img class="card-img-top" src="../Imgs/addmember.png" alt="..." />
                        <div class="card-body">
                            <h4 class="card-title">Add Members</h4>
                            <p class="card-text">You can Register your child on this portal use bellow button</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary" href="AddMember.aspx">Click Here</a></div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <img class="card-img-top" src="../Imgs/images.png" alt="..." />
                        <div class="card-body">
                            <h4 class="card-title">Workshop</h4>
                            <p class="card-text">See the Details of attended and conducted workshop.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary" href="Workshop.aspx">Click Here</a></div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <img class="card-img-top" src="../Imgs/sallary.png" alt="..." />
                        <div class="card-body">
                            <h4 class="card-title">Payroll</h4>
                            <p class="card-text">see salary detail of staff  .</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary" href="Payroll.aspx">Click Here</a></div>
                    </div>
                </div>
               <%-- <div class="col-lg-3 col-md-6 mb-4">
                    <div class="card h-100">
                        <img class="card-img-top" src="https://via.placeholder.com/500x325" alt="..." />
                        <div class="card-body">
                            <h4 class="card-title">Card title</h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni sapiente, tempore debitis beatae culpa natus architecto.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary" href="#!">Click Here</a></div>
                    </div>
                </div>--%>

            </div>
            </div>

</asp:Content>

