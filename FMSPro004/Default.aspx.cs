using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string GetConnectionString()
    {
        return System.Configuration.ConfigurationManager.ConnectionStrings["FMSDB"].ConnectionString;
    }

    protected void sendMessageButton_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        if (con.State == ConnectionState.Closed) { con.Open(); }
        SqlCommand cmd = new SqlCommand("insert into tblcontactme(name,Email,Phone,messagetxt) values(@name,@Email,@Phone,@messagetxt)", con);
        cmd.Parameters.AddWithValue("@name", name.Text);
        cmd.Parameters.AddWithValue("@Email", email.Text);
        cmd.Parameters.AddWithValue("@Phone", phone.Text);
        cmd.Parameters.AddWithValue("@messagetxt", message.Text);
        cmd.ExecuteNonQuery();
        Response.Write("<script>alert('Thank you for Contact Me we will back to you soon...');</script>");
        con.Close();
    }
}