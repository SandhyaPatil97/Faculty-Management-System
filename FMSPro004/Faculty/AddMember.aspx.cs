using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Faculty_AddMember : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserType"].ToString() == "Faculty")
        {
            if (!IsPostBack)
            {
                BindGridStudent();
                BindGridMember();
                BindDepartment();
                BindClass();

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

    private void BindClass()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlCommand cmd = new SqlCommand("select ID,Class from tblClass ", con);
        cmd.CommandType = CommandType.Text;
        //cmd.Parameters.AddWithValue("@C", Session["UserEmail"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt.Rows.Count > 0)
        {
            ddlsClass.DataSource = dt;
            ddlsClass.DataTextField = "Class";
            ddlsClass.DataValueField = "ID";
            ddlsClass.DataBind();
            System.Web.UI.WebControls.ListItem ddlproject2 = new System.Web.UI.WebControls.ListItem("Select Option", "-1");
            ddlsClass.Items.Insert(0, ddlproject2);
            
        }
        else
        {
            //GridView1.DataSource = null;
            //GridView1.DataBind();
        }
    }

    private void BindDepartment()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlCommand cmd = new SqlCommand("select ID,Department from tblDepartment ", con);
        cmd.CommandType = CommandType.Text;
        //cmd.Parameters.AddWithValue("@C", Session["UserEmail"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        if (dt.Rows.Count > 0)
        {
            ddlmDepartment.DataSource = dt;
            ddlmDepartment.DataTextField = "Department";
            ddlmDepartment.DataValueField = "ID";
            ddlmDepartment.DataBind();
            System.Web.UI.WebControls.ListItem ddlproject2 = new System.Web.UI.WebControls.ListItem("Select Option", "-1");
            ddlmDepartment.Items.Insert(0, ddlproject2);

        }
        else
        {
            //GridView1.DataSource = null;
            //GridView1.DataBind();
        }
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
    private void BindGridStudent()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlCommand cmd = new SqlCommand("select t1.ID,t1.StudentName,t1.ClassID,t2.class,t1.Email,t1.Addresss,t1.CreatedBy from tblStudent as t1 left join tblClass as t2 on t1.ClassID=t2.ID where t1.CreatedBy=@C ", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@C", Session["UserEmail"].ToString());
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
            GridView1.DataSource = null;
            GridView1.DataBind();
        }

    }

    private void BindGridMember()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlCommand cmd = new SqlCommand("select t1.ID,t1.Membername,t1.DepartmentID,t2.Department,t1.Position,t1.Salary,t1.Email,t1.Address1,t1.CreatedBy from tblMember as t1 left join tblDepartment as t2 on t1.DepartmentID=t2.ID where t1.CreatedBy=@E ", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@E", Session["UserEmail"].ToString());
        string aa = Session["UserEmail"].ToString();
        string bb = Session["UserName"].ToString();
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
    protected void btnAddMember_Click(object sender, EventArgs e)
    {
        if(txtmAddress.Text!=string.Empty && txtmEmail.Text!=string.Empty && txtMName.Text!=string.Empty && txtmPosition.Text!=string.Empty && txtmsalary.Text!=string.Empty && ddlmDepartment.SelectedIndex!=-1)
        {
            if(IsMemberExist())
            {
                Response.Write("<script>alert('Duplicate record not allow')</script>");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("Insert into tblMember(Membername,DepartmentID,Position,Salary,Email,Address1,CreatedBy) values(@Membername,@DepartmentID,@Position,@Salary,@Email,@Address1,@CreatedBy)");
                cmd.Parameters.AddWithValue("@Membername ",txtMName.Text);
                cmd.Parameters.AddWithValue("@DepartmentID", ddlmDepartment.SelectedValue);
                 cmd.Parameters.AddWithValue("@Position ",txtmPosition.Text);
                 cmd.Parameters.AddWithValue("@Salary ",txtmsalary.Text);
                 cmd.Parameters.AddWithValue("@Email ",txtmEmail.Text);

                 cmd.Parameters.AddWithValue("@Address1 ",txtmAddress.Text);
                 cmd.Parameters.AddWithValue("@CreatedBy ", Session["UserEmail"].ToString());
                 InsertUpdateData(cmd);
                 BindGridMember();
                 txtmAddress.Text = string.Empty; txtmEmail.Text = string.Empty; txtMName.Text = string.Empty; txtmPosition.Text = string.Empty; txtmsalary.Text = string.Empty; ddlmDepartment.SelectedIndex = -1;

                
            }
        }
        else
        {

        }
    }

    private bool IsMemberExist()
    {
        try
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand(" select Membername,Email from tblMember where Membername=@M AND Email=@E", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@M", txtMName.Text);
            cmd.Parameters.AddWithValue("@E", txtmEmail.Text);
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
    private bool IsStudentExist()
    {
        try
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand(" select Membername,Email from tblMember where Membername=@M AND Email=@E", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@M", txtMName.Text);
            cmd.Parameters.AddWithValue("@E", txtmEmail.Text);
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
    protected void btnAddStudent_Click(object sender, EventArgs e)
    {
        if (txtStudentName.Text != string.Empty && txtSEmail.Text != string.Empty && txtSAddress.Text != string.Empty && ddlsClass.SelectedIndex != -1 )
        {
            if (IsStudentExist())
            {
                Response.Write("<script>alert('Duplicate record not allow')</script>");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("insert into tblStudent (StudentName,ClassID,Email,Addresss,CreatedBy) values(@StudentName,@ClassID,@Email,@Addresss,@CreatedBy)");
                cmd.Parameters.AddWithValue("@StudentName ", txtStudentName.Text);
                cmd.Parameters.AddWithValue("@ClassID", ddlsClass.SelectedValue);
                cmd.Parameters.AddWithValue("@Email ", txtSEmail.Text);
                cmd.Parameters.AddWithValue("@Addresss ", txtSAddress.Text);

                cmd.Parameters.AddWithValue("@CreatedBy ", Session["UserEmail"].ToString());
                InsertUpdateData(cmd);
                BindGridStudent();

                txtSEmail.Text = "";
                txtSAddress.Text = "";
                txtStudentName.Text = "";
                ddlsClass.SelectedIndex = -1;


            }
        }
        else
        {

        }
    }



    //-------------------gridview Member start-------------------


    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGridMember();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
        {
            DropDownList ddlWorkerName = (DropDownList)e.Row.FindControl("ddlGV1Department");
            Label ddlWID = (Label)e.Row.FindControl("lblGVEditchildID");
            ddlWorkerName.SelectedValue = ddlWID.Text;
            //---------------------------------------------- 

        }

        //----------Confirm Delete after delete button click event---
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[0].Text;
            foreach (Button button in e.Row.Cells[8].Controls.OfType<Button>())
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


        Label id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblEditID1"));
        int id2 = Convert.ToInt32(id.Text);
        TextBox txtupMembername = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditMembername");
        TextBox txtupPosition = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditPosition");

        TextBox txtupSalary = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEdit1Salary");
        TextBox txtupEmail = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditemail");

        TextBox txtupAddress1 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditAddress1");
       
        //TextBox txtupans = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditAns");




        DropDownList ddlupDepartment = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlGV1Department");
        //DropDownList ddlupdatechild = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlGVchild");
        //DropDownList ddlupdateTask2 = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlTask2");
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd1 = new SqlCommand(" update tblMember set Membername=@Membername,DepartmentID=@DepartmentID,Position=@Position,Salary=@Salary,Email=@Email,Address1=@Address1 where ID=@ID", con);
        cmd1.Connection = con;
        cmd1.CommandType = CommandType.Text;
        if (con.State == ConnectionState.Closed)
        {
            cmd1.Connection.Open();
        }
        cmd1.Parameters.AddWithValue("@Membername", txtupMembername.Text);
        cmd1.Parameters.AddWithValue("@DepartmentID", ddlupDepartment.Text);
        cmd1.Parameters.AddWithValue("@Position", txtupPosition.Text);
        cmd1.Parameters.AddWithValue("@Salary", txtupSalary.Text);
        cmd1.Parameters.AddWithValue("@Email", txtupEmail.Text);
        cmd1.Parameters.AddWithValue("@Address1", txtupAddress1.Text);


        cmd1.Parameters.AddWithValue("@ID", id2);
        cmd1.ExecuteNonQuery();
        cmd1.Connection.Close();
        GridView1.EditIndex = -1;
        BindGridMember();

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

        SqlCommand cmd = new SqlCommand("delete from tblMember where ID=@ID ", con);
        cmd.CommandType = CommandType.Text; ;
        cmd.Parameters.AddWithValue("@ID", IIDD);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.EditIndex = -1;
        BindGridMember();

    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGridMember();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.PageIndex = e.NewPageIndex;
        BindGridMember();
    }

    
    //---------------gridview ending------------------------------------------------




    //-------------------gridview2 Student start-------------------


    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        BindGridStudent();
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

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && GridView2.EditIndex == e.Row.RowIndex)
        {
            DropDownList ddlupclass = (DropDownList)e.Row.FindControl("ddlGV2class");
            
            //---------------------------------------------- 

            ddlupclass.DataSource = GetData("spGetClass", null);
            ddlupclass.DataTextField = "Class";
            ddlupclass.DataValueField = "ID";
            ddlupclass.DataBind();

            ListItem ddlw = new ListItem("Select Option", "-1");
            ddlupclass.Items.Insert(0, ddlw);
            Label ddlWID = (Label)e.Row.FindControl("lblGVEditclassid");
            ddlupclass.SelectedValue = ddlWID.Text;

        }

        //----------Confirm Delete after delete button click event---
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[0].Text;
            foreach (Button button in e.Row.Cells[6].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete Student " + e.Row.Cells[0].Text + "?')){ return false; };";
                }
            }
        }
        //-----------------End

    }

    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {


        Label id = ((Label)GridView2.Rows[e.RowIndex].FindControl("lblEditID"));
        int id2 = Convert.ToInt32(id.Text);
        TextBox txtupstdname = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtGVEditStudentName");
        TextBox txtupemail = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtGVEditemail");

        TextBox txtupAddress = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtGVEditAddresss");
        

        //TextBox txtupans = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGVEditAns");




        DropDownList ddlupclass = (DropDownList)GridView2.Rows[e.RowIndex].FindControl("ddlGV2class");
        //DropDownList ddlupdatechild = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlGVchild");
        //DropDownList ddlupdateTask2 = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlTask2");
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd1 = new SqlCommand(" update tblStudent set StudentName=@STDName,ClassID=@Class,Email=@StdEmail,Addresss=@Addr ,CreatedBy=@CBY where ID=@ID", con);
        cmd1.Connection = con;
        cmd1.CommandType = CommandType.Text;
        if (con.State == ConnectionState.Closed)
        {
            cmd1.Connection.Open();
        }
        cmd1.Parameters.AddWithValue("@STDName", txtupstdname.Text);
        cmd1.Parameters.AddWithValue("@Class", ddlupclass.SelectedValue);
        cmd1.Parameters.AddWithValue("@StdEmail", txtupemail.Text);
        cmd1.Parameters.AddWithValue("@Addr", txtupAddress.Text);

        cmd1.Parameters.AddWithValue("@CBY", Session["UserEmail"].ToString());
        cmd1.Parameters.AddWithValue("@ID", id2);
        cmd1.ExecuteNonQuery();
        cmd1.Connection.Close();
        GridView2.EditIndex = -1;
        BindGridStudent();

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

        SqlCommand cmd = new SqlCommand("delete from tblStudent where ID=@ID ", con);
        cmd.CommandType = CommandType.Text; ;
        cmd.Parameters.AddWithValue("@ID", IIDD);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView2.EditIndex = -1;
        BindGridStudent();

    }

    protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView2.EditIndex = -1;
        BindGridStudent();
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.EditIndex = -1;
        GridView2.PageIndex = e.NewPageIndex;
        BindGridStudent();
    }


    //---------------gridview2 ending-------------------


}