using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using work01.Models;

namespace work01.DAL
{
    public class RankGetWay
    {
        public static string connectionString = "Data Source=.;Initial Catalog=AirmanDB2;Integrated Security=True";
        SqlConnection connection = new SqlConnection(connectionString);
        public IQueryable<Rank> GetRanks()
        {
            DataTable dataTable = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT * FROM tbl_Rank",connection);
            dataAdapter.Fill(dataTable);
            return dataTable.AsEnumerable()
                .Select(r => new Rank
                {
                    rankId = r.Field<int>("rankId"),
                    rankName = r.Field<string>("rankName")
                })
                .AsQueryable();
        }

        public void Insert(Rank rank)
        {
            SqlCommand command = new SqlCommand(@"INSERT INTO tbl_Rank VALUES(@r)",connection);
            command.Parameters.AddWithValue("@r",rank.rankName);
            connection.Open();
            command.ExecuteNonQuery(); 
            connection.Close();
        }
    }
}