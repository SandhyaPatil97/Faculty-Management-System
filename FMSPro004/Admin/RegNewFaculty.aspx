<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="RegNewFaculty.aspx.cs" Inherits="Admin_RegNewFaculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link rel="icon" href="assets/img/favicon.png" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div class="card-body">
                            <h4 class="card-title">User Registration</h4>
                            <p class="card-text"> </p>

                            <table class="table table-bordered table-sm">
                             <tr>
                            <td>User Name:</td>
                            <td> 
            <asp:TextBox ID="txtUserName1" CssClass="form-control"  runat="server" autofocus="" placeholder="Enter Full UserName" style=" text-transform:uppercase" required="required"></asp:TextBox>
            </td>
                            </tr>


                             <tr>
                            <td>Email ID:</td>
                            <td> 
            <asp:TextBox ID="txtEmail1" CssClass="form-control"  runat="server" placeholder="Enter Email" required="required"></asp:TextBox> </td>
                            </tr>

                            

                            <tr>
                            <td>Password:</td>
                            <td>
                            <asp:TextBox ID="txtPassword1" CssClass="form-control"  runat="server" TextMode="Password" placeholder="Enter Password" required="required"></asp:TextBox>
                            </td>
                            
                            </tr>

                             <tr>
                            <td>Confirm Password:</td>
                            <td>
                            <asp:TextBox ID="txtConfirmpass" CssClass="form-control"  runat="server"  TextMode="Password" required="required" ></asp:TextBox>
                            </td>
                            
                            </tr>

                            <tr>
                            <td>City:</td>
                            <td> 
            <asp:TextBox ID="txtCity" CssClass="form-control"  runat="server" required="required"></asp:TextBox> </td>
                            </tr>



                            <tr>
                            <td>District:</td>
                            <td> 
            <asp:TextBox ID="txtDist" CssClass="form-control"  runat="server" required="required"></asp:TextBox> </td>
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
            <asp:TextBox ID="txtquesAns" CssClass="form-control"  runat="server" required="required"></asp:TextBox> </td>
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

<div class="card ">
  <div class="card-header alert-info">
    Report
  </div>

  <div class="card-body">
    <div class="table">
    
    <br />
        <asp:GridView ID="GridView1" CssClass="table table-bordered table-sm table-hover" runat="server"
                                        DataKeyNames="USER_ID" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing"
                                        OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating"
                                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnPageIndexChanging="GridView1_PageIndexChanging"
                                        OnRowDeleting="GridView1_RowDeleting" Caption="User Records" CaptionAlign="Top" Font-Size="8pt" ShowFooter="true" AllowPaging="true" PageSize="10" EmptyDataText="Record Not Found...">
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblID" runat="server" Text='<%# Eval("USER_ID")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblEditID" runat="server" Text='<%# Eval("USER_ID")%>' Visible="false"></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText="FacultyName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1facultyName" runat="server" Text='<%# Eval("Faculty")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGV1EditFacultyName" runat="server" Text='<%# Eval("Faculty")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1Email" runat="server" Text='<%# Eval("Email")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGV1EditEmail" runat="server" Text='<%# Eval("Email")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                            <asp:TemplateField HeaderText="password">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGV1password"  runat="server" Text='<%# Eval("password")%>' ></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGV1Editpassword" runat="server" Text='<%# Eval("password")%>' ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="City">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1City" runat="server" Text='<%# Eval("City")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGV1EditCity" runat="server" Text='<%# Eval("City")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Distt">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1WDistt" runat="server" Text='<%# Eval("Distt")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGV1EditDistt" runat="server" Text='<%# Eval("Distt")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1status" runat="server" Text='<%# Eval("status")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>                                           
                                            <asp:TextBox ID="txtGV1Editstatus" runat="server" Text='<%# Eval("status")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Question">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1Question" runat="server" Text='<%# Eval("Question")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>                                           
                                           
                                            <asp:TextBox ID="txtGV1EditQuestion" runat="server" Text='<%# Eval("Question")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Answer">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1Ans" runat="server" Text='<%# Eval("Ans")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>                                           
                                           
                                            <asp:TextBox ID="txtGV1EditAns" runat="server" Text='<%# Eval("Ans")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                    <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-sm btn-primary" />
                                    <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-sm btn-danger" />

                                        </Columns>
                                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                                    </asp:GridView>
    </div>
  </div>

<div class="card-footer bg-transparent border-success"> </div>
</div>
</asp:Content>

