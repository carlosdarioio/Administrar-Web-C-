using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de MainClass
/// </summary>
public class MainClass
{
	public MainClass()
	{
		
	}
    
    private static string xConnectionString
    {
        get
        {
            return ConfigurationManager.ConnectionStrings["Config"].ConnectionString;
        }
    }

    public static DataTable xGetFromSQL(string xSql)
    {
        try
        {
            DataTable xDT = new DataTable();
            using (SqlDataAdapter xDA = new SqlDataAdapter(xSql, xConnectionString))
            {
                xDA.SelectCommand.CommandTimeout = 600000;
                xDA.Fill(xDT);
            }           

            return xDT;
        }
        catch { throw; }
    }

    public static void xPOSTToSQL(string xSQL)
    {
        using (SqlCommand xCommand = new SqlCommand(xSQL, new SqlConnection(xConnectionString)))
        {
            xCommand.Connection.Open();
            xCommand.ExecuteNonQuery();
            xCommand.Connection.Close();
        }
    }
}