using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Monitor_MonitorHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }

        ((Label)Master.FindControl("lbl_title")).Text = "Dashboard";
    }
}