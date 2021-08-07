using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Faculty_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserType"].ToString() == "Faculty")
        {
            if (!Page.IsPostBack)
            {
                showRecordOnPageLoad();
            }
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }      
    }
    public string GetConnectionString()
    {
        return System.Configuration.ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
    }

    private bool IsExistPersonalRecord()
    {
        try
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand(" select top 1 FullName,Email,Mobile,Dept,Position,Addr from tblProfile where Email=@Email", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());            
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

    private bool IsExistEducationalRecord()
    {
        try
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand(" select ClassName,CollegeName,PassYear from tblEduQualification where Email=@Email", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
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

    private bool IsExistExpRecord()
    {
        try
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand(" select OrgName,Position,joinDate,TotExp from tblExperience where Email=@Email", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
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

    private void showRecordOnPageLoad()
    {
        //string Edu = "", Exp = "", Personal = "";
        if(IsExistPersonalRecord())
        {
            pnl1.Visible = true;
            SearchPersonalInfo();
            searchCityDistt();
            
            pnl2.Visible = false;
        }
        else
        {
            pnl1.Visible = false;
            pnl2.Visible = true;
           
        }
        if(IsExistEducationalRecord())
        {
            pnl5.Visible = true;            
            pnl3.Visible = false;
            SearchEducationInfo();
        }
        else
        {
            pnl5.Visible = false;        
            pnl3.Visible = true;
        }
        if(IsExistExpRecord())
        {
            pnl6.Visible = true;
            pnl4.Visible = false;
            SearchExperienceInfo();

        }
        else
        {
            pnl6.Visible = false;
            pnl4.Visible = true;
        }
    }
    private void searchCityDistt()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select top 1 city,Dist  from tblUser where email=@email", con);
                cmd.Parameters.AddWithValue("@email", Session["UserEmail"].ToString());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                da.Fill(ds, "dt");
                if (ds.Tables[0].Rows.Count > 0)
                {
                   // string cd = ds.Tables[0].Rows[0]["city"].ToString();
                   // string dd = ds.Tables[0].Rows[0]["Dist"].ToString();
                    lblvcity.Text = ds.Tables[0].Rows[0]["city"].ToString() + " " + ds.Tables[0].Rows[0]["Dist"].ToString(); 
                }
                else
                {
                    lblvcity.Text="N/A";
                }
                con.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }
    private void SearchPersonalInfo()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select top 1 FullName,Email,Mobile,Dept,Position,Addr from tblProfile where Email=@Email", con);
                cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                da.Fill(ds, "dt");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblvname.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                    lblvemail.Text = ds.Tables[0].Rows[0]["Email"].ToString() ;
                    lblvmobile.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                    lblvDept.Text = ds.Tables[0].Rows[0]["Dept"].ToString();
                    lblvPosition.Text = ds.Tables[0].Rows[0]["Position"].ToString();
                    lblvAddress.Text = ds.Tables[0].Rows[0]["Addr"].ToString();
                }
                con.Close();
            }
            string idun = Session["UserEmail"].ToString();
            byte[] bytes = (byte[])GetDataImg("Select ProfileImage as Data FROM tblProfile WHERE Email='" + idun + "' ").Rows[0]["Data"];
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            Image1.ImageUrl = "data:image/png;base64," + base64String;

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    private DataTable GetDataImg(string query)
    {
        DataTable dt = new DataTable();

        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                }
            }
            return dt;
        }
    }

    private void SearchEducationInfo()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select EduID,ClassName,CollegeName,PassYear from tblEduQualification where Email=@Email", con);
                cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
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

    private void SearchExperienceInfo()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select ExpID,OrgName,Position,joinDate,TotExp from tblExperience where Email=@Email", con);
                cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                //DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                da.Fill(dt);
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
        SearchEducationInfo();
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
            foreach (Button button in e.Row.Cells[6].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete Educational detail " + e.Row.Cells[0].Text + "?')){ return false; };";
                }
            }
        }
	

    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        //-------------Update record start--
