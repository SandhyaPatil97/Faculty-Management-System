<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="MasterEntry.aspx.cs" Inherits="Admin_MasterEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Mater Entry</title>
<link rel="icon" href="assets/img/favicon.png" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="card">
  <div class="card-header">
    Add Class
  </div>

  <div class="card-body">
    <!----Show Profile---->
    <div class="row">
       <div class="col-sm-4">
           <div class="form-group">
                <label>Class Name: </label>
               <asp:TextBox ID="txtclass" CssClass=" form-control" runat="server" required="required"></asp:TextBox>
               
           </div>
           <div class="form-group">
               <asp:Button ID="btnAddClass" runat="server" Text="ADD CLASS" CssClass="btn btn-success" 
                   onclick="btnAddClass_Click" />
           </div>

       </div>

       <div class="col-sm-8">
           <div class="form-group">
                <div class="table table-responsive">
           <h4>Edit/Update Class</h4>
           
           
           <br />
            <asp:GridView ID="GridView1" CssClass="table table-bordered table-sm table-hover" runat="server"
                                        DataKeyNames="ID" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing"
                                        OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating"
                                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnPageIndexChanging="GridView1_PageIndexChanging"
                                        OnRowDeleting="GridView1_RowDeleting" Caption="Class Records" CaptionAlign="Top" Font-Size="8pt" ShowFooter="true" AllowPaging="true" PageSize="10" EmptyDataText="Record Not Found...">
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblEditID" runat="server" Text='<%# Eval("ID")%>' Visible="false"></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Class">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGVuser_name" runat="server" Text='<%# Eval("Class")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGVEdituser_name" runat="server" Text='<%# Eval("Class")%>' ></asp:TextBox>
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
    <!----->
  </div>

<div class="card-footer bg-transparent border-success"> </div>
</div>

<br />
<div class="card">
  <div class="card-header">
    Add Department
  </div>

  <div class="card-body">
    <!----Show Profile---->
    <div class="row">
       <div class="col-sm-4">
           <div class="form-group">
                <label>Department Name: </label>
               <asp:TextBox ID="txtDepartment" CssClass=" form-control" runat="server" required="required"></asp:TextBox>
           </div>
           <div class="form-group">
               <asp:Button ID="btnDepartment" runat="server" Text="ADD Department" CssClass="btn btn-success"
                   onclick="btnDepartment_Click" />
           </div>

       </div>

       <div class="col-sm-8">
           <div class="form-group">
                <div class="table table-responsive">
           <h4>Edit/Update Department</h4>
           <br />
           
           <br />
            <asp:GridView ID="GridView2" CssClass="table table-bordered table-sm table-hover" runat="server"
                                        DataKeyNames="ID" AutoGenerateColumns="false" OnRowEditing="GridView2_RowEditing"
                                        OnRowDataBound="GridView2_RowDataBound" OnRowUpdating="GridView2_RowUpdating"
                                        OnRowCancelingEdit="GridView2_RowCancelingEdit" OnPageIndexChanging="GridView2_PageIndexChanging"
                                        OnRowDeleting="GridView2_RowDeleting" Caption="Department Records" CaptionAlign="Top" Font-Size="8pt" ShowFooter="true" AllowPaging="true" PageSize="10" EmptyDataText="Record Not Found...">
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblEditID" runat="server" Text='<%# Eval("ID")%>' Visible="false"></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Department">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGVuser_name" runat="server" Text='<%# Eval("Department")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGVEdituser_name" runat="server" Text='<%# Eval("Department")%>' ></asp:TextBox>
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
    <!----->
  </div>

<div class="card-footer bg-transparent border-success"> </div>
</div>
</asp:Content>

