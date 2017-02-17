using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using System.Web.Services;
using System.IO;
public partial class Supervisor_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
}