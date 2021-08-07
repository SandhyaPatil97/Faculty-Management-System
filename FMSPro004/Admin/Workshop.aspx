<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Workshop.aspx.cs" Inherits="Admin_Workshop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link rel="icon" href="assets/img/favicon.png" />

<title>workshop</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="card">
  <div class="card-header">
    <h5 class="card-title">Workshop Details</h5>
     <table class="table">
    <tr>
    <td>        </td> 
    <td>    <asp:LinkButton ID="LinkButton2" CssClass="btn btn-outline-danger" 
            runat="server" onclick="LinkButton2_Click">Attended</asp:LinkButton></td>
    <td>   <asp:LinkButton ID="LinkButton3" CssClass="btn btn-outline-danger" 
            runat="server" onclick="LinkButton3_Click">Conducted</asp:LinkButton></td>
    <td>        </td>
    
    </tr>
    </table>
  </div>

  <div class="card-body">
    
    <p class="card-text"></p>
    



     <!----Addtended workshop---->
    <div class="row" id="pnl1" runat="server" style="border:2px double black; padding:5px">
     <div style="width:100%; text-align:center; border-bottom:2px solid red"><h5>Add New Attended Workshop </h5></div> 

       <div class="col-sm-2">
           <div class="form-group">
                <label>Name of Faculty </label>
                <asp:TextBox ID="txtNameofFaculty" CssClass="form-control" runat="server" required="required"></asp:TextBox>
           </div>
          
       </div>

       <div class="col-sm-2">
           <div class="form-group">
                <label>Title of Workshop </label>
                <asp:TextBox ID="txtTitleofworkshop" CssClass="form-control" runat="server" required="required"></asp:TextBox>
           </div>
          
       </div>

       <div class="col-sm-2">
           <div class="form-group">
                <label>Organized by </label>
                <asp:TextBox ID="txtOrganizedby" CssClass="form-control" runat="server" required="required"></asp:TextBox>
           </div>
       </div>

       <div class="col-sm-2">
           <div class="form-group">
                <label>Date </label>
                <asp:TextBox ID="txtDate" CssClass="form-control" runat="server" TextMode="Date" required="required"></asp:TextBox> <%----%>
           </div>
       </div>

       <div class="col-sm-2">
           <div class="form-group">
                <label>No. Of Days </label>
                <asp:TextBox ID="txtNoofdays" CssClass="form-control" runat="server" required="required"></asp:TextBox>
           </div>
       </div>

       <div class="col-sm-2">
           <div class="form-group">
                <label>Level </label>
                <asp:TextBox ID="txtLevel" CssClass="form-control" runat="server" required="required"></asp:TextBox>
           </div>
       </div>
	   <div class="col-sm-4">
       </div>
       <div class="col-sm-4">
           <div class="form-group">
               <asp:Button ID="btnAttended" CssClass="form-control btn btn-success btn-block" 
                   runat="server" Text="INSERT " onclick="btnAttended_Click" />
           </div>
       </div>
    
    </div>
    <!----->
	
       <!----conducted workshop---->
    <div class="row" id="pnl2" runat="server" style="border:2px double black; padding:5px">
     <div style="width:100%; text-align:center; border-bottom:2px solid red"><h5>Add New Conducted Workshop </h5></div> 

       <div class="col-sm-2">
           <div class="form-group">
                <label>Name of Faculty </label>
                <asp:TextBox ID="txtConNamofFaculty" CssClass="form-control" runat="server" required="required"></asp:TextBox>
           </div>
          
       </div>

       <div class="col-sm-2">
           <div class="form-group">
                <label>Title of Workshop </label>
                <asp:TextBox ID="txtContitleofworkshop" CssClass="form-control" runat="server" required="required"></asp:TextBox>
           </div>
          
       </div>

       <div class="col-sm-2">
           <div class="form-group">
                <label>Organized by </label>
                <asp:TextBox ID="txtConOrganizeby" CssClass="form-control" runat="server" required="required"></asp:TextBox>
           </div>
       </div>

       <div class="col-sm-2">
           <div class="form-group">
                <label>Date </label>
                <asp:TextBox ID="txtConDate" CssClass="form-control" runat="server" TextMode="Date"  required="required"></asp:TextBox> <%----%>
           </div>
       </div>

       <div class="col-sm-2">
           <div class="form-group">
                <label>No. Of Days </label>
                <asp:TextBox ID="txtConNoofdays" CssClass="form-control" runat="server" required="required"></asp:TextBox>
           </div>
       </div>

       <div class="col-sm-2">
           <div class="form-group">
                <label>Level </label>
                <asp:TextBox ID="txtConLevel" CssClass="form-control" runat="server" required="required"></asp:TextBox>
           </div>
       </div>
	   <div class="col-sm-4">
       </div>
       <div class="col-sm-4">
           <div class="form-group">
               <asp:Button ID="btnConducted" CssClass=" form-control btn btn-warning btn-block" 
                   runat="server" Text="INSERT " onclick="btnConducted_Click" />
           </div>
       </div>
    
    </div>
    <!----->


    <!----show attend workshop---->
    <div class="row" id="pnl3" runat="server" style="border:2px double black; padding:5px">
     <div style="width:100%; text-align:center; border-bottom:2px solid red"><h5> Workshop Details</h5></div> 

       <div class="col-sm-12">
           <div class="form-group">
                <div class="table table-responsive">
					<br/>
                <asp:TextBox ID="txtFilterGrid1Record" CssClass="form-control" runat="server" placeholder="Search...."  onkeyup="Search_Gridview(this)" ></asp:TextBox> <%----%>
                 <br />
            <asp:GridView ID="GridView1" CssClass="table table-bordered table-sm table-hover" runat="server"
                                        DataKeyNames="ID" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing"
                                        OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating"
                                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnPageIndexChanging="GridView1_PageIndexChanging"
                                        OnRowDeleting="GridView1_RowDeleting"  CaptionAlign="Top" ShowFooter="true" AllowPaging="true" PageSize="10" EmptyDataText="Record Not Found...">
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblID" runat="server" CssClass="form-control" Text='<%# Eval("ID")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblEditID" runat="server" CssClass="form-control" Text='<%# Eval("ID")%>' Visible="false"></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                                <asp:TemplateField HeaderText="FacultyName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1facultyName" runat="server" CssClass="form-control" Text='<%# Eval("NameOfFaculty")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGV1EditFacultyName" runat="server" CssClass="form-control" Text='<%# Eval("NameOfFaculty")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Workshop Title">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1Wtitle" runat="server" CssClass="form-control" Text='<%# Eval("TitleOfWorkshop")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGV1EditWTitle" runat="server" CssClass="form-control" Text='<%# Eval("TitleOfWorkshop")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                            <asp:TemplateField HeaderText="OrganizedBy">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGV1OrganizedBy"  runat="server" CssClass="form-control" Text='<%# Eval("OrganizedBy")%>' ></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>                                                    
                                                    <asp:TextBox ID="txtGV1EditOrganizedBy" runat="server" CssClass="form-control" Text='<%# Eval("OrganizedBy")%>' ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1WDate" runat="server" CssClass="form-control" Text='<%# Eval("WSDate")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGV1EditWDate" runat="server" CssClass="form-control" Text='<%# Eval("WSDate")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="NoOfDays">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1WNoOfDays" runat="server" CssClass="form-control" Text='<%# Eval("NoOfDays")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGV1EditWNoOfDays" runat="server" CssClass="form-control" Text='<%# Eval("NoOfDays")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="WSLevel">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1WSLevel" runat="server" CssClass="form-control" Text='<%# Eval("WSLevel")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>                                           
                                            <asp:TextBox ID="txtGV1EditWSLevel" runat="server" CssClass="form-control" Text='<%# Eval("WSLevel")%>' ></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Workshop Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGV1WSType" runat="server" CssClass="form-control" Text='<%# Eval("WSType")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>                                           
                                            <asp:Label ID="lblGV1EditWSType" runat="server" CssClass="form-control" Text='<%# Eval("WSType")%>'></asp:Label>
                                            <asp:DropDownList ID="ddlWtype" runat="server">
                                               <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                <asp:ListItem Text="Attended" Value="Attended"></asp:ListItem>
                                                 <asp:ListItem Text="Conducted" Value="Conducted"></asp:ListItem>
                                            </asp:DropDownList>
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
</asp:Content>

