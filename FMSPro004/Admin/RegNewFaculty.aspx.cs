using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_RegNewFaculty : System.Web.UI.Page
{
    string strEmail = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!this.IsPostBack)
        {
            BindFacultyRecord();
        }
    }
    public string GetConnectionString()
    {
        return System.Configuration.ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
    }


    protected void btnlogin_Click(object sender, EventArgs e)
    {
        if (txtUserName1.Text != string.Empty && txtEmail1.Text != string.Empty && txtPassword1.Text != string.Empty && txtCity.Text != string.Empty && txtDist.Text != string.Empty && ddlSecQues.SelectedValue != string.Empty && ddlSecQues.SelectedValue != "Select Option" && txtquesAns.Text != string.Empty)
        {
            strEmail = txtEmail1.Text;
            if (txtPassword1.Text != string.Empty)
            {
                if (txtConfirmpass.Text != txtPassword1.Text)
                {
                    txtPassword1.Text = string.Empty;
                    txtConfirmpass.Text = string.Empty;
                    Response.Write("<script>alert('Password not match...');</script>");
                    txtPassword1.Focus();
                }
                else
                {
                    if (CheckUserName())
                    {
                        string astatus = "Active";
                        using (SqlConnection connection = new SqlConnection(GetConnectionString()))
                        {

                            using (SqlCommand cmd = new SqlCommand("spSignup", connection))
                            {
                                connection.Open();
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@Name", txtUserName1.Text);
                                cmd.Parameters.AddWithValue("@Email", txtEmail1.Text);
                                cmd.Parameters.AddWithValue("@Pass", txtPassword1.Text);
                                cmd.Parameters.AddWithValue("@city", txtCity.Text);
                                cmd.Parameters.AddWithValue("@dist", txtDist.Text);
                                cmd.Parameters.AddWithValue("@status", astatus);
                                cmd.Parameters.AddWithValue("@que", ddlSecQues.SelectedValue);
                                cmd.Parameters.AddWithValue("@ans", txtquesAns.Text);
                                cmd.ExecuteNonQuery();

                            }
                            addRecordIntoAdmintable();
                            clr();
                            Response.Redirect("Home.aspx");
                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('Email Already Exist try another')</script>");
                        txtEmail1.Text = string.Empty;
                        txtEmail1.Focus();
                    }
                }

            }



        }
        else
        {
            Response.Write("<script>alert('Enter Required data')</script>");
        }

    }

    private void addRecordIntoAdmintable()
    {
        if (RecordExist())
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            using (SqlCommand cmd = new SqlCommand("spInserAdmin", con))
            {
                if (con.State == ConnectionState.Closed) { con.Open(); }
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", txtUserName1.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail1.Text);
                cmd.Parameters.AddWithValue("@Pass", txtPassword1.Text);
                cmd.Parameters.AddWithValue("@RoleID", Convert.ToInt32(2));
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        else
        {

        }

    }

    private bool RecordExist()
    {
        bool aa = false;

        using (SqlConnection conn = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand("CheckUserAvailabilityForAdmin", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Email", txtEmail1.Text);
                conn.Open();
                aa = Convert.ToBoolean(cmd.ExecuteScalar());
                conn.Close();
            }
        }
        return aa;
    }

    private bool CheckUserName()
    {
        bool status = false;

        using (SqlConnection conn = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand("CheckUserAvailability", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Email", txtEmail1.Text);
                conn.Open();
                status = Convert.ToBoolean(cmd.ExecuteScalar());
                conn.Close();
            }
        }
        return status;
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    private void clr()
    {
        txtEmail1.Text = string.Empty;
        txtPassword1.Text = string.Empty;
        txtConfirmpass.Text = string.Empty;
        txtCity.Text = string.Empty;
        txtDist.Text = string.Empty;
        txtquesAns.Text = string.Empty;
        ddlSecQues.SelectedIndex = -1;
        txtUserName1.Focus();
    }

    private void BindFacultyRecord()
    {
        string qr = "select USER_ID ,user_name as Faculty,email as Email,password,city as City,Dist as Distt,status ,question as Question, Ans from tblUser";
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand(qr,con);
        con.Open();
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


    //-------------------gridview start---

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindFacultyRecord();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
        {
            TextBox ddlWID = (TextBox)e.Row.FindControl("txtGV1EditFacultyName");
            ddlWID.Focus();
           

        }

        //----------Confirm Delete after delete button click event---
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[0].Text;
            foreach (Button button in e.Row.Cells[10].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete Faculty " + e.Row.Cells[0].Text + "?')){ return false; };";
                }
            }
        }
        //-----------------End

    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        //-------------Update record start--

        Label id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblEditID"));
        int id2 = Convert.ToInt32(id.Text);
        TextBox txtupFN = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditFacultyName");
        TextBox txtupEmail = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditEmail");
        TextBox txtuppwd = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1Editpassword");
        TextBox txtuCity = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditCity");
        TextBox txtupDistt = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditDistt");
        TextBox txtupwStatus = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1Editstatus");

        TextBox txtupwQues = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditQuestion");
        TextBox txtupAns = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditAns");
        DropDownList ddlupwtype = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlWtype");

        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd1 = new SqlCommand("Update tblUser set user_name=@d1,email=@d2,password=@d3,city=@d4,Dist=@d5,status=@d6,question=@d7,Ans=@d8 where user_id=@ID", con);
        cmd1.Connection = con;
        cmd1.CommandType = CommandType.Text;
        if (con.State == ConnectionState.Closed)
        {
            cmd1.Connection.Open();
        }
        cmd1.Parameters.AddWithValue("@d1", txtupFN.Text);
        cmd1.Parameters.AddWithValue("@d2", txtupEmail.Text);
        cmd1.Parameters.AddWithValue("@d3", txtuppwd.Text);
        cmd1.Parameters.AddWithValue("@d4", txtuCity.Text);
        cmd1.Parameters.AddWithValue("@d5", txtupDistt.Text);
        cmd1.Parameters.AddWithValue("@d6", txtupwStatus.Text);
        cmd1.Parameters.AddWithValue("@d7", txtupwQues.Text);
        cmd1.Parameters.AddWithValue("@d8", txtupAns.Text);

        cmd1.Parameters.AddWithValue("@ID", id2);
        cmd1.ExecuteNonQuery();
        cmd1.Connection.Close();
        GridView1.EditIndex = -1;
        BindFacultyRecord();

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

        SqlCommand cmd = new SqlCommand("delete from tblUser where user_id=@ID", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@ID", IIDD);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.EditIndex = -1;
        BindFacultyRecord();

    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindFacultyRecord();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.PageIndex = e.NewPageIndex;
        BindFacultyRecord();
    }


    //---------------gridview ending-------------------
}