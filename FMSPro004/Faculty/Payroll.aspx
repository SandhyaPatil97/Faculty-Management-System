<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacultyMasterPage.master"
    AutoEventWireup="true" CodeFile="Payroll.aspx.cs" Inherits="Faculty_Payroll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>payroll </title>
<link rel="icon" href="assets/img/favicon.png" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card">
        <div class="card-header">
            Payroll Statement
        </div>
        <!-- <div class="card-body"> -->
            <!----Show Profile---->
            <!-- <div class="row">
                <div class="col-sm-2">
                    <div class="form-group">
                        <label>
                            MemberName
                        </label>
                        <asp:DropDownList ID="ddlMemberID" CssClass=" form-control" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlMemberID_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-sm-2">
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
                <div class="col-sm-2">
                    <div class="form-group">
                        <label>
                            Year
                        </label>
                        <asp:TextBox ID="txtYear" CssClass=" form-control" runat="server" TextMode="Number" ></asp:TextBox> <%----%>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <label>
                            Salary
                        </label>
                        <asp:TextBox ID="txtSalary" CssClass=" form-control" runat="server"   ReadOnly="true" TextMode="Number"></asp:TextBox> <%----%>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <label>
                            Deduction
                        </label>
                        <asp:TextBox ID="txtDeduction" CssClass=" form-control" runat="server" AutoPostBack="true" TextMode="Number"
                             OnTextChanged="txtDeduction_TextChanged"></asp:TextBox>  <%----%>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <label>
                            TotSalary
                        </label>
                        <asp:TextBox ID="txtTotSalary" CssClass=" form-control" runat="server" TextMode="Number" ></asp:TextBox> <%--TextMode="Number"--%>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <label>
                            Payment Date
                        </label>
                        <asp:TextBox ID="txtPayDate" CssClass=" form-control" runat="server" TextMode="Date"></asp:TextBox>  <%----%>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <div class="form-group">
                        <asp:Button ID="btnPay" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnPay_Click" />
                    </div>
                </div>
            </div> -->
            <!----->
        <!-- </div> -->
        <div class="card-footer bg-transparent border-success">
            <div class="row">
                <div class="table">
                    <asp:GridView ID="GridView1" CssClass="table table-bordered table-sm table-hover"
                        runat="server" DataKeyNames="ID" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing"
                        OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowDeleting="GridView1_RowDeleting" CaptionAlign="Top"
                        ShowFooter="true" AllowPaging="true" PageSize="10" EmptyDataText="Record Not Found...">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblID" CssClass=" form-control"  runat="server" Text='<%# Eval("ID")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblEditID"  CssClass=" form-control" runat="server" Text='<%# Eval("ID")%>' Visible="false"></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="MemberName">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1MemberName"  CssClass=" form-control" runat="server" Text='<%# Eval("Membername")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblGVEditMemberNameID"  CssClass=" form-control" runat="server" Text='<%# Eval("MemberID")%>'
                                        Visible="false"></asp:Label>
                                    <asp:DropDownList ID="ddlGV1MemberName"  CssClass=" form-control" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="YearofPay">
                                <ItemTemplate>
                                    <asp:Label ID="lblGVYearofPay"  CssClass=" form-control" runat="server" Text='<%# Eval("YearofPay")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGVEditSYearofPay" CssClass=" form-control"  runat="server" Text='<%# Eval("YearofPay")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PayMonth">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1MonthofPay"  CssClass=" form-control" runat="server" Text='<%# Eval("MonthofPay")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblGVEditMonthofPay"  CssClass=" form-control" runat="server" Text='<%# Eval("MonthofPay")%>'
                                        Visible="false"></asp:Label>
                                    <asp:DropDownList ID="ddlGV1MonthofPay" CssClass=" form-control"  runat="server">
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
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Salary">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1Salary"  CssClass=" form-control" runat="server" Text='<%# Eval("Salary")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGVEditSSalary"  CssClass=" form-control" runat="server" Text='<%# Eval("Salary")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Deduction">
                                <ItemTemplate>
                                    <asp:Label ID="lblGVDeduction"  CssClass=" form-control" runat="server" Text='<%# Eval("Deduction")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGVEditDeduction" CssClass=" form-control"  runat="server" Text='<%# Eval("Deduction")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NetSalary">
                                <ItemTemplate>
                                    <asp:Label ID="lblGVTotSalary"  CssClass=" form-control" runat="server" Text='<%# Eval("TotSalary")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGVEditTotSalary"  CssClass=" form-control" runat="server" Text='<%# Eval("TotSalary")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PaymentDate">
                                <ItemTemplate>
                                    <asp:Label ID="lblGVPaymentDate" CssClass=" form-control"  runat="server" Text='<%# Eval("PaymentDate")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGVEditPaymentDate" CssClass=" form-control"  runat="server" Text='<%# Eval("PaymentDate","{0:yyyy-MM-dd}")%>' TextMode="Date"></asp:TextBox>  <%----%>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblGVSalSatatus" CssClass=" form-control"  runat="server" Text='<%# Eval("SalSatatus")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGVEditSalSatatus"  CssClass=" form-control" runat="server" Text='<%# Eval("SalSatatus")%>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
