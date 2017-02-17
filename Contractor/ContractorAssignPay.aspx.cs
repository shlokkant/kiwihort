using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

public partial class Contractor_ContractorAssignPay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["Id"] == null)
        {
            
            Response.Redirect("~/login.aspx");
        }

        ((Label)Master.FindControl("lbl_title")).Text = "Messaging";
        // RequiredFieldValidator2.ControlToValidate = txtsubject;

        if (!IsPostBack)
        {

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["KiwihortData"].ConnectionString);

            con.Open();

            SqlCommand com = new SqlCommand("SELECT [tbl_worker].[FirstName], [tbl_worker].[LastName], [tbl_worker].[WorkersId] FROM [tbl_worker] INNER JOIN [tbl_login] ON [tbl_login].[Id]=[tbl_worker].[WorkersId] INNER JOIN [dbo].[tbl_employees] on [dbo].[tbl_employees].[workersid]= [tbl_worker].[WorkersId] where [dbo].[tbl_employees].[growersid]=@0 ORDER BY [tbl_worker].[FirstName]", con);
            com.Parameters.AddWithValue("@0", Session["Id"]);

            SqlDataReader reader = com.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    cbo_worker.Items.Add(new ListItem(Convert.ToString(reader["FirstName"]) + " " + Convert.ToString(reader["LastName"]), Convert.ToString(reader["workersId"])));
                }
            }

            cbo_worker_SelectedIndexChanged(null, null);

        }

    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {


        //Response.Redirect("ContractorAssignPay.aspx");


        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["KiwihortData"].ConnectionString);

        con.Open();

        SqlCommand com = new SqlCommand("UPDATE tbl_worker SET payrate = @0 FROM tbl_duty WHERE WorkersId = @1", con);
        com.Parameters.AddWithValue("@0", txt_pay.Text);
        com.Parameters.AddWithValue("@1", cbo_worker.SelectedValue.ToString());

        com.ExecuteReader();

        com.Dispose();
    }

    protected void cbo_worker_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["KiwihortData"].ConnectionString);

        con.Open();

        SqlCommand com = new SqlCommand("SELECT payrate FROM tbl_worker WHERE workersID = @0", con);
        com.Parameters.AddWithValue("@0", cbo_worker.SelectedValue.ToString());

        txt_pay.Text = com.ExecuteScalar().ToString();

        if (!txt_pay.Text.ToString().Contains('.'))
        {
            txt_pay.Text = txt_pay.Text.ToString() + ".00";
        }
        else if (txt_pay.Text.ToString().Length - txt_pay.Text.ToString().IndexOf(".") == 2)
        {
            txt_pay.Text = txt_pay.Text.ToString() + "0";
        }
        else
        {
            txt_pay.Text = txt_pay.Text.ToString();
        }
    }
}