try {
        Label id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblEditEduID"));
        int id2 = Convert.ToInt32(id.Text);
        TextBox txtupClass = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditClassName");
        TextBox txtupcollege = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditCollegeName");
        TextBox txtupPassY = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditPassYear");
        
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd1 = new SqlCommand("update tblEduQualification set ClassName=@ClassName,CollegeName=@CollegeName,PassYear=@PassYear where EduID=@EduID", con);
        cmd1.Connection = con;
        cmd1.CommandType = CommandType.Text;
        if (con.State == ConnectionState.Closed)
        {
            cmd1.Connection.Open();
        }
        cmd1.Parameters.AddWithValue("@ClassName", txtupClass.Text);
        cmd1.Parameters.AddWithValue("@CollegeName",txtupcollege.Text);
        cmd1.Parameters.AddWithValue("@PassYear", txtupPassY.Text);

        cmd1.Parameters.AddWithValue("@EduID", id2);
        cmd1.ExecuteNonQuery();
        cmd1.Connection.Close();
        GridView1.EditIndex = -1;
        SearchEducationInfo();
        showRecordOnPageLoad();
	}
        catch (Exception ex) {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
        //-----------update End--

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //--Delete Selected Row
        //Label id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblEditID"));
        //int id2 = Convert.ToInt32(id.Text);
        int IIDD = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        SqlConnection con = new SqlConnection(GetConnectionString());
        if (con.State == ConnectionState.Closed) {
            con.Open();
        }

        SqlCommand cmd = new SqlCommand("delete from tblEduQualification where EduID=@ID", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@ID", IIDD);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.EditIndex = -1;
        SearchEducationInfo();
        showRecordOnPageLoad();

    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        SearchEducationInfo();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.PageIndex = e.NewPageIndex;
        SearchEducationInfo();
    }

    
    //---------------gridview ending-------------------


    //----------------------------------------------------------------------------------------------------------------------------------------------



    //-------------------gridview2 start---


    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        SearchExperienceInfo();
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
            foreach (Button button in e.Row.Cells[6].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete User " + e.Row.Cells[0].Text + "?')){ return false; };";
                }
            }
        }

    }

    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        //-------------Update record start--

        Label id = ((Label)GridView2.Rows[e.RowIndex].FindControl("lblEditID"));
        int id2 = Convert.ToInt32(id.Text);
        TextBox txtupOrgName = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtGV1EditOrgName");
        TextBox txtupposi = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtGV1EditPosition");
        TextBox txtupjoindt = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtGV1EditjoinDate");
        TextBox txtuptotexp = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtGV1EditTotExp");
       
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd1 = new SqlCommand("update tblExperience set OrgName=@OrgName,Position=@Position,joinDate=@joinDate,TotExp=@TotExp where ExpID=@ExpID", con);
        cmd1.Connection = con;
        cmd1.CommandType = CommandType.Text;
        if (con.State == ConnectionState.Closed)
        {
            cmd1.Connection.Open();
        }
        cmd1.Parameters.AddWithValue("@OrgName", txtupOrgName.Text);
        cmd1.Parameters.AddWithValue("@Position", txtupposi.Text);
        cmd1.Parameters.AddWithValue("@joinDate", txtupjoindt.Text);
        cmd1.Parameters.AddWithValue("@TotExp", txtuptotexp.Text);
        cmd1.Parameters.AddWithValue("@ExpID", id2);
        cmd1.ExecuteNonQuery();
        cmd1.Connection.Close();
        GridView2.EditIndex = -1;
        SearchExperienceInfo();
        showRecordOnPageLoad();

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

        SqlCommand cmd = new SqlCommand("delete from tblExperience where ExpID=@ID ", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@ID", IIDD);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView2.EditIndex = -1;
        SearchExperienceInfo();
        showRecordOnPageLoad();

    }

    protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView2.EditIndex = -1;
        SearchExperienceInfo();
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.EditIndex = -1;
        GridView2.PageIndex = e.NewPageIndex;
        SearchExperienceInfo();
    }




    //---------------gridview2 ending-------------------

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
    protected void btnupdatepro_Click(object sender, EventArgs e)
    {
        if(txtAFullName.Text!=string.Empty && txtAMobile.Text!=string.Empty && txtAPosition.Text!=string.Empty && txtADept.Text!=string.Empty && txtAAddress.Text!=string.Empty)
        {
            byte[] bytes;
            using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
            {
                bytes = br.ReadBytes(FileUpload1.PostedFile.ContentLength);
            }
            SqlConnection con = new SqlConnection(GetConnectionString());
            if (con.State == ConnectionState.Closed) { con.Open(); }
            SqlCommand cmd = new SqlCommand("insert into tblProfile (FullName,Email,Mobile,Dept,Position,Addr,ImgName,ContentType,ProfileImage,CreatedBy,ProfileStatus) Values(@FullName,@Email2,@Mobile,@Dept,@Position,@Addr,@ImgName,@ContentType,@ProfileImage,@CreatedBy,@ProfileStatus)", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@FullName", txtAFullName.Text);
            cmd.Parameters.AddWithValue("@Email2", Session["UserEmail"].ToString());
            cmd.Parameters.AddWithValue("@Mobile", txtAMobile.Text);
            cmd.Parameters.AddWithValue("@Dept", txtADept.Text);
            cmd.Parameters.AddWithValue("@Position", txtAPosition.Text);
            cmd.Parameters.AddWithValue("@Addr", txtAAddress.Text);
            string imgname2 = Path.GetFileName(FileUpload1.PostedFile.FileName);
            
            cmd.Parameters.AddWithValue("@ImgName", imgname2);
            cmd.Parameters.AddWithValue("@ContentType", FileUpload1.PostedFile.ContentType);
            cmd.Parameters.AddWithValue("@ProfileImage", bytes);
            cmd.Parameters.AddWithValue("@CreatedBy", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@ProfileStatus", "Set");

            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                Response.Write("<script>alert('Record UPdated successfully');</script>");
            }
             pnl2.Visible = false;
             pnl1.Visible = true;
             showRecordOnPageLoad();
        }
        else
        {
            Response.Write("<script>alert('Validation Error...'); </script>");
        }
    }
    protected void btnAddEducation_Click(object sender, EventArgs e)
    {
    try {
        if (txtEduClass.Text != string.Empty && txtEduCollege.Text != string.Empty && txtEduPassYear.Text != string.Empty) {
            SqlCommand cmd = new SqlCommand("Insert into tblEduQualification(ClassName,CollegeName,PassYear,Email)values(@ClassName,@CollegeName,@PassYear,@Email)");
            cmd.Parameters.AddWithValue("@ClassName", txtEduClass.Text);
            cmd.Parameters.AddWithValue("@CollegeName", txtEduCollege.Text);
            cmd.Parameters.AddWithValue("@PassYear", txtEduPassYear.Text);
            cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());          
            InsertUpdateData(cmd);
            
            showRecordOnPageLoad();
        }
        else {
            Response.Write("<script>alert('Validation Error...'); </script>");
	}
		}
		catch (Exception ex) {
			Response.Write("<script>alert('" + ex.ToString() + "')</script>");
        }
    }
    protected void btnAddExperience_Click(object sender, EventArgs e)
    {
        if (txtExpOrgName.Text != string.Empty && txtExpPosi.Text!=string.Empty && txtExpJoinDate.Text!=string.Empty && txtExpTotExp.Text!=string.Empty)
        {
            SqlCommand cmd = new SqlCommand("insert into tblExperience(OrgName,Position,joinDate,TotExp,Email) values(@OrgName,@Position,@joinDate,@TotExp,@Email)");
            cmd.Parameters.AddWithValue("@OrgName", txtExpOrgName.Text);
            cmd.Parameters.AddWithValue("@Position", txtExpPosi.Text);
            cmd.Parameters.AddWithValue("@joinDate", txtExpJoinDate.Text);
            cmd.Parameters.AddWithValue("@TotExp", txtExpTotExp.Text);      
            cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
            InsertUpdateData(cmd);

            showRecordOnPageLoad();
        }
        else
        {
            Response.Write("<script>alert('Validation Error...'); </script>");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
		showRecordOnPageLoad();
        pnl3.Visible = false;
        pnl4.Visible = false;
        pnl5.Visible = false;
        pnl6.Visible = false;
     }
     protected void LinkButton4_Click(object sender, EventArgs e)
    {;

		// showRecordOnPageLoad();
     
		// // pnl5.Visible = false;
        // // pnl3.Visible = false;
		// pnl2.Visible = false;
        // pnl1.Visible = false;
        // pnl4.Visible = false;
        // pnl6.Visible = false;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        // pnl5.Visible = true;
        // pnl3.Visible = true;

		showRecordOnPageLoad();
        pnl2.Visible = false;
        pnl1.Visible = false;
        pnl4.Visible = false;
        pnl6.Visible = false;
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {


        // pnl6.Visible = true;
        // pnl4.Visible = true;

		showRecordOnPageLoad();
        pnl1.Visible = false;
        pnl2.Visible = false;
        pnl3.Visible = false;
		pnl5.Visible = false;
    }
}