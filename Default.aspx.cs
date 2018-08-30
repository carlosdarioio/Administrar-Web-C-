using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    string CV3()
    {
        string contenido = "";
        string dd = "";
        string tema = txt3.ToString();

        //Response.Write(fcf.Text);
        string strCon = @"Server=10.1.1.199;Uid=sa;Pwd=Server01;DataBase=blog";
        string QueryTipoVacante = "SELECT  * FROM blog WHERE [DELETE]!=1 and id ="+tema;//where id = 5 ORDER BY id DESC
        System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(QueryTipoVacante, strCon);
        System.Data.DataTable dt = new System.Data.DataTable();
        da.Fill(dt);
        int count = dt.Rows.Count;
        for (int i = 0; i < count; i++)
        {

            contenido = Server.HtmlDecode(dt.Rows[i]["contenido"].ToString());
            dd = dt.Rows[i]["id"].ToString();
            tema = dt.Rows[i]["contenido"].ToString();

        }//fin for*/




        return tema;
    }
    
}