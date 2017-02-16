using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SendEmail se = new SendEmail();
        string to = "rajan@hypernova.co.nz";
        string sub = "Contact Us Form";
        string body = txtname.Text + ",/br Contect Us Query From :" + txtemail.Text + "/br" + TextBox1.Text;
        se.EmailSend(to, sub, body);

    }
}