<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="Admin_Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="icon" href="assets/img/favicon.png" />
    <h2>
        Hi Admin</h2>
    <div class="container mt-3">
        
         
        <div class="d-flex mb-3">
            <div class="p-2 flex-fill bg-info">
                <div class="card">
                    
                    <div class="card-body">
                       <table class="table">
    <thead>
      <tr>
      <th><a href="Profile.aspx" class="btn btn-link"> Admin Profile</a></th>
        <th><a href="RegNewFaculty.aspx" class="btn btn-link">Register Faculty</a></th>
        
        <th><a href="AddMember.aspx" class="btn btn-link">Add Member</a></th>
      </tr>
    </thead>
    <tbody>
      
      
    </tbody>
  </table>
                    </div>
                    <div class="card-footer bg-transparent border-success">
                        </div>
                </div>
            </div>
            <div class="p-2 flex-fill bg-warning">
                 <div class="card">
                    
                    <div class="card-body">
                       <table class="table">
    <thead>
      <tr>
      <th><a href="MasterEntry.aspx"class="btn btn-link">Master Entry</a></th>
        <th><a href="AddMember.aspx" class="btn btn-link">Add Member</a></th>
        <th><a href="AddMember.aspx" class="btn btn-link">Add Student</a></th>
        
      </tr>
    </thead>
    <tbody>
      <tr>
      
      </tr>
      
    </tbody>
  </table>
                    </div>
                    <div class="card-footer bg-transparent border-success">
                        </div>
                </div>
                
                </div>
            <div class="p-2 flex-fill bg-primary">
                <div class="card">
                    
                    <div class="card-body">
                       <table class="table">
    <thead>
      <tr>
      <th><a href="Payroll.aspx" class="btn btn-link">Payroll</a></th>
        <th><a href="Workshop.aspx" class="btn btn-link">Workshop</a></th>
        <th><a href="Workshop.aspx" class="btn btn-link">Setting</a></th>
        
      </tr>
    </thead>
    <tbody>
      <tr>
      
      </tr>
      
    </tbody>
  </table>
                    </div>
                    <div class="card-footer bg-transparent border-success">
                        </div>
                </div>
               
               </div>
        </div>
    </div>
</asp:Content>
