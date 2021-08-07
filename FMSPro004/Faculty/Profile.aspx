<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacultyMasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Faculty_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Faculty Profile</title>
<link rel="icon" href="assets/img/favicon.png" />


    <link href="../css/GridViewPaging.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="card">
 <h5 class="card-title">Faculty Profile Info</h5>
  <div class="card-header">
    <table class="table">
    <tr>
    <td>
        <asp:LinkButton ID="LinkButton1" CssClass="btn btn-outline-danger" 
        runat="server" onclick="LinkButton1_Click">Faculty Personal Info</asp:LinkButton></td> 
    <td>
        <asp:LinkButton ID="LinkButton2" CssClass="btn btn-outline-danger" 
	runat="server" onclick="LinkButton2_Click">Educational Details</asp:LinkButton></td>
    <td>
        <asp:LinkButton ID="LinkButton3" CssClass="btn btn-outline-danger" 
	runat="server" onclick="LinkButton3_Click">Experience</asp:LinkButton></td>
    </tr>
    </table>
  </div>

  <div class="card-body">
   
    <p class="card-text"> </p>

    <!----Show Profile---->
    <div class="row" id="pnl1" runat="server">
       <div class="col-sm-12">
           <table class="table " style="width:100%">
                   
               <tr>
                   <td>Name</td>
                   <td> <asp:Label ID="lblvname" CssClass="btn btn-link" runat="server" Text="Label"></asp:Label>    </td>
                   <td>Mobile</td>
                   <td>  <asp:Label ID="lblvmobile" CssClass="btn btn-link" runat="server" Text="Label"></asp:Label> </td>
                   <td>Image
                   <br />
                       <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" BorderStyle="Solid" />
                   
                   </td>
                   
               
               </tr>
               <tr>
                  <td>Email</td>
                  <td>  <asp:Label ID="lblvemail" CssClass="btn btn-link" runat="server" Text="Label"></asp:Label>  </td>
                  <td>City</td>
                  <td>  <asp:Label ID="lblvcity" CssClass="btn btn-link" runat="server" Text="Label"></asp:Label>  </td>
                  
               </tr>
               <tr>
                   <td>Department</td>
                   <td><asp:Label ID="lblvDept" CssClass="btn btn-link" runat="server" Text="Label"></asp:Label> </td>
                   <td>Position</td>
                   <td><asp:Label ID="lblvPosition" CssClass="btn btn-link" runat="server" Text="Label"></asp:Label> </td>
               </tr>
               <tr>
               <td>Address</td>
               <td><asp:Label ID="lblvAddress" CssClass="btn btn-link" runat="server" Text="Label"></asp:Label> </td>
              
               </tr>
           </table>
    </div>    
    </div>
    <!----->



    <!----Add Profile info---->
    <div  id="pnl2" runat="server">
    <div style="width:100%; text-align:center; border-bottom:2px solid red"><h5>Add Faculty Profile </h5></div> <br />
    <div class="row">
       <div class="col-sm-4">
           <div class="form-group">
                <label>FullName: </label>
               <asp:TextBox ID="txtAFullName" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

 

       <div class="col-sm-4">
           <div class="form-group">
                <label>Mobile: </label>
                <asp:TextBox ID="txtAMobile" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

 

       <div class="col-sm-4">
           <div class="form-group">
                <label> Department</label>
                <asp:TextBox ID="txtADept" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>
    
       </div>
<div class="row">
       <div class="col-sm-4">
           <div class="form-group">
                <label> Position</label>
                <asp:TextBox ID="txtAPosition" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

 

       <div class="col-sm-4">
           <div class="form-group">
                <label> Address</label>
                <asp:TextBox ID="txtAAddress" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

 

       <div class="col-sm-4">
           <div class="form-group">
                <label> Upload Image</label><br />
               <asp:FileUpload ID="FileUpload1"  runat="server" />
           </div>
       </div>
    </div>
    <div class="row">
       <div class="offset-sm-4 col-sm-4">
           <div class="form-group">
               <label>&nbsp</label>
               <asp:Button ID="btnupdatepro" CssClass=" form-control btn btn-success" runat="server" 
                   Text="UPDATE" onclick="btnupdatepro_Click" />
           </div>
       </div>
    </div>
    </div>
    <!----->




     <!----Show show Edu & Exp---->
    <div class="row" id="pnl5" runat="server">
       <div class="col-sm-12">
       <div style="width:100%; text-align:center; border-bottom:2px solid red"><h5>Faculty Educational Details </h5></div> <br />
          <div class="row">
            <div class="col-md-12">
                 <div class="table table-responsive">
                 <br />
            <asp:GridView ID="GridView1" CssClass="table table-bordered table-sm table-hover" runat="server"
                                        DataKeyNames="EduID" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing"
                                        OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating"
                                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnPageIndexChanging="GridView1_PageIndexChanging"
                                        OnRowDeleting="GridView1_RowDeleting"  CaptionAlign="Top" ShowFooter="true" AllowPaging="true" PageSize="10" EmptyDataText="Record Not Found...">
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblID" runat="server" CssClass="form-control" Text='<%# Eval("EduID")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblEditEduID" runat="server" CssClass="form-control" Text='<%# Eval("EduID")%>' ></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText="ClassName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1ClassName" runat="server" CssClass="form-control" Text='<%# Eval("ClassName")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGV1EditClassName" runat="server" CssClass="form-control" Text='<%# Eval("ClassName")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                        <asp:TemplateField HeaderText="CollegeName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1CollegeName" runat="server" CssClass="form-control" Text='<%# Eval("CollegeName")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGV1EditCollegeName" runat="server" CssClass="form-control" Text='<%# Eval("CollegeName")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                            <asp:TemplateField HeaderText="PassingYear">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGV1PassYear"  runat="server" CssClass="form-control" Text='<%# Eval("PassYear")%>' ></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGV1EditPassYear" runat="server" CssClass="form-control" Text='<%# Eval("PassYear")%>' ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                    <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-sm btn-primary" />
                                    <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-sm btn-danger" />

                                        </Columns>
                                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                                    </asp:GridView>
                 </div>
            </div>
          </div>
