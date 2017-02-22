﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        if(Session["registerNew"] != null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please accept the confirmation email before logging in.');", true);
            Session.Clear();
        }

        //if (txt_email.Text == "admin@kiwihort.com" && txt_password.Text == "Kiwihort1234")
        //{
        //    Session["email"] = "admin@admin.com";
        //    Session["flag"] = true;
        //    if (Convert.ToString(cbo_loginAs.Text) == "Contractor")
        //    {
        //        Session["Id"] = "grower4";
        //        Response.Redirect("Contractor/ContractorHome.aspx");
        //    }
        //    else if (Convert.ToString(cbo_loginAs.Text) == "Worker")
        //    {

        //        Session["Id"] = "worker1";
        //        Response.Redirect("Worker/WorkerHome.aspx");

        //    }
        //    else
        //    {
        //        Session["Id"] = "worker6";
        //        Response.Redirect("Supervisor/SupervisorHome.aspx");
        //    }

        //}
        //else
        //{
        //    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Your username or password was incorrect');", true);
        //}

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["KiwihortData"].ConnectionString);

        con.Open();

        SqlCommand com = new SqlCommand("SELECT * FROM tbl_login WHERE type = @0 AND email = @1 AND password = @2", con);
        com.Parameters.AddWithValue("@0", cbo_loginAs.Text.ToString());
        com.Parameters.AddWithValue("@1", txt_email.Text.ToString());
        com.Parameters.AddWithValue("@2", txt_password.Text.ToString());

        SqlDataReader reader = com.ExecuteReader();

        if (reader.HasRows)
        {
            // <!--SKIP AUTHENTICATION --!>
            //if (reader.Read())
            //{
            //    string str = reader.GetString(reader.GetOrdinal("Id"));


            //    Session["Id"] = str;
            //    Session["email"] = reader.GetString(reader.GetOrdinal("email"));
            //    if (Convert.ToString(cbo_loginAs.Text) == "Contractor")
            //    {
            //        Response.Redirect("Contractor/ContractorHome.aspx");
            //    }
            //    else
            //    {
            //        Response.Redirect("Worker/WorkerHome.aspx");

            //    }
            //}
            if (reader.Read())
            {
                string str = reader.GetString(reader.GetOrdinal("Id"));

                SqlCommand comact = new SqlCommand("Select * from tbl_UserAct WHERE Id = @0 ", con);
                comact.Parameters.AddWithValue("@0", str);
                SqlDataReader act = comact.ExecuteReader();

                if (act.HasRows)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please active your account');", true);
                }
                else
                {
                    Session["Id"] = str;
                    Session["email"] = reader.GetString(reader.GetOrdinal("email"));
                    Session["flag"] = true;
                    if (Convert.ToString(cbo_loginAs.Text) == "Contractor")
                    {
                        Response.Redirect("Contractor/ContractorHome.aspx");
                    }
                    else if (Convert.ToString(cbo_loginAs.Text) == "Worker")
                    {

                        Response.Redirect("Worker/WorkerHome.aspx");

                    }
                    else if(Convert.ToString(cbo_loginAs.Text) == "Supervisor")
                    {
                        Response.Redirect("Supervisor/SupervisorHome.aspx");
                    }
                    else
                    {
                        Response.Redirect("Monitor/MonitorHome.aspx");
                    }
                }
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Your username or password was incorrect');", true);
        }

        con.Close();
        con.Dispose();
    }

   
}