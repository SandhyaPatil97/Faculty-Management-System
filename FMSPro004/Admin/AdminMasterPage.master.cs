using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["UserName"] != null && Session["UserType"].ToString() == "Admin")
            {
                this.lb1.Text = string.Format(" {0}", Session["UserName"].ToString());
                //lblout.Text = "Logout";
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}
