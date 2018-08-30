using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DfltAdminCarrusel : System.Web.UI.Page
{
    DataTable xDT=new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RadioButtonList1.SelectedIndex = -1;
            Session["URLImagen"] = string.Empty;
        }

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //lblError.Text= RadioButtonList1.SelectedValue.ToString();
        xDT = MainClass.xGetFromSQL(string.Format("SELECT T0.tema,T0.Imagen,T0.url FROM carousel T0 with(nolock) WHERE T0.id={0}", RadioButtonList1.SelectedValue.ToString()));
        if (xDT.Rows.Count > 0)
        {
            ASPxTextBox1.Text = xDT.Rows[0]["tema"].ToString();
            
            Session["URLImagen"]=xDT.Rows[0]["imagen"].ToString();
        }
    }
    protected void ASPxButton2_Click(object sender, EventArgs e)
    {
        ASPxTextBox1.Text = string.Empty;
        ASPxUploadControl1.NullText = string.Empty;
        Session["URLImagen"] = string.Empty;
        ASPxTextBox2.Text = string.Empty;
        ASPxTextBox1.Focus();

        RadioButtonList1.SelectedIndex = -1;
    }
    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(ASPxTextBox1.Text) && !string.IsNullOrEmpty(Session["URLImagen"].ToString()))
            {
                string xSentence = string.Empty;
                if (RadioButtonList1.SelectedIndex == -1)
                {
                    xSentence = string.Format(@"INSERT INTO carousel (Tema,Imagen,URL) VALUES ('{0}','{1}','{2}') ", ASPxTextBox1.Text, Session["URLImagen"].ToString(), ASPxTextBox2.Text);
                    //lblError.Text = xSentence;
                    MainClass.xPOSTToSQL(xSentence);
                }
                else
                {
                    if (CheckBox1.Checked)
                    {
                        xSentence = string.Format(@"UPDATE carousel SET [DELETE]=1 WHERE id={0}", RadioButtonList1.SelectedValue.ToString());
                        MainClass.xPOSTToSQL(xSentence);
                    }
                    else
                    {
                        xSentence = string.Format(@"UPDATE carousel SET tema='{0}',imagen='{1}',URL='{2}' WHERE id={3}", ASPxTextBox1.Text,  Session["URLImagen"].ToString(), ASPxTextBox2.Text, RadioButtonList1.SelectedValue.ToString());
                        MainClass.xPOSTToSQL(xSentence);
                    }
                }
                Response.Redirect("~/Admin/DfltAdminCarrusel.aspx");

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