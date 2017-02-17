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

public partial class Contractor_ContractorReport : System.Web.UI.Page
{
    protected void Page_Load(object moveIcon, EventArgs e)
    {




        int cbo_day_index = cbo_day.SelectedIndex;
        int cbo_week_index = cbo_week.SelectedIndex;
        int cbo_farm_index = cbo_farm.SelectedIndex;


        ((Label)Master.FindControl("lbl_title")).Text = "Report";

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["KiwihortData"].ConnectionString);

        con.Open();

        dateConverter d = new dateConverter();

        SqlCommand comMin = new SqlCommand("SELECT min(Day) FROM tbl_Duty", con);
        SqlCommand comMax = new SqlCommand("SELECT max(Day) FROM tbl_Duty", con);

        DateTime dayMin = d.convertUTCtoNZT((DateTime)comMin.ExecuteScalar());
        DateTime dayMax = d.convertUTCtoNZT((DateTime)comMax.ExecuteScalar());
        cbo_day.Items.Clear();
        cbo_farm.Items.Clear();
        cbo_day.Items.Add("Select a day");

        for(var count = dayMax; count >= dayMin; count = count.AddDays(-1))
        {
            cbo_day.Items.Add(new ListItem(count.Date.ToString("d/M/yyyy") + " - " + count.DayOfWeek.ToString(), d.convertNZTtoUTC(count.Date).ToString()));
        }

        var firstRun = true;

        cbo_week.Items.Clear();

        cbo_week.Items.Add("Select a week");

        //for (var count = dayMin; count <= dayMax; dayMin = dayMin.AddDays(1), count = count.AddDays(1))
        //{
        //    while (dayMin.DayOfWeek.ToString() != "Monday")
        //    {
        //        if (firstRun)
        //        {
        //            dayMin = dayMin.AddDays(-1);
        //        }
        //        else
        //        {
        //            dayMin = dayMin.AddDays(1);
        //            count = count.AddDays(1);
        //        }
        //    }
        //    firstRun = false;
        //    cbo_week.Items.Add(new ListItem(dayMin.Day.ToString() + "/" + dayMin.Month.ToString() + "/" + dayMin.Year.ToString(), d.convertNZTtoUTC(dayMin).ToString()));

        //}
        
        for (var count = dayMax; count >= dayMin; dayMax = dayMax.AddDays(-1), count = count.AddDays(-1))
        {
            while (dayMax.DayOfWeek.ToString() != "Monday")
            {
                if (firstRun)
                {
                    dayMax = dayMax.AddDays(-1);
                }
                else
                {
                    dayMax = dayMax.AddDays(-1);
                    count = count.AddDays(-1);
                }
            }
            firstRun = false;
            cbo_week.Items.Add(new ListItem(dayMax.Day.ToString() + "/" + dayMax.Month.ToString() + "/" + dayMax.Year.ToString(), d.convertNZTtoUTC(dayMax).ToString()));

        }

        SqlCommand comFarm = new SqlCommand("SELECT Farm_Name, farmid FROM tbl_farms", con);

        SqlDataReader reader = comFarm.ExecuteReader();

        if(reader.HasRows)
        {
            cbo_farm.Items.Add("Select a farm");
            while(reader.Read())
            {
                cbo_farm.Items.Add(new ListItem(reader.GetString(0), reader.GetString(1)));
            }
        }

        cbo_day.SelectedIndex = cbo_day_index;
        cbo_week.SelectedIndex = cbo_week_index;
        cbo_farm.SelectedIndex = cbo_farm_index;
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        dateConverter d = new dateConverter();


