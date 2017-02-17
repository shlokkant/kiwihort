using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using System.Web.Services;
using System.IO;

[ScriptService]
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        this.FindControl("thecanvas");
    }
    static string path = @"e:/";
    [WebMethod()]
   
    public static void UploadImage(string imageData)
    {

        string fileNameWitPath = path + DateTime.Now.ToString().Replace("/", "-").Replace(" ", "- ").Replace(":", "") + ".png";

        using (FileStream fs = new FileStream(fileNameWitPath, FileMode.Create))
        {

            using (BinaryWriter bw = new BinaryWriter(fs))

            {

                byte[] data = Convert.FromBase64String(imageData);

                bw.Write(data);

                bw.Close();
            }

        }

    }
    [WebMethod()]
    public static void Button1_Click1(object sender, EventArgs e)
    {
        //Label1.Text = "done";
        
    }
}