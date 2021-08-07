<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Payroll.aspx.cs" Inherits="Admin_Payroll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>payroll </title>
<link rel="icon" href="assets/img/favicon.png" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="card">
        <div class="card-header">
            Payroll
        </div>
        <div class="card-body">
            <!----Show Profile---->
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>
                            MemberName
                        </label>
                        <asp:DropDownList ID="ddlMemberID" CssClass=" form-control" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlMemberID_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>
                            Month
                        </label>
                        <asp:DropDownList ID="ddlmonth" CssClass=" form-control" runat="server">
                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                            <asp:ListItem Text="January " Value="1"></asp:ListItem>
                            <asp:ListItem Text="February" Value="2"></asp:ListItem>
                            <asp:ListItem Text="March " Value="3"></asp:ListItem>
                            <asp:ListItem Text="April" Value="4"></asp:ListItem>
                            <asp:ListItem Text="May " Value="5"></asp:ListItem>
                            <asp:ListItem Text="June " Value="6"></asp:ListItem>
                            <asp:ListItem Text="July" Value="7"></asp:ListItem>
                            <asp:ListItem Text="August" Value="8"></asp:ListItem>
                            <asp:ListItem Text="September" Value="9"></asp:ListItem>
                            <asp:ListItem Text="October" Value="10"></asp:ListItem>
                            <asp:ListItem Text="November" Value="11"></asp:ListItem>
                            <asp:ListItem Text="December" Value="12"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>
                            Year
                        </label>
                        <asp:TextBox ID="txtYear" CssClass=" form-control" runat="server" TextMode="Number" required="required"></asp:TextBox><%-- --%>
                    </div>
                </div>
            </div>
			<div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>
                            Salary
                        </label>
                        <asp:TextBox ID="txtSalary" CssClass=" form-control" runat="server" 
                            ReadOnly="true" TextMode="Number" required="required"></asp:TextBox> <%--"--%>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>
                            Deduction
                        </label>
                        <asp:TextBox ID="txtDeduction" CssClass=" form-control" runat="server" AutoPostBack="true"
                             OnTextChanged="txtDeduction_TextChanged" TextMode="Number" required="required"></asp:TextBox> <%----%>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>
                            TotSalary
                        </label>
                        <asp:TextBox ID="txtTotSalary" CssClass=" form-control" runat="server" TextMode="Number" required="required"></asp:TextBox> <%----%>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>
                            Payment Date
                        </label>
                        <asp:TextBox ID="txtPayDate" CssClass=" form-control" runat="server" TextMode="Date" required="required"></asp:TextBox> <%----%>
                    </div>
                </div>
			</div>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <asp:Button ID="btnPay" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnPay_Click" />
                    </div>
                </div>
            </div>
            <!----->
        </div>
        <div class="card-footer bg-transparent border-success">
            <div class="row">
                <div class="table table-responsive">
                <asp:TextBox ID="txtFilterGrid1Record" CssClass="form-control" runat="server" placeholder="Search...." onkeyup="Search_Gridview(this)" ></asp:TextBox> <%----%>
                <br />
                    <asp:GridView ID="GridView1" CssClass="table table-bordered table-sm table-hover"
                        runat="server" DataKeyNames="ID" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing"
                        OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowDeleting="GridView1_RowDeleting" CaptionAlign="Top"
                        ShowFooter="true" AllowPaging="true" PageSize="10" EmptyDataText="Record Not Found...">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblID" runat="server"  CssClass=" form-control" Text='<%# Eval("ID")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblEditID" runat="server" readonly CssClass=" form-control" Text='<%# Eval("ID")%>' Visible="false"></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="MemberName">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1MemberName"  CssClass=" form-control" runat="server" Text='<%# Eval("Membername")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblGVEditMemberNameID" CssClass=" form-control"  runat="server" Text='<%# Eval("MemberID")%>'
                                        Visible="false"></asp:Label>
                                    <asp:DropDownList ID="ddlGV1MemberName" readonly CssClass=" form-control"  runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="YearofPay">
                                <ItemTemplate>
                                    <asp:Label ID="lblGVYearofPay" runat="server"  CssClass=" form-control" Text='<%# Eval("YearofPay")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGVEditSYearofPay" readonly runat="server" CssClass=" form-control"  Text='<%# Eval("YearofPay")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PayMonth">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1MonthofPay" runat="server" CssClass=" form-control"  Text='<%# Eval("MonthofPay")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblGVEditMonthofPay" runat="server" readonly CssClass=" form-control" Text='<%# Eval("MonthofPay")%>'
                                        Visible="false"></asp:Label>
                                    <asp:DropDownList ID="ddlGV1MonthofPay"  CssClass=" form-control" readonly runat="server">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="January " Value="January"></asp:ListItem>
                                        <asp:ListItem Text="February" Value="February"></asp:ListItem>
                                        <asp:ListItem Text="March" Value="March"></asp:ListItem>
                                        <asp:ListItem Text="April" Value="April"></asp:ListItem>
                                        <asp:ListItem Text="May" Value="May"></asp:ListItem>
                                        <asp:ListItem Text="June" Value="June"></asp:ListItem>
                                        <asp:ListItem Text="July" Value="July"></asp:ListItem>
                                        <asp:ListItem Text="August" Value="August"></asp:ListItem>
                                        <asp:ListItem Text="September" Value="September"></asp:ListItem>
                                        <asp:ListItem Text="October" Value="October"></asp:ListItem>
                                        <asp:ListItem Text="November" Value="November"></asp:ListItem>
                                        <asp:ListItem Text="December" Value="December"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Salary">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1Salary" runat="server" CssClass=" form-control"  Text='<%# Eval("Salary")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGVEditSSalary" readonly runat="server" CssClass=" form-control"  Text='<%# Eval("Salary")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Deduction">
                                <ItemTemplate>
                                    <asp:Label ID="lblGVDeduction" runat="server" CssClass=" form-control"  Text='<%# Eval("Deduction")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGVEditDeduction" readonly runat="server"  CssClass=" form-control" Text='<%# Eval("Deduction")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NetSalary">
                                <ItemTemplate>
                                    <asp:Label ID="lblGVTotSalary" runat="server" CssClass=" form-control"  Text='<%# Eval("TotSalary")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGVEditTotSalary" readonly runat="server" CssClass=" form-control"  Text='<%# Eval("TotSalary")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PaymentDate">
                                <ItemTemplate>
                                    <asp:Label ID="lblGVPaymentDate" runat="server" CssClass=" form-control"  Text='<%# Eval("PaymentDate")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGVEditPaymentDate" runat="server" TextMode="Date"  CssClass=" form-control" Text='<%# Eval("PaymentDate","{0:yyyy-MM-dd}")%>'></asp:TextBox>  <%----%>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblGVSalSatatus" runat="server"  CssClass=" form-control" Text='<%# Eval("SalSatatus")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGVEditSalSatatus" runat="server" CssClass=" form-control"  Text='<%# Eval("SalSatatus")%>'></asp:TextBox>
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

