<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddMember.aspx.cs" Inherits="Admin_AddMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Add Members</title>
<link rel="icon" href="assets/img/favicon.png" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="card">
  <div class="card-header">
    
  </div>

  <div class="card-body">
    <div class="row">


    <div class="col-md-6">
    <div class="card">
  <div class="card-header">
   ADD NEW MEMBER
  </div>

  <div class="card-body alert-dark">
  <!----Show Profile---->
    <div class="row">
       <div class="col-sm-6">
           <div class="form-group">
                <label>Member Name </label>
                <asp:TextBox ID="txtMName" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

       <div class="col-sm-6">
           <div class="form-group">
                <label>Department </label>
                 <asp:DropDownList ID="ddlmDepartment" CssClass="form-control" runat="server">
       </asp:DropDownList> 
           </div>
       </div>

       <div class="col-sm-6">
           <div class="form-group">
                <label> Position</label>
                <asp:TextBox ID="txtmPosition" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

       <div class="col-sm-6">
           <div class="form-group">
                <label> Salary</label>
                <asp:TextBox ID="txtmsalary" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

        <div class="col-sm-6">
           <div class="form-group">
                <label> Email</label>
                <asp:TextBox ID="txtmEmail" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>
        <div class="col-sm-6">
           <div class="form-group">
                <label> Address</label>
                <asp:TextBox ID="txtmAddress" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>


       <div class="col-sm-12">
           <div class="form-group">
               <asp:Button ID="btnAddMember" CssClass="btn btn-block btn-primary" 
                   runat="server" Text="Add Member" onclick="btnAddMember_Click" />
           </div>
       </div>





    
    </div>
    <!----->
  
  </div>

<div class="card-footer bg-transparent border-success">
<div class="table table-responsive">
<asp:TextBox ID="txtFilterGrid1Record" CssClass="form-control" runat="server" placeholder="Search...." onkeyup="Search_Gridview(this)"></asp:TextBox>
<br />
<asp:GridView ID="GridView1" CssClass="table table-bordered table-sm table-hover" runat="server"
                                        DataKeyNames="ID" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing"
                                        OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating"
                                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnPageIndexChanging="GridView1_PageIndexChanging"
                                        OnRowDeleting="GridView1_RowDeleting"  CaptionAlign="Top"  ShowFooter="true" AllowPaging="true" PageSize="10" EmptyDataText="Record Not Found...">
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblID1" runat="server" CssClass="form-control" Text='<%# Eval("ID")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblEditID1" runat="server" CssClass="form-control" Text='<%# Eval("ID")%>' Visible="false"></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                         <asp:TemplateField HeaderText="Member Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1Membername" runat="server" CssClass="form-control" Text='<%# Eval("Membername")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGV1EditMembername" runat="server" CssClass="form-control" Text='<%# Eval("Membername")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                      <asp:TemplateField HeaderText="Department">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1Department" runat="server" CssClass="form-control" Text='<%# Eval("Department")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>                                           

                                            <asp:Label ID="lblGVEditchildID" runat="server"  CssClass="form-control" Text='<%# Eval("DepartmentID")%>' Visible="false"></asp:Label>
                                            <asp:DropDownList ID="ddlGV1Department" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                     <asp:TemplateField HeaderText="Position">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGV1Position"  runat="server" CssClass="form-control" Text='<%# Eval("Position")%>' ></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGV1EditPosition" runat="server" CssClass="form-control" Text='<%# Eval("Position")%>' ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Salary">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGV1Salary" runat="server" CssClass="form-control" Text='<%# Eval("Salary")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGVEdit1Salary" runat="server" CssClass="form-control" Text='<%# Eval("Salary")%>' ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGVemail" runat="server" CssClass="form-control" Text='<%# Eval("email")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGVEditemail" runat="server" CssClass="form-control" Text='<%# Eval("email")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                           

                                             

                                            

                                             <asp:TemplateField HeaderText="Address1">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGV1Address1" runat="server" CssClass="form-control" Text='<%# Eval("Address1")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGVEditAddress1" runat="server" CssClass="form-control" Text='<%# Eval("Address1")%>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="CreatedBy">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGV1CreatedBy" runat="server" CssClass="form-control" Text='<%# Eval("CreatedBy")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGVEditCreatedBy" runat="server" CssClass="form-control" Text='<%# Eval("CreatedBy")%>'></asp:TextBox>
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




     <div class="col-md-6">
      <div class="card">
  <div class="card-header">
   ADD NEW Student
  </div>

  <div class="card-body alert-primary">
  <!----Show Profile---->
    <div class="row">
       <div class="col-sm-6">
           <div class="form-group">
                <label>Student Name </label>
                <asp:TextBox ID="txtStudentName" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

       <div class="col-sm-6">
           <div class="form-group">
                <label>Class </label>
                 <asp:DropDownList ID="ddlsClass" CssClass="form-control" runat="server">
       </asp:DropDownList> 
           </div>
       </div>

       <div class="col-sm-6">
           <div class="form-group">
                <label> Email</label>
                <asp:TextBox ID="txtSEmail" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

       <div class="col-sm-6">
           <div class="form-group">
                <label> Address</label>
                <asp:TextBox ID="txtSAddress" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

     <div class="col-sm-12">
           <div class="form-group">
               <asp:Button ID="btnAddStudent" CssClass="btn btn-block btn-primary" 
                   runat="server" Text="Add Student" onclick="btnAddStudent_Click" />
           </div>
       </div>
    </div>
    <!----->
  
  </div>

