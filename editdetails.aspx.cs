using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace TestProject
{
    public partial class editdetails : System.Web.UI.Page
    {
        string constr = ConfigurationManager.AppSettings["Constr"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.Params["id"].ToString();

            SqlConnection con = new SqlConnection(constr);
            con.Open();
            string query = "SELECT * FROM userdata WHERE id= '" + id + "'";

            SqlCommand command = new SqlCommand(query, con);
            SqlDataReader reader = command.ExecuteReader();

            reader.Read();
                
            string name = reader["nm"].ToString();
            string email = reader["em"].ToString();
            string phone = reader["ph"].ToString();
            string gender = reader["gen"].ToString();
            string department = reader["dpt"].ToString();
            string password = reader["pswd"].ToString();

            nm.Value = name;
            em.Value = email;
            ph.Value = phone;
            gen.Value = gender;
            dpt.Value = department;
            pswd.Value = password;
            
            con.Close();

        }
        protected void Updatedata_Click(object sender, EventArgs e)
        {
            string id = Request.Params["id"].ToString();

            //Step 1 - Idetify database path
            SqlConnection con = new SqlConnection(constr);

            //Step 2 - Open Connection
            con.Open();

            //step 3 - create  query

            string query = "update userdata set nm='" + nm.Value + "',ph='" + ph.Value + "',gen='" + gen.Value + "',dpt='" + dpt.Value + "',pswd='" + pswd.Value + "'where em ='" + em.Value + "'";


            //Step 4 - Execute query
            SqlCommand cmd = new SqlCommand(query, con);
            int rowsaffected = cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Successfully Updated!'); window.location.href = 'ausermgnt.aspx';</script>");
 
            con.Close();
            
        }
    }
}