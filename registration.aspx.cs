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
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void savedata_Click(object sender, EventArgs e)
        {
            //Step 1 - Idetify database path
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Constr"].ToString());

            //Step 2 - Open Connection
            try
            {
                con.Open();

                //Create Query to check if email exists
                string checkQuery = "SELECT COUNT(*) FROM userdata WHERE em = '" + em.Value + "'";
                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                int emailCount = (int)checkCmd.ExecuteScalar();

                if (emailCount > 0 )
                {
                    // Email already registered
                    Response.Write("<script>alert('Email already registered!');</script>");
                }
                else if(em.Value == "admin@nie.com")
                {
                    Response.Write("<script>alert('You cannot use this email!');</script>");
                }
                else
                {
                    //Step 3- Create Query
                    String query = "insert into userdata(nm,em,ph,gen,dpt,pswd) values('" + nm.Value + "','" + em.Value + "','" + ph.Value + "','" + gen.Value + "','" + dpt.Value + "','" + pswd.Value + "')";

                    //Step 4 - Execute query
                    SqlCommand cmd = new SqlCommand(query, con);
                    int rowsaffected = cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Successfully Registered!'); window.location.href = 'registration.aspx';</script>");
                }
            }
            //Response.Write("<script>alert('info saved');</script>");
            //Response.Redirect("index.aspx");

            catch (Exception ex)
            {
                Response.Write("<script>alert('Please Contact Admin');</script>");
            }
            //Step 5 - Close Connection
            finally
            {
                con.Close();
            }
        }

    }
}