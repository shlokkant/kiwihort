using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Services;
using System.IO;
using System.Text;

public partial class Supervisor_SupervisorAttendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }



         ((Label)Master.FindControl("lbl_title")).Text = "Dashboard";

        dateConverter d = new dateConverter();
        DateTime dt = d.convertUTCtoNZT(DateTime.UtcNow);

        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add("wday", dt.Month.ToString() + "/" + dt.Day.ToString() + "/" + dt.Year.ToString());
        SqlDataSource1.SelectParameters.Add("name", Session["Id"].ToString());
        SqlDataSource1.DataBind();

        SqlDataSource2.SelectParameters.Clear();
        SqlDataSource2.SelectParameters.Add("wday", dt.Month.ToString() + "/" + dt.Day.ToString() + "/" + dt.Year.ToString());
        SqlDataSource2.SelectParameters.Add("name", Session["Id"].ToString());
        SqlDataSource2.DataBind();

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["KiwihortData"].ConnectionString);



        try
        {
            con.Open();

            SqlCommand com = new SqlCommand("SELECT RosterID from tbl_Attendance", con);
            SqlCommand com2 = new SqlCommand("SELECT End_time FROM tbl_Attendance INNER JOIN tbl_duty ON tbl_attendance.rosterID=tbl_duty.rosterID WHERE tbl_duty.supervisorid = @0 and tbl_duty.day = @1 AND Start_time is not null order by tbl_attendance.rosterId ASC", con);
            com2.Parameters.AddWithValue("@0", Session["Id"].ToString());
            com2.Parameters.AddWithValue("@1", dt.Month.ToString() + "/" + dt.Day.ToString() + "/" + dt.Year.ToString());

            int countHiden = 0;
            int row = 0;
            foreach (var row2 in GridView3.Rows)
            {
                int count = 0;
                SqlDataReader reader = com.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        if (reader.GetInt64(0).ToString() == GridView3.DataKeys[row].Values["RosterID"].ToString())
                        {
                            //CheckBox cb = GridView3.Rows[row].FindControl("chkRow") as CheckBox;
                            //cb.Checked = true;
                            GridView3.Rows[row].Visible = false;
                            countHiden++;
                        }
                        count++;
                    }
                }

                reader.Close();
                row++;
            }

            ContentPlaceHolder myContent = (ContentPlaceHolder)this.Master.FindControl("cph_mainSection");
            if (countHiden == GridView3.Rows.Count)
            {
                myContent.FindControl("startTimesContent").Visible = false;
                myContent.FindControl("startTimesEmpty").Visible = true;
            }
            else
            {
                myContent.FindControl("startTimesContent").Visible = true;
                myContent.FindControl("startTimesEmpty").Visible = false;
            }

            SqlDataReader reader2 = com2.ExecuteReader();
            countHiden = 0;
            row = 0;
            foreach (var row2 in GridView4.Rows)
            {
                //int count = 0;

                if (reader2.HasRows)
                {
                    if (reader2.Read())
                    {
                        if (reader2.GetValue(0) != DBNull.Value)
                        {
                            GridView4.Rows[row].Visible = false;
                            countHiden++;
                        }
                    }

                    //while (reader.Read())
                    {

                        //if (reader.GetValue(0) == DBNull.Value)
                        {
                            //CheckBox cb = GridView3.Rows[row].FindControl("chkRow") as CheckBox;
                            //cb.Checked = true;
                            //GridView4.Rows[row].Visible = false;
                        }
                        //count++;
                    }
                }

                row++;
            }

            if (countHiden == GridView4.Rows.Count)
            {
                myContent.FindControl("endTimesContent").Visible = false;
                myContent.FindControl("endTimesEmpty").Visible = true;
            }
            else
            {
                myContent.FindControl("endTimesContent").Visible = true;
                myContent.FindControl("endTimesEmpty").Visible = false;
            }

            reader2.Close();

            for (int row2 = 0; row2 < GridView3.Rows.Count; row2++)
            {

                SqlCommand comBlock = new SqlCommand("SELECT * FROM tbl_blocks WHERE farmId = (SELECT farmId FROM tbl_shift where shiftid = @0)", con);
                comBlock.Parameters.AddWithValue("@0", GridView3.DataKeys[row2].Values["ShiftID"].ToString());

                SqlDataReader reader = comBlock.ExecuteReader();

                //foreach(var rowBlock in )
                while (reader.Read())
                {
                    DropDownList cbo_bloc = (DropDownList)GridView3.Rows[row2].Cells[5].Controls[1];
                    cbo_bloc.Items.Add(new ListItem(reader.GetValue(1).ToString(), reader.GetValue(0).ToString()));
                }





                //reader.Close();
            }


        }
        catch (Exception err2)
        {
            Session["error"] = err2.ToString();
            Response.Redirect("~/Debug.aspx");
        }


        if (String.Equals(Session["shift"], "END"))
        {
            Mv1.ActiveViewIndex = 1;
        }
        else
        {
            Mv1.ActiveViewIndex = 0;
        }
        //GridView3.Columns[0].Visible = false;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void test(object sender, EventArgs e)
    {
        UploadImage(@"e:/ ");

    }
    protected void btn_startSubmit_Click(object sender, EventArgs e)
    {
        int checkedIndex = -1;
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["KiwihortData"].ConnectionString);
        //SupervisorHome sm = new global::SupervisorHome();
        //GridView gw = sm.FindControl("Gridview3") as GridView;

        int rowCount = GridView3.Rows.Count;

        dateConverter d = new dateConverter();
        DateTime dt = d.convertUTCtoNZT(DateTime.UtcNow);

        bool[] rowBool = new bool[rowCount];

        try
        {
            con.Open();

            //The section below could do with some imporovement to help relay the correct information to the user, and become more intuitive

            SqlCommand com = null;
            int count = 0;

            foreach (GridViewRow row in GridView3.Rows)
            {
                TextBox dhu = row.FindControl("txt_time") as TextBox;

                CheckBox chkC = row.FindControl("chkRow") as CheckBox;
                if (chkC.Checked) //If the checkbox has been checked
                {
                    com = new SqlCommand("BEGIN IF NOT EXISTS (SELECT * FROM tbl_attendance WHERE RosterID = @0) BEGIN INSERT INTO tbl_attendance (RosterID, Start_time, blockId, startsignature) VALUES (@0, @1, @2, @3) END END", con);
                    //HiddenField hd = row.FindControl("RosterID") as HiddenField;
                    //string str = hd.Value;

                    DropDownList dl = (DropDownList)row.FindControl("cbo_block");


                    com.Parameters.AddWithValue("@0", GridView3.DataKeys[count].Values["RosterID"].ToString());

                    com.Parameters.AddWithValue("@1", (row.Cells[3].Text));
                    com.Parameters.AddWithValue("@2", dl.SelectedIndex.ToString());

                    com.Parameters.AddWithValue("@3", pathimg = "~/signaturePictures/" + GridView3.DataKeys[count].Values["RosterID"].ToString() + dt.ToString().Replace(':', '-').Replace('/', '-').Replace('\\', '-').Replace(' ', '-') + ".png");

                    com.ExecuteReader();
                    checkedIndex = count;
                }
                else if (dhu.Text != "") // if no time value is entered
                {
                    com = new SqlCommand("BEGIN IF NOT EXISTS (SELECT * FROM tbl_attendance WHERE RosterID = @0) BEGIN INSERT INTO tbl_attendance (RosterID, Start_time, blockId, startsignature) VALUES (@0, @1, @2, @3) END END", con);
                    //HiddenField hd = row.FindControl("RosterID") as HiddenField;
                    //string str = hd.Value;
                    com.Parameters.AddWithValue("@0", GridView3.DataKeys[count].Values["RosterID"].ToString());



                    TextBox time = row.FindControl("txt_time") as TextBox;

                    com.Parameters.AddWithValue("@1", time.Text);
                    //add 'cbo_block' into insert
                    com.Parameters.AddWithValue("@2", row.FindControl("cbo_block"));

                    com.ExecuteReader();

                }

                count++;
            }


            // com.Dispose();
        }
        catch (Exception err1)
        {
            Session["error"] = err1.ToString();
            Response.Redirect("~/Debug.aspx");
        }
        Session["shift"] = "START";

        //SqlCommand com = new SqlCommand("SELECT", con);


        Response.Redirect(Request.RawUrl);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Mv1.ActiveViewIndex = 0;

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Mv1.ActiveViewIndex = 1;



    }

    protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {

        //string s = Session["draw"].ToString();
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["KiwihortData"].ConnectionString);

        int rowCount = GridView3.Rows.Count;
        bool[] rowBool = new bool[rowCount];

        try
        {
            con.Open();


            SqlCommand com = null;
            int count = 0;


            dateConverter d = new dateConverter();
            DateTime dt = d.convertUTCtoNZT(DateTime.UtcNow);

            foreach (GridViewRow row in GridView4.Rows)
            {
                TextBox dhu = row.FindControl("txt_time") as TextBox;
                CheckBox chkC = row.FindControl("chkRow") as CheckBox;
                if (chkC.Checked) //if the checkbox is checked
                {
                    com = new SqlCommand("UPDATE tbl_attendance SET End_time = @0, breaktime = @2, total_hours = (SELECT DATEDIFF(minute, (SELECT start_time FROM tbl_attendance WHERE rosterID = @1), @0) - @2), endsignature = @3 WHERE RosterID = @1", con);
                    //HiddenField hd = row.FindControl("RosterID") as HiddenField;
                    //string str = hd.Value;
                    com.Parameters.AddWithValue("@1", Convert.ToInt32(GridView4.DataKeys[count].Values["RosterID"]));

                    TextBox timeBreak = row.FindControl("txt_break") as TextBox;

                    com.Parameters.AddWithValue("@0", row.Cells[3].Text.ToString());
                    if (timeBreak.Text != "")
                    {
                        com.Parameters.AddWithValue("@2", Convert.ToInt32(timeBreak.Text));
                    }
                    else
                    {
                        com.Parameters.AddWithValue("@2", 0);
                    }

                    com.Parameters.AddWithValue("@3", pathimg = "~/signaturePictures/" + GridView3.DataKeys[count].Values["RosterID"].ToString() + dt.ToString().Replace(':', '-').Replace('/', '-').Replace('\\', '-').Replace(' ', '-') + ".png");

                    com.ExecuteReader();
                }

                else if (dhu.Text != "") //If no time is entered
                {
                    //  com = new SqlCommand("UPDATE tbl_attendance SET End_time = @0, breaktime = (SELECT CONVERT(varchar(5), DATEADD(minute, @2, 0), 114)), total_hours = (SELECT CONVERT(varchar(5), DATEADD(minute, (SELECT @2 * -1), (SELECT CONVERT(varchar(5), DATEADD(minute, DATEDIFF(minute, (SELECT start_time FROM tbl_attendance WHERE rosterID = @1), @0), 0), 114))), 114)) WHERE RosterID = @1", con);
                    //HiddenField hd = row.FindControl("RosterID") as HiddenField;

                    //Label1.Text = DateTime.Now.ToString();
                    com = new SqlCommand("UPDATE tbl_attendance SET End_time = @0, breaktime = @2, total_hours = (SELECT DATEDIFF(minute, (SELECT start_time FROM tbl_attendance WHERE rosterID = @1), @0) - @2), endsignature = @3 WHERE RosterID = @1", con);
                    //string str = hd.Value;
                    com.Parameters.AddWithValue("@1", Convert.ToInt32(GridView4.DataKeys[count].Values["RosterID"]));



                    TextBox time = row.FindControl("txt_time") as TextBox;

                    TextBox timeBreak = row.FindControl("txt_break") as TextBox;

                    com.Parameters.AddWithValue("@0", time.Text);
                    if (timeBreak.Text != "")
                    {
                        com.Parameters.AddWithValue("@2", Convert.ToInt32(timeBreak.Text));
                    }
                    else
                    {
                        com.Parameters.AddWithValue("@2", 0);
                    }

                    com.Parameters.AddWithValue("@3", pathimg = "~/signaturePictures/" + GridView3.DataKeys[count].Values["RosterID"].ToString() + dt.ToString().Replace(':', '-').Replace('/', '-').Replace('\\', '-').Replace(' ', '-') + ".png");

                    com.ExecuteReader();

                    //Label2.Text = DateTime.Now.ToString();
                    //TimeSpan st = Convert.ToDateTime(Label2.Text).Subtract(Convert.ToDateTime(Label1.Text));
                    //Label2.Text = "total time:" + st.ToString();

                    /// rajan code

                    //Label3.Text = DateTime.Now.ToString();
                    //SqlCommand comR = new SqlCommand("SELECT start_time FROM tbl_attendance WHERE RosterID = @1", con);

                    //comR.Parameters.AddWithValue("@1", GridView4.DataKeys[count].Values["RosterID"].ToString());

                    //SqlDataReader readerR = comR.ExecuteReader();
                    //string str = null;
                    //while (readerR.Read())
                    //{
                    //    str = readerR[0].ToString();
                    //}
                    //DateTime sst = DateTime.Parse(str);
                    //DateTime et = DateTime.Parse(time.Text);
                    //TimeSpan minutes = et.Subtract(sst);
                    //double i = (minutes.TotalMinutes) - Convert.ToInt32(timeBreak.Text);

                    //comR.Dispose();

                    //SqlCommand comRr = new SqlCommand("UPDATE tbl_attendance SET End_time = @0, breaktime = @2, total_hours = @3 WHERE RosterID = @1", con);
                    //comRr.Parameters.AddWithValue("@0", time.Text);
                    //comRr.Parameters.AddWithValue("@1", Convert.ToInt32(GridView4.DataKeys[count].Values["RosterID"]));
                    //if (timeBreak.Text != "")
                    //{
                    //    comRr.Parameters.AddWithValue("@2", Convert.ToInt32(timeBreak.Text));
                    //}
                    //else
                    //{
                    //    comRr.Parameters.AddWithValue("@2", 0);
                    //}
                    //comRr.Parameters.AddWithValue("@3", i);

                    //Label4.Text = DateTime.Now.ToString();
                    //TimeSpan styy = Convert.ToDateTime(Label4.Text).Subtract(Convert.ToDateTime(Label3.Text));

                    //Label4.Text = "total time:" + styy.ToString();
                }


                count++;
            }

            if (com != null)
            {

                com.Dispose();
            }

        }
        catch (Exception err2)
        {
            Session["error"] = err2.ToString();
            Response.Redirect("~/Debug.aspx");
        }
        Session["shift"] = "END";
        //   string test = " (function test() {    var canvas = document.getElementById('thecanvas');var image = document.getElementById(\"thecanvas\").toDataURL(\"image/png\");image = image.replace('data:image/png;base64,', ''); $.ajax({type: 'POST', url: 'SupervisorHome.aspx/UploadImage', data: '{ \"imageData\" : \"' + image + '\" }', contentType: 'application/json; charset=utf-8', dataType: 'json',success: function(msg) { alert('Image saved successfully!');}});});";
        //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "test()", true);
        //     string test = "function test() {alert ('testing');}";
        //     ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", test, true);
        ////     ScriptManager.RegisterClientScriptBlock(this,this.GetType(), "text", test, true);
        //    // Response.Redirect(Request.RawUrl);

    }


    static string pathimg = @"e:/";
    static int counter = 0;
    static string fileNameWitPath = "";
    public static Action NonStatic;
    [WebMethod]

    public static void UploadImage(string imageData)
    {
        if (String.Compare("e:/", pathimg) != 0)
        {
            fileNameWitPath = HttpContext.Current.Server.MapPath(pathimg);

            using (FileStream fs = new FileStream(fileNameWitPath, FileMode.Create))
            {

                using (BinaryWriter bw = new BinaryWriter(fs))

                {

                    byte[] data = Convert.FromBase64String(imageData);

                    bw.Write(data);

                    bw.Close();
                }


            }
            counter++;
        }

    }
    [WebMethod()]

    protected void chkview_CheckedChanged(object sender, EventArgs e)
    {
        //GridViewRow row = ((GridViewRow)((CheckBox)sender).NamingContainer);
        //int index = row.RowIndex;
        //CheckBox cb1 = (CheckBox)GridView3.Rows[index].FindControl("chkRow");
        //TextBox txt = (TextBox)GridView3.Rows[index].FindControl("txt_time");
        //if (cb1.Checked)
        //{

        //    txt.Text = "--:-- --";

        //    txt.Style.Add("pointer-events", "none");

        //}
        //else
        //{
        //    txt.Style.Add("pointer-events", "auto");
        //}

        //here you can find your control and get value(Id).


    }


    //protected void Button4_Click(object sender, EventArgs e)
    //{
    //    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "test()", true);

    //    //string gg = Label1.ClientID.ToString();
    //    string str = fileNameWitPath;

    //    //var sb = new StringBuilder();
    //    //Label l = (Label)this.FindControl(gg);
    //    //l.RenderControl(new HtmlTextWriter(new StringWriter(sb)));
    //    //string str = sb.ToString();

    //         //string fileNameWitPath = path + DateTime.Now.ToString().Replace("/", "-").Replace(" ", "- ").Replace(":", "") + ".png";

    //    //using (FileStream fs = new FileStream(fileNameWitPath, FileMode.Create))
    //    //{

    //    //    using (BinaryWriter bw = new BinaryWriter(fs))

    //    //    {

    //    //        byte[] data = Convert.FromBase64String(str);

    //    //        bw.Write(data);

    //    //        bw.Close();
    //    //    }


    //    //}


    //    //string p = Image1.ImageUrl;
    //    //System.Drawing.Image im = System.Drawing.Image.FromFile(p);
    //    //im.Save("e:/test.jpg");

    //}

    protected void Button4_Click(object sender, EventArgs e)
    {

    }
}