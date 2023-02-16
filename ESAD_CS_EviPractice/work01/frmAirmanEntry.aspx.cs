using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace work01
{
    public partial class frmAirmanEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            FileUpload fu = DetailsView1.FindControl("FileUploadPicture") as FileUpload;
            if (fu.HasFile)
            {
                string fileName =Guid.NewGuid()+"_"+Path.GetExtension(fu.FileName);
                fu.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
                e.Values["picture"] = fileName;
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string name = args.Value;
            if (name.Length >= 4)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
                return;
            }
        }
    }
}