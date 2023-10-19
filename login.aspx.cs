using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestProject
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }

        protected void Logindata_Click(object sender, EventArgs e)
        {
            if (em.Value == "admin@nie.com" && pswd.Value == "admin@22")
            {
                Session["email"] = em.Value;
                Response.Redirect("adashboard.aspx");
            }
            else if (em.Value == "admin@nie.com" && pswd.Value != "admin@22")
            {

                Response.Write("<script>alert('Incorrect Password');</script>");
            }
            else
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Constr"].ToString());

                con.Open();

                string query = "select * from userdata where em='" + em.Value + "' and pswd='" + pswd.Value + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    Session["email"] = em.Value;
                    Response.Redirect("udashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('user not registered');</script>");
                }
                con.Close();
            }
        }
    }
}