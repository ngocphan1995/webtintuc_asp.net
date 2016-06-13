using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Sql
/// </summary>
namespace NgocPhan
{
    public class SQL
    {
        private const string CONNECTION_STRING = @"server=NGOC-KUTE\NGOCPHANTHI;uid=sa;pwd=123456;database=D8CNPM";
        private SQL() { }

        public static SqlConnection GetConnection()
        {
            SqlConnection ret = new SqlConnection(CONNECTION_STRING);
            ret.Open();
            return ret;
        }
    }
}