<!-- 
          <div class="row">
            <div class="col-md-12">
                 <div class="table table-responsive">
                 
                 </div>
            </div>
          </div> -->
    </div>


      

    
    </div>
    <!----->



    <!----Add Education---->
    <div class="row" id="pnl3" runat="server">
    <div style="width:100%; text-align:center; border-bottom:2px solid red"><h5>Add Faculty Education Details </h5></div> <br />
       <div class="col-sm-3">
           <div class="form-group">
                <label>Class </label>
                <asp:TextBox ID="txtEduClass" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

       <div class="col-sm-3">
           <div class="form-group">
                <label>College Name </label>
                <asp:TextBox ID="txtEduCollege" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

       <div class="col-sm-3">
           <div class="form-group">
                <label>Passing Year </label>
                <asp:TextBox ID="txtEduPassYear" CssClass="form-control" runat="server" TextMode="Date" ></asp:TextBox> <%----%>
           </div>
       </div>

       <div class="col-sm-3">
           <div class="form-group">
               <label>&nbsp</label>
               <asp:Button ID="btnAddEducation" CssClass=" btn btn-success form-control" runat="server" 
                   Text="UPDATE" onclick="btnAddEducation_Click" />
           </div>
       </div>

    
    </div>
    <!----->



    <!----Show Expereince---->
    <div class="row" id="pnl6" runat="server">
       <div class="col-sm-12">
	<div style="width:100%; text-align:center; border-bottom:2px solid red"><h5> Admin Experience Details </h5></div> <br />
          <div class="row">
            <div class="col-md-12">
                 <div class="table table-responsive">
                 <br />
            <asp:GridView ID="GridView2" CssClass="table table-bordered table-sm table-hover" runat="server"
                                        DataKeyNames="ExpID" AutoGenerateColumns="false" OnRowEditing="GridView2_RowEditing"
                                        OnRowDataBound="GridView2_RowDataBound" OnRowUpdating="GridView2_RowUpdating"
                                        OnRowCancelingEdit="GridView2_RowCancelingEdit" OnPageIndexChanging="GridView2_PageIndexChanging"
                                        OnRowDeleting="GridView2_RowDeleting" CaptionAlign="Top"  ShowFooter="true" AllowPaging="true" PageSize="10" EmptyDataText="Record Not Found...">
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblID" runat="server" CssClass="form-control" Text='<%# Eval("ExpID")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblEditID" runat="server" CssClass="form-control" Text='<%# Eval("ExpID")%>'></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Organization">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1OrgName" runat="server" CssClass="form-control" Text='<%# Eval("OrgName")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGV1EditOrgName" runat="server" CssClass="form-control" Text='<%# Eval("OrgName")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Position">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1Position" runat="server" CssClass="form-control" Text='<%# Eval("Position")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGV1EditPosition" runat="server" CssClass="form-control" Text='<%# Eval("Position")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                            <asp:TemplateField HeaderText="joinDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGV1joinDate"  runat="server" CssClass="form-control" Text='<%# Eval("joinDate")%>' ></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGV1EditjoinDate" runat="server" CssClass="form-control" Text='<%# Eval("joinDate")%>' ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="TotExp">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGV1TotExp"  runat="server" CssClass="form-control" Text='<%# Eval("TotExp")%>' ></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGV1EditTotExp" runat="server" CssClass="form-control" Text='<%# Eval("TotExp")%>' ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                    <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-sm btn-primary" />
                                    <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-sm btn-danger" />

                                        </Columns>
                                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                                    </asp:GridView>
                 </div>
            </div>
          </div>


    </div>

    
    </div>
    <!---pnl6 ending-->



     



    


     <!----Add Experince---->
    <div class="row" id="pnl4" runat="server">

    <div style="width:100%; text-align:center; border-bottom:2px solid red"><h5>Add Faculty Experience </h5></div>
    <br />
       <div class="col-sm-3">
           <div class="form-group">
                <label> Organization Name:</label>
                <asp:TextBox ID="txtExpOrgName" CssClass="form-control" runat="server" ></asp:TextBox>
           
           </div>
       </div>

       <div class="col-sm-3">
           <div class="form-group">
                <label> Position</label>
                <asp:TextBox ID="txtExpPosi" CssClass="form-control" runat="server" ></asp:TextBox>
           </div>
       </div>

       <div class="col-sm-2">
           <div class="form-group">
                <label>Joining Date </label>
                <asp:TextBox ID="txtExpJoinDate" CssClass="form-control" runat="server" TextMode="Date" ></asp:TextBox> <%----%>
           </div>
       </div>

       <div class="col-sm-2">
           <div class="form-group">
                <label>Total Exp: </label>
                <asp:TextBox ID="txtExpTotExp" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

       	<div class="col-sm-2">
           <div class="form-group">
               <label>&nbsp</label>
               <asp:Button ID="btnAddExperience" CssClass=" btn btn-success form-control" runat="server" 
                   Text="UPDATE" onclick="btnAddExperience_Click" />
           </div>
       </div>   
    </div>
    <!----->

<div class="card-footer bg-transparent border-success"> </div>
</div>
  </div>
</asp:Content>
