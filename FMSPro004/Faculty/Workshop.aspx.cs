using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Faculty_Workshop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserType"].ToString() == "Faculty")
        {
            if (!IsPostBack)
            {
                pnl1.Visible = false;
                pnl2.Visible = false;
                BindGridview1();
                pnl3.Visible = true;

            }
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        //Attended
        pnl1.Visible = true;
        pnl2.Visible = false;
        LinkButton2.BackColor = System.Drawing.Color.Yellow;
        LinkButton3.BackColor = System.Drawing.Color.White;
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        //conducted
        pnl1.Visible = false;
        pnl2.Visible = true;
        LinkButton3.BackColor = System.Drawing.Color.Yellow;
        LinkButton2.BackColor = System.Drawing.Color.White;
    }

    public string GetConnectionString()
    {
        return System.Configuration.ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
    }

    private void BindGridview1()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select ID,NameOfFaculty,TitleOfWorkshop,OrganizedBy,WSDate ,NoOfDays,WSLevel,WSType from tblWorkshop where CreatedBy=@CreatedBy", con);
                cmd.Parameters.AddWithValue("@CreatedBy", Session["UserName"].ToString());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
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
                con.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    //-------------------gridview start---

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGridview1();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
        {

            DropDownList ddlWorkerName = (DropDownList)e.Row.FindControl("ddlWtype");
            Label ddlWID = (Label)e.Row.FindControl("lblGV1EditWSType");
            ddlWorkerName.SelectedValue = ddlWID.Text;

        }

        //----------Confirm Delete after delete button click event---
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[0].Text;
            foreach (Button button in e.Row.Cells[9].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete Workshop " + e.Row.Cells[0].Text + "?')){ return false; };";
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
        TextBox txtupWT = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditWTitle");
        TextBox txtupOrganize = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditOrganizedBy");

        TextBox txtupwdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditWDate");
        TextBox txtupnodays = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditWNoOfDays");
        TextBox txtupwslevel = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditWSLevel");
        DropDownList ddlupwtype = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlWtype");

        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd1 = new SqlCommand("update tblWorkshop set NameOfFaculty=@d1,TitleOfWorkshop=@d2,OrganizedBy=@d3,WSDate=@d4 ,NoOfDays=@d5,WSLevel=@d6,WSType=@d7,CreatedBy=@d8 where ID=@ID", con);
        cmd1.Connection = con;
        cmd1.CommandType = CommandType.Text;
        if (con.State == ConnectionState.Closed)
        {
            cmd1.Connection.Open();
        }
        cmd1.Parameters.AddWithValue("@d1", txtupFN.Text);
        cmd1.Parameters.AddWithValue("@d2", txtupWT.Text);
        cmd1.Parameters.AddWithValue("@d3", txtupOrganize.Text);
        cmd1.Parameters.AddWithValue("@d4", txtupwdate.Text);
        cmd1.Parameters.AddWithValue("@d5", txtupnodays.Text);
        cmd1.Parameters.AddWithValue("@d6", txtupwslevel.Text);
        cmd1.Parameters.AddWithValue("@d7", ddlupwtype.SelectedItem.Text);
        cmd1.Parameters.AddWithValue("@d8", Session["UserName"].ToString());

        cmd1.Parameters.AddWithValue("@ID", id2);
        cmd1.ExecuteNonQuery();
        cmd1.Connection.Close();
        GridView1.EditIndex = -1;
        BindGridview1();

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

        SqlCommand cmd = new SqlCommand("delete from tblWorkshop where ID=@ID", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@ID", IIDD);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.EditIndex = -1;
        BindGridview1();

    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGridview1();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.PageIndex = e.NewPageIndex;
        BindGridview1();
    }


    //---------------gridview ending-------------------
    protected void btnAttended_Click(object sender, EventArgs e)
    {
        if (txtNameofFaculty.Text != string.Empty && txtTitleofworkshop.Text != string.Empty && txtOrganizedby.Text != string.Empty && txtNoofdays.Text != string.Empty && txtDate.Text != string.Empty && txtLevel.Text != string.Empty)
        {
            SqlCommand cmd = new SqlCommand("insert into tblWorkshop(NameOfFaculty,TitleOfWorkshop,OrganizedBy,WSDate ,NoOfDays,WSLevel,WSType,CreatedBy) values(@NameOfFaculty,@TitleOfWorkshop,@OrganizedBy,@WSDate ,@NoOfDays,@WSLevel,@WSType,@CreatedBy)");
            cmd.Parameters.AddWithValue("@NameOfFaculty",txtNameofFaculty.Text);
            cmd.Parameters.AddWithValue("@TitleOfWorkshop",txtTitleofworkshop.Text);
            cmd.Parameters.AddWithValue("@OrganizedBy",txtOrganizedby.Text);
            cmd.Parameters.AddWithValue("@WSDate",txtDate.Text);
            cmd.Parameters.AddWithValue("@NoOfDays",txtNoofdays.Text);
            cmd.Parameters.AddWithValue("@WSLevel", txtLevel.Text);
            cmd.Parameters.AddWithValue("@WSType","Attended");
            cmd.Parameters.AddWithValue("@CreatedBy",Session["UserName"].ToString());
            InsertUpdateData(cmd);
            pnl2.Visible = false;
            pnl1.Visible = false;
            pnl3.Visible = true;
            BindGridview1();
            txtNameofFaculty.Text = string.Empty;
            txtTitleofworkshop.Text = string.Empty;
            txtOrganizedby.Text = string.Empty;
            txtNoofdays.Text = string.Empty;
            txtDate.Text = string.Empty;
            txtLevel.Text = string.Empty;
           
        }
        else
        {
            Response.Write("<script>alert('validation error');</script>");
        }
    }
    protected void btnConducted_Click(object sender, EventArgs e)
    {
        if (txtConNamofFaculty.Text != string.Empty && txtContitleofworkshop.Text != string.Empty && txtConOrganizeby.Text != string.Empty && txtConNoofdays.Text != string.Empty && txtConDate.Text != string.Empty && txtConLevel.Text != string.Empty)
        {
            SqlCommand cmd = new SqlCommand("insert into tblWorkshop(NameOfFaculty,TitleOfWorkshop,OrganizedBy,WSDate ,NoOfDays,WSLevel,WSType,CreatedBy) values(@NameOfFaculty,@TitleOfWorkshop,@OrganizedBy,@WSDate ,@NoOfDays,@WSLevel,@WSType,@CreatedBy)");
            cmd.Parameters.AddWithValue("@NameOfFaculty", txtConNamofFaculty.Text);
            cmd.Parameters.AddWithValue("@TitleOfWorkshop", txtContitleofworkshop.Text);
            cmd.Parameters.AddWithValue("@OrganizedBy", txtConOrganizeby.Text);
            cmd.Parameters.AddWithValue("@WSDate", txtConDate.Text);
            cmd.Parameters.AddWithValue("@NoOfDays", txtConNoofdays.Text);
            cmd.Parameters.AddWithValue("@WSLevel", txtConLevel.Text);
            cmd.Parameters.AddWithValue("@WSType", "Conducted");
            cmd.Parameters.AddWithValue("@CreatedBy", Session["UserName"].ToString());
            InsertUpdateData(cmd);
            pnl2.Visible = false;
            pnl1.Visible = false;
            pnl3.Visible = true;
            BindGridview1();
            txtConNamofFaculty.Text = string.Empty; txtContitleofworkshop.Text = string.Empty; txtConOrganizeby.Text = string.Empty; txtConNoofdays.Text = string.Empty; txtConDate.Text = string.Empty; txtConLevel.Text = string.Empty;

        }
        else
        {
            Response.Write("<script>alert('validation error');</script>");
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
}