<div class="card-footer bg-transparent border-success">
<div class="row">
     <div class="table table-responsive">

     <asp:TextBox ID="txtFilterGrid1Record2" CssClass="form-control" runat="server" placeholder="Search...." onkeyup="Search_Gridview2(this)"></asp:TextBox>
<br />
         <asp:GridView ID="GridView2" CssClass="table table-bordered table-sm table-hover" runat="server"
                                        DataKeyNames="ID" AutoGenerateColumns="false" OnRowEditing="GridView2_RowEditing"
                                        OnRowDataBound="GridView2_RowDataBound" OnRowUpdating="GridView2_RowUpdating"
                                        OnRowCancelingEdit="GridView2_RowCancelingEdit" OnPageIndexChanging="GridView2_PageIndexChanging"
                                        OnRowDeleting="GridView2_RowDeleting"  CaptionAlign="Top"  ShowFooter="true" AllowPaging="true" PageSize="10" EmptyDataText="Record Not Found...">
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblID" runat="server" CssClass="form-control" Text='<%# Eval("ID")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblEditID" runat="server" CssClass="form-control" Text='<%# Eval("ID")%>' Visible="false"></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText="StudentName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGVStudentName" runat="server" CssClass="form-control" Text='<%# Eval("StudentName")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGVEditStudentName" runat="server" CssClass="form-control" Text='<%# Eval("StudentName")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Class">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV2child_nameclass" runat="server" CssClass="form-control" Text='<%# Eval("Class")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>                                           

                                            <asp:Label ID="lblGVEditclassid" runat="server" CssClass="form-control" Text='<%# Eval("ClassID")%>' Visible="false"></asp:Label>
                                            <asp:DropDownList ID="ddlGV2class" runat="server">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGVemail" runat="server" CssClass="form-control" Text='<%# Eval("email")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGVEditemail" runat="server" CssClass="form-control" Text='<%# Eval("email")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                            
                                            <asp:TemplateField HeaderText="Addresss">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGVAddresss" runat="server" CssClass="form-control" Text='<%# Eval("Addresss")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGVEditAddresss" runat="server" CssClass="form-control" Text='<%# Eval("Addresss")%>'></asp:TextBox>
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


    
    </div>
  </div>

<div class="card-footer bg-transparent border-success"></div>
</div>

 <script type="text/javascript">
     function Search_Gridview(strKey) {
         var strData = strKey.value.toLowerCase().split(" ");
         var tblData = document.getElementById("<%=GridView1.ClientID %>");
         var rowData;
         for (var i = 1; i < tblData.rows.length; i++) {
             rowData = tblData.rows[i].innerHTML;
             var styleDisplay = 'none';
             for (var j = 0; j < strData.length; j++) {
                 if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                     styleDisplay = '';
                 else {
                     styleDisplay = 'none';
                     break;
                 }
             }
             tblData.rows[i].style.display = styleDisplay;
         }
     }  
        </script>




         <script type="text/javascript">
             function Search_Gridview2(strKey) {
                 var strData2 = strKey.value.toLowerCase().split(" ");
                 var tblData2 = document.getElementById("<%=GridView1.ClientID %>");
                 var rowData2;
                 for (var i = 1; i < tblData2.rows.length; i++) {
                     rowData2 = tblData2.rows[i].innerHTML;
                     var styleDisplay2 = 'none';
                     for (var j = 0; j < strData2.length; j++) {
                         if (rowData2.toLowerCase().indexOf(strData2[j]) >= 0)
                             styleDisplay2 = '';
                         else {
                             styleDisplay2 = 'none';
                             break;
                         }
                     }
                     tblData2.rows[i].style.display = styleDisplay2;
                 }
             }  
        </script>


</asp:Content>