        if (cbo_farm.SelectedIndex != 0 && (cbo_week.SelectedIndex != 0 && Convert.ToBoolean(Session["day"]) == false) || (cbo_day.SelectedIndex != 0 && Convert.ToBoolean(Session["day"]) == true))
        {
            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectCommand = "SELECT tbl_worker.firstname AS 'Fisrt Name', tbl_worker.lastname AS 'Last Name', CONVERT(DECIMAL(10,2), tbl_attendance.total_hours/60) AS 'Total Hours' FROM tbl_attendance INNER JOIN tbl_duty on tbl_attendance.rosterid = tbl_duty.rosterid INNER JOIN tbl_worker on tbl_worker.workersid = tbl_duty.workerid INNER JOIN tbl_shift on tbl_duty.shiftid = tbl_shift.shiftid where tbl_duty.day = @day and tbl_duty.growerid = @grower and farmid = @farm and tbl_attendance.end_time is not null";
            //SqlDataSource1.SelectParameters.Add("supervisor", cbo_supervisor.ToString());
            if(Convert.ToBoolean(Session["day"]))
            {
                //SqlDataSource1.SelectParameters.Add("day", Convert.ToDateTime(cbo_day.SelectedValue).Date.ToString());
                //SqlDataSource1.SelectParameters.Add("day", "12/05/2016");
                SqlDataSource1.SelectParameters.Add("day", d.convertUTCtoNZT(Convert.ToDateTime(cbo_day.SelectedValue)).Month.ToString() + "/" + d.convertUTCtoNZT(Convert.ToDateTime(cbo_day.SelectedValue)).Day.ToString() + "/" + d.convertUTCtoNZT(Convert.ToDateTime(cbo_day.SelectedValue)).Year.ToString());
            }
            else
            {
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectCommand = "SELECT tbl_worker.firstname AS 'First Name', tbl_worker.lastname AS 'Last Name', sum(tbl_attendance.total_hours)/60 AS 'Total Hours' FROM tbl_attendance INNER JOIN tbl_duty on tbl_attendance.rosterid = tbl_duty.rosterid INNER JOIN tbl_worker on tbl_worker.workersid = tbl_duty.workerid INNER JOIN tbl_shift on tbl_duty.shiftid = tbl_shift.shiftid where tbl_duty.day BETWEEN @0 AND @1  and tbl_duty.growerid = @grower and farmid = @farm and tbl_attendance.end_time is not null group by tbl_worker.firstname,tbl_worker.lastname";
                SqlDataSource1.SelectParameters.Add("0", d.convertUTCtoNZT(Convert.ToDateTime(cbo_week.SelectedValue)).Month.ToString() + "/" + d.convertUTCtoNZT(Convert.ToDateTime(cbo_week.SelectedValue)).Day.ToString() + "/" + d.convertUTCtoNZT(Convert.ToDateTime(cbo_week.SelectedValue)).Year.ToString());

                SqlDataSource1.SelectParameters.Add("1", d.convertUTCtoNZT(Convert.ToDateTime(cbo_week.SelectedValue)).AddDays(7).Month.ToString() + "/" + d.convertUTCtoNZT(Convert.ToDateTime(cbo_week.SelectedValue)).AddDays(7).Day.ToString() + "/" + d.convertUTCtoNZT(Convert.ToDateTime(cbo_week.SelectedValue)).AddDays(7).Year.ToString());

            }
            SqlDataSource1.SelectParameters.Add("farm", cbo_farm.SelectedValue.ToString());
            SqlDataSource1.SelectParameters.Add("grower", Session["Id"].ToString());
            SqlDataSource1.DataBind();
        }
    }

    protected void cbo_day_SelectedIndexChanged(object sender, EventArgs e)
    {
        cbo_day.Style.Add("background-color", "#fff");
        cbo_day.Style.Add("border-color", "#89B53D");
        cbo_day.Style.Add("color", "#444");
        cbo_week.Style.Add("background-color", "rgba(200, 0, 0, 255)");
        cbo_week.Style.Add("border-color", "rgba(255, 0, 0, 200)");
        cbo_week.Style.Add("opacitiy", "0.8");
        cbo_week.Style.Add("color", "#fff");
        Session["day"] = true;
    }

    protected void cbo_week_SelectedIndexChanged(object sender, EventArgs e)
    {
        cbo_week.Style.Add("background-color", "#fff");
        cbo_week.Style.Add("border-color", "#89B53D");
        cbo_week.Style.Add("color", "#444");
        cbo_day.Style.Add("background-color", "rgba(200, 0, 0, 255)");
        cbo_day.Style.Add("border-color", "rgba(255, 0, 0, 200)");
        cbo_day.Style.Add("opacitiy", "0.8");
        cbo_day.Style.Add("color", "#fff");
        Session["day"] = false;
    }
}