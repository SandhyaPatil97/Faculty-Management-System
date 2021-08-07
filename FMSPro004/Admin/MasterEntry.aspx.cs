using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_MasterEntry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserType"].ToString() == "Admin")
        {
            if (!IsPostBack)
            {
                BindGridClass();
                BindGridDepartment();

            }
        }
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
    private void BindGridClass()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlCommand cmd = new SqlCommand("select ID ,Class from tblClass ", con);
        cmd.CommandType = CommandType.Text;
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
        BindGridClass();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
        {


        }

        //----------Confirm Delete after delete button click event---
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[0].Text;
            foreach (Button button in e.Row.Cells[3].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete Class " + e.Row.Cells[0].Text + "?')){ return false; };";
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

        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd1 = new SqlCommand("Update tblClass set class=@d1 where ID=@ID", con);
        cmd1.Connection = con;
        cmd1.CommandType = CommandType.Text;
        if (con.State == ConnectionState.Closed)
        {
            cmd1.Connection.Open();
        }
        cmd1.Parameters.AddWithValue("@d1", txtupUsername.Text);


        cmd1.Parameters.AddWithValue("@ID", id2);
        cmd1.ExecuteNonQuery();
        cmd1.Connection.Close();
        GridView1.EditIndex = -1;
        BindGridClass();

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

        SqlCommand cmd = new SqlCommand("delete from tblClass where ID=@ID", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@ID", IIDD);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.EditIndex = -1;
        BindGridClass();

    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGridClass();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.PageIndex = e.NewPageIndex;
        BindGridClass();
    }




    //---------------gridview ending-------------------
    protected void btnAddClass_Click(object sender, EventArgs e)
    {
        if (isexixtclass())
        {
            Response.Write("<script>alert('Class Exist');</script>");
        }
        else
        {
            SqlCommand cmd = new SqlCommand("Insert into tblClass (Class) values(@Class)");
            cmd.Parameters.AddWithValue("@Class", txtclass.Text);
            InsertUpdateData(cmd);
            txtclass.Text = "";
            BindGridClass();


        }
    }

    private bool isexixtclass()
    {
        try
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand(" select Class from tblClass where Class=@Class", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Class", txtclass.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {

            Response.Write("<script>alert('" + ex.Message + "');</script>");
            return false;
        }
    }


    //-------------------gridview 2 start-------------------------------------------------------------------------------------------------------

    private void BindGridDepartment()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlCommand cmd = new SqlCommand("select ID ,Department from tblDepartment ", con);
        cmd.CommandType = CommandType.Text;
        //cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
        else
        {
            GridView2.DataSource = null;
            GridView2.DataBind();
        }

    }

    private bool isexixtDepartment()
    {
        try
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand(" select Department from tblDepartment where Department=@Department", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Department", txtDepartment.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {

            Response.Write("<script>alert('" + ex.Message + "');</script>");
            return false;
        }
    }

    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        BindGridDepartment();
    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && GridView2.EditIndex == e.Row.RowIndex)
        {


        }

        //----------Confirm Delete after delete button click event---
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[0].Text;
            foreach (Button button in e.Row.Cells[3].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete Class " + e.Row.Cells[0].Text + "?')){ return false; };";
                }
            }
        }
        //-----------------End

    }

    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        //-------------Update record start--

        Label id = ((Label)GridView2.Rows[e.RowIndex].FindControl("lblEditID"));
        int id2 = Convert.ToInt32(id.Text);
        TextBox txtupUsername = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtGVEdituser_name");

        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd1 = new SqlCommand("Update tblDepartment set Department=@d1 where ID=@ID", con);
        cmd1.Connection = con;
        cmd1.CommandType = CommandType.Text;
        if (con.State == ConnectionState.Closed)
        {
            cmd1.Connection.Open();
        }
        cmd1.Parameters.AddWithValue("@d1", txtupUsername.Text);


        cmd1.Parameters.AddWithValue("@ID", id2);
        cmd1.ExecuteNonQuery();
        cmd1.Connection.Close();
        GridView2.EditIndex = -1;
        BindGridDepartment();

        //-----------update End--

    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //--Delete Selected Row
        //Label id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblEditID"));
        //int id2 = Convert.ToInt32(id.Text);
        int IIDD = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString());
        SqlConnection con = new SqlConnection(GetConnectionString());
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        SqlCommand cmd = new SqlCommand("delete from tblDepartment where ID=@ID", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@ID", IIDD);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView2.EditIndex = -1;
        BindGridDepartment();

    }

    protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView2.EditIndex = -1;
        BindGridDepartment();
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.EditIndex = -1;
        GridView2.PageIndex = e.NewPageIndex;
        BindGridDepartment();
    }
    //---------------gridview ending-------------------







    protected void btnDepartment_Click(object sender, EventArgs e)
    {
        if (isexixtDepartment())
        {
            Response.Write("<script>alert('Class Exist');</script>");
        }
        else
        {
            SqlCommand cmd = new SqlCommand("Insert into tblDepartment (Department) values(@Department)");
            cmd.Parameters.AddWithValue("@Department", txtDepartment.Text);
            InsertUpdateData(cmd);
            txtDepartment.Text = "";
            BindGridDepartment();

        }
    }
}