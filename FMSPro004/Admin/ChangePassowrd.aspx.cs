using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_ChangePassowrd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserType"].ToString() == "Admin")
        {
            if (!IsPostBack)
            {
                BindGrid();

            }
        }
    }


    public string GetConnectionString()
    {
        return System.Configuration.ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
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
    private DataTable GetData(SqlCommand cmd)
    {
        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            if (con.State == ConnectionState.Closed) { con.Open(); }
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            return dt;
        }
        catch
        {
            return null;
        }
        finally
        {
            con.Close();
            sda.Dispose();
            con.Dispose();
        }
    }
    private void BindGrid()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlCommand cmd = new SqlCommand("spGetUserByAllUser ", con);
        cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
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
        BindGrid();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
        {
            DropDownList ddlWorkerName = (DropDownList)e.Row.FindControl("ddlSecQues");
            Label ddlWID = (Label)e.Row.FindControl("lblGVquees");
            ddlWorkerName.SelectedValue = ddlWID.Text;
            //---------------------------------------------- 

        }

        //----------Confirm Delete after delete button click event---
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[0].Text;
            foreach (Button button in e.Row.Cells[10].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete User " + e.Row.Cells[0].Text + "?')){ return false; };";
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
        TextBox txtupUsername = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEdituser_name");
        TextBox txtupemail = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditemail");
        TextBox txtuppass = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditPass");
        TextBox txtupcity = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditcity");

        TextBox txtupdist = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditDist");
        TextBox txtupstatus = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditstatus");
        TextBox txtupque = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditquestion");
        TextBox txtupans = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditAns");




        DropDownList ddlupdatevac = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlSecQues");
        //DropDownList ddlupdatechild = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlGVchild");
        //DropDownList ddlupdateTask2 = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlTask2");
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd1 = new SqlCommand("spUpdateUser", con);
        cmd1.Connection = con;
        cmd1.CommandType = CommandType.StoredProcedure;
        if (con.State == ConnectionState.Closed)
        {
            cmd1.Connection.Open();
        }
        cmd1.Parameters.AddWithValue("@Name", txtupUsername.Text);
        cmd1.Parameters.AddWithValue("@Email", txtupemail.Text);
        cmd1.Parameters.AddWithValue("@Pass", txtuppass.Text);
        cmd1.Parameters.AddWithValue("@city", txtupcity.Text);
        cmd1.Parameters.AddWithValue("@dist", txtupdist.Text);
        cmd1.Parameters.AddWithValue("@status", txtupstatus.Text);

        cmd1.Parameters.AddWithValue("@que", ddlupdatevac.SelectedItem.Text);
        cmd1.Parameters.AddWithValue("@ans", txtupans.Text);

        cmd1.Parameters.AddWithValue("@user_id", id2);
        cmd1.ExecuteNonQuery();
        cmd1.Connection.Close();
        GridView1.EditIndex = -1;
        BindGrid();

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

        SqlCommand cmd = new SqlCommand("spDeleteUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ID", IIDD);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.EditIndex = -1;
        BindGrid();

    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGrid();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.PageIndex = e.NewPageIndex;
        BindGrid();
    }




    //---------------gridview ending-------------------
}