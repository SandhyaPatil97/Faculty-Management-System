using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class signup : System.Web.UI.Page
{
    string strEmail = "";
    protected void Page_Load(object sender, EventArgs e)
    {

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
                            Response.Redirect("signin.aspx?ID=1");
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
}