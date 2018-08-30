using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DfltAdmin : System.Web.UI.Page
{
    DataTable xDT=new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RadioButtonList1.SelectedIndex = -1;
            Session["URLImagen"] = string.Empty;
            Session["URLAdjunto"] = string.Empty;
        }

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //lblError.Text= RadioButtonList1.SelectedValue.ToString();
        xDT = MainClass.xGetFromSQL(string.Format("SELECT T0.tema,T0.contenido,T0.imagen,T0.adjunto FROM blog T0 WITH(NOLOCK) WHERE T0.id={0}", RadioButtonList1.SelectedValue.ToString()));
        if (xDT.Rows.Count > 0)
        {
            ASPxTextBox1.Text = xDT.Rows[0]["tema"].ToString();
            ASPxHtmlEditor1.Html = xDT.Rows[0]["contenido"].ToString();
            Session["URLImagen"]=xDT.Rows[0]["imagen"].ToString();
            Session["URLAdjunto"] = xDT.Rows[0]["adjunto"].ToString();
        }
    }
    protected void ASPxButton2_Click(object sender, EventArgs e)
    {
        ASPxTextBox1.Text = string.Empty;
        ASPxHtmlEditor1.Html = string.Empty;
        ASPxUploadControl1.NullText = string.Empty;
        ASPxUploadControl2.NullText = string.Empty;
        Session["URLImagen"] = string.Empty;
        Session["URLAdjunto"] = string.Empty;
        ASPxTextBox1.Focus();
        RadioButtonList1.SelectedIndex = -1;
    }
    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(ASPxTextBox1.Text) && !string.IsNullOrEmpty(ASPxHtmlEditor1.Html) && !string.IsNullOrEmpty(Session["URLImagen"].ToString()))
            {
                string xSentence = string.Empty;
                if (RadioButtonList1.SelectedIndex == -1)
                {
                    xSentence = string.Format(@"INSERT INTO blog (tema,contenido,imagen,usuario,fecha,etiquetas,adjunto)
VALUES('{0}','{1}','{2}','{3}','{4}','','{5}')", ASPxTextBox1.Text, ASPxHtmlEditor1.Html, Session["URLImagen"].ToString(), "manager", DateTime.Now.ToString("yyyy-MM-dd"), Session["URLAdjunto"].ToString());
                    //lblError.Text = xSentence;
                    MainClass.xPOSTToSQL(xSentence);
                }
                else
                {
                    if (CheckBox1.Checked)
                    {
                        xSentence = string.Format(@"UPDATE blog SET [DELETE]=1 WHERE id={0}", RadioButtonList1.SelectedValue.ToString());
                        MainClass.xPOSTToSQL(xSentence);
                    }
                    else
                    {
                        xSentence = string.Format(@"UPDATE blog SET tema='{0}',contenido='{1}',imagen='{2}',usuario='manager',adjunto='{3}'
WHERE id={4}", ASPxTextBox1.Text, ASPxHtmlEditor1.Html, Session["URLImagen"].ToString(), Session["URLAdjunto"].ToString(), RadioButtonList1.SelectedValue.ToString());
                        MainClass.xPOSTToSQL(xSentence);
                    }
                }
                Response.Redirect("~/Admin/DfltAdmin.aspx");

            }
            else
            {
                lblError.Text = "No se ha especificado Tema o Descripcion";
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.ToString();
        }
    }
    protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
    {
        Session["URLImagen"]=xUploadFiles(ASPxUploadControl1);
    }

    protected void ASPxUploadControl2_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
    {
        Session["URLAdjunto"] = xUploadFiles(ASPxUploadControl2);
    }


    string xUploadFiles(DevExpress.Web.ASPxUploadControl x)
    {
        string xReturn=string.Empty;
        if (x.UploadedFiles != null && x.UploadedFiles.Length > 0)
        {
            for (int i = 0; i < x.UploadedFiles.Length; i++)
            {
                if (x.UploadedFiles[i].FileName != "")
                {
                    xReturn = string.Format("{0}{1}", MapPath("~/img/"), x.UploadedFiles[i].FileName);
                    x.UploadedFiles[i].SaveAs(xReturn, true);
                    xReturn = x.UploadedFiles[i].FileName;
                }
            }
        }
        return xReturn;
    }
}