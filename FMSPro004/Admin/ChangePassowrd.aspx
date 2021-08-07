<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ChangePassowrd.aspx.cs" Inherits="Admin_ChangePassowrd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Change Password</title>
  <link rel="icon" href="../assets/img/favicon.png" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- 
<div class=" container-fluid">
 <div class="row">
      <div class="col-sm-3" style="background-color:yellow;">
      <div class="form-group">
        <label> </label>
      </div>
      </div>
      <div class="col-sm-3" style="background-color:orange;">
      <div class="form-group">
        <label> </label>
      </div>
      </div>
      <div class="col-sm-3" style="background-color:yellow;">
      <div class="form-group">
        <label> </label>
      </div>
      </div>

      <div class="col-sm-3" style="background-color:orange;">
      <div class="form-group">
        <label> </label>
      </div>
      </div>
    </div>

</div> -->

<div class="container-fluid">
<div class="row">
      <div class="col-sm-12" >
      <div class="form-group">
<br/>
        <div class="table table-responsive">
           <h4>Edit/Update User Record</h4>
           <br />
            <asp:GridView ID="GridView1" CssClass="table table-bordered table-sm table-hover" runat="server"
                                        DataKeyNames="user_id" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing"
                                        OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating"
                                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnPageIndexChanging="GridView1_PageIndexChanging"
                                        OnRowDeleting="GridView1_RowDeleting" CaptionAlign="Top" ShowFooter="true" AllowPaging="true" PageSize="10" EmptyDataText="Record Not Found...">
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblID" runat="server" CssClass="form-control"  Text='<%# Eval("user_id")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblEditID" runat="server" CssClass="form-control"  Text='<%# Eval("user_id")%>' Visible="false"></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText="User Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGVuser_name" runat="server" CssClass="form-control"  Text='<%# Eval("user_name")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGVEdituser_name" runat="server" CssClass="form-control"  Text='<%# Eval("user_name")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGVemail" runat="server" CssClass="form-control"  Text='<%# Eval("email")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGVEditemail" runat="server" CssClass="form-control"  Text='<%# Eval("email")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Password">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGVPass"  runat="server" CssClass="form-control"  Text='<%# Eval("password")%>' ></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGVEditPass" runat="server" CssClass="form-control"  Text='<%# Eval("password")%>' ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                             

                                            <asp:TemplateField HeaderText="city">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGVcity" runat="server" CssClass="form-control"  Text='<%# Eval("city")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGVEditcity" runat="server" CssClass="form-control"  Text='<%# Eval("city")%>' ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Dist">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGVDist" runat="server" CssClass="form-control"  Text='<%# Eval("Dist")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGVEditDist" runat="server"  CssClass="form-control" Text='<%# Eval("Dist")%>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGVstatus" runat="server" CssClass="form-control"  Text='<%# Eval("status")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGVEditstatus" runat="server" CssClass="form-control"  Text='<%# Eval("status")%>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="question">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGVquestion" runat="server" CssClass="form-control"  Text='<%# Eval("question")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:Label ID="lblGVquees" runat="server"  CssClass="form-control" Text='<%# Eval("question")%>' Visible="false"></asp:Label>
                                                    <asp:DropDownList ID="ddlSecQues" CssClass="form-control"  runat="server">
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
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Ans">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGVAns" runat="server"  CssClass="form-control" Text='<%# Eval("Ans")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGVEditAns" runat="server"  CssClass="form-control" Text='<%# Eval("Ans")%>'></asp:TextBox>
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
</asp:Content>

