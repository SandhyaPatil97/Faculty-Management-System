using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Faculty_Payroll : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserType"].ToString() == "Faculty")
        {
            if (!IsPostBack)
            {

                ddlMemberID.DataSource = GetData("spgetMemberIDname", null);
                ddlMemberID.DataTextField = "Membername";
                ddlMemberID.DataValueField = "ID";
                ddlMemberID.DataBind();

                ListItem ddlw = new ListItem("Select Option", "-1");
                ddlMemberID.Items.Insert(0, ddlw);

                BindGridview();
            }
        }
    }
    private DataSet GetData(string spname, SqlParameter spParameter)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlDataAdapter adp = new SqlDataAdapter(spname, con);
        adp.SelectCommand.CommandType = CommandType.StoredProcedure;
        if (spParameter != null)
        {
            adp.SelectCommand.Parameters.Add(spParameter);
        }
        DataSet ds = new DataSet();
        adp.Fill(ds);
        return ds;
    }
    private Boolean InsertUpdateData(SqlCommand cmd)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");

            return false;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    public string GetConnectionString()
    {
        return System.Configuration.ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
    }

    private void BindGridview()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlCommand cmd = new SqlCommand("select t1.ID,t1.MemberID,t1.MonthofPay,t2.Membername,t1.YearofPay,t1.Salary,t1.Deduction,t1.TotSalary,t1.PaymentDate,t1.SalSatatus from tblPayroll as t1 inner join tblMember as t2 on t1.MemberID=t2.ID where t2.Email=@C and t1.MemberID = t2.ID ", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@C", Session["UserEmail"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }



    protected void btnPay_Click(object sender, EventArgs e)
    {
        if(ddlMemberID.SelectedIndex!=-1 && txtSalary.Text!=string.Empty && txtTotSalary.Text!=string.Empty)
        {
            SqlCommand cmd = new SqlCommand("insert into tblPayroll(MemberID,MonthofPay,YearofPay,Salary,Deduction,TotSalary,PaymentDate,SalSatatus,createdBy) values(@MemberID,@MonthofPay,@YearofPay,@Salary,@Deduction,@TotSalary,@PaymentDate,@SalSatatus,@createdBy)");
            cmd.Parameters.AddWithValue("@MemberID",ddlMemberID.SelectedValue);
             cmd.Parameters.AddWithValue("@MonthofPay",ddlmonth.SelectedItem.Text);
             cmd.Parameters.AddWithValue("@YearofPay",txtYear.Text);
             cmd.Parameters.AddWithValue("@Salary",Convert.ToDouble(txtSalary.Text));
             cmd.Parameters.AddWithValue("@Deduction",Convert.ToDouble(txtDeduction.Text));
             cmd.Parameters.AddWithValue("@TotSalary",Convert.ToDouble(txtTotSalary.Text));
            cmd.Parameters.AddWithValue("@PaymentDate",Convert.ToDateTime(txtPayDate.Text));
             cmd.Parameters.AddWithValue("@SalSatatus","Paid");
             cmd.Parameters.AddWithValue("@createdBy",Session["UserEmail"].ToString());
            InsertUpdateData(cmd);
            BindGridview();
            txtTotSalary.Text=string.Empty;
            txtDeduction.Text=string.Empty;
            ddlMemberID.SelectedIndex=-1;
            txtPayDate.Text=string.Empty;txtSalary.Text=string.Empty;
            txtTotSalary.Text=string.Empty;
            txtYear.Text=string.Empty;
            ddlmonth.SelectedIndex=0;

        }
    }
    protected void txtDeduction_TextChanged(object sender, EventArgs e)
    {
        double a = Convert.ToDouble(txtSalary.Text);
        double b = Convert.ToDouble(txtDeduction.Text);
        txtTotSalary.Text = "" + (a - b);
    }
    protected void ddlMemberID_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("select top 1 ID,Salary from tblMember where ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", ddlMemberID.SelectedValue);
               
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                da.Fill(ds, "dt");
                con.Close();
                if (ds.Tables[0].Rows.Count > 0)
                {
                   txtSalary.Text= ds.Tables[0].Rows[0]["Salary"].ToString();                   

                }
                else
                {
                    txtSalary.Text = "0";
                }
                
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }



    //-------------------gridview Member start-------------------


    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGridview();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
        {
        //     DropDownList ddlupddlGV1MemberName = (DropDownList)e.Row.FindControl("ddlGV1MemberName");

        //     //---------------------------------------------- 

        //     ddlupddlGV1MemberName.DataSource = GetData("spgetMemberIDname", null);
        //     ddlupddlGV1MemberName.DataTextField = "Membername";
        //     ddlupddlGV1MemberName.DataValueField = "ID";
        //     ddlupddlGV1MemberName.DataBind();

        //     ListItem ddlw = new ListItem("Select Option", "-1");
        //     ddlupddlGV1MemberName.Items.Insert(0, ddlw);
        //     Label ddlWID = (Label)e.Row.FindControl("lblGVEditMemberNameID");
        //     ddlupddlGV1MemberName.SelectedValue = ddlWID.Text;


        //     DropDownList ddlGV1MonthofPay1 = (DropDownList)e.Row.FindControl("ddlGV1MonthofPay");
        //     Label ddlWID2 = (Label)e.Row.FindControl("lblGVEditMonthofPay");
        //     ddlGV1MonthofPay1.SelectedValue = ddlWID2.Text;

        // }

        // //----------Confirm Delete after delete button click event---
        // if (e.Row.RowType == DataControlRowType.DataRow)
        // {
        //     string item = e.Row.Cells[0].Text;
        //     foreach (Button button in e.Row.Cells[10].Controls.OfType<Button>())
        //     {
        //         if (button.CommandName == "Delete")
        //         {
        //             button.Attributes["onclick"] = "if(!confirm('Do you want to delete Payrolls " + e.Row.Cells[0].Text + "?')){ return false; };";
        //         }
        //     }
        }
        // //-----------------End

    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {


        Label id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblEditID"));
        int id2 = Convert.ToInt32(id.Text);
        TextBox lblupYearofpay = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditSYearofPay");
        TextBox txtupsalary = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditSSalary");

        TextBox txtupdeduction = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditDeduction");
        TextBox txtuppaydate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditPaymentDate");

        TextBox txtupPaystatus = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditSalSatatus");

        TextBox txtupTotSalary = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditTotSalary");
        DropDownList ddlupMember = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlGV1MemberName");
        DropDownList ddlupMonthofPay = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlGV1MonthofPay");
       
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd1 = new SqlCommand(" update tblPayroll set MemberID=@MemberID,MonthofPay=@MonthofPay,YearofPay=@YearofPay,Salary=@Salary,Deduction=@Deduction,TotSalary=@TotSalary ,PaymentDate=@PaymentDate,SalSatatus=@SalSatatus where ID=@ID", con);
        cmd1.Connection = con;
        cmd1.CommandType = CommandType.StoredProcedure;
        if (con.State == ConnectionState.Closed)
        {
            cmd1.Connection.Open();
        }

       
        cmd1.Parameters.AddWithValue("@MemberID", ddlupMember.SelectedValue);
        cmd1.Parameters.AddWithValue("@MonthofPay", ddlupMonthofPay.Text);
        cmd1.Parameters.AddWithValue("@YearofPay", lblupYearofpay.Text);
        cmd1.Parameters.AddWithValue("@Salary", Convert.ToDouble(txtupsalary.Text));
        cmd1.Parameters.AddWithValue("@Deduction", Convert.ToDouble(txtupdeduction.Text));
        cmd1.Parameters.AddWithValue("@TotSalary", Convert.ToDouble(txtupTotSalary.Text));

        cmd1.Parameters.AddWithValue("@PaymentDate", Convert.ToDateTime(txtuppaydate.Text));
        cmd1.Parameters.AddWithValue("@SalSatatus", txtupPaystatus.Text);




        cmd1.Parameters.AddWithValue("@ID", id2);
        cmd1.ExecuteNonQuery();
        cmd1.Connection.Close();
        GridView1.EditIndex = -1;
        BindGridview();

        //-----------update End--

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //--Delete Selected Row
        //Label id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblEditID"));
        //int id2 = Convert.ToInt32(id.Text);
        int IIDD = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        SqlConnection con = new SqlConnection(GetConnectionString());
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        SqlCommand cmd = new SqlCommand("delete from tblPayroll where ID=@ID ", con);
        cmd.CommandType = CommandType.Text; ;
        cmd.Parameters.AddWithValue("@ID", IIDD);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.EditIndex = -1;
        BindGridview();

    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGridview();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.PageIndex = e.NewPageIndex;
        BindGridview();
    }


    //---------------gridview ending------------------------------------------------
}