using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestProject
{
    public partial class ausermgnt : System.Web.UI.Page   
    {

        string constr = ConfigurationManager.AppSettings["Constr"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadUserData();
        }

        private void LoadUserData()
        {
            SqlConnection con = new SqlConnection(constr);
            string query = "SELECT * FROM userdata";
            SqlDataAdapter adp = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int rowIndex = e.NewEditIndex;
            string id = GridView1.Rows[rowIndex].Cells[0].Text;
            Response.Redirect("editdetails.aspx?id=" + id);
        }

        /*protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Write("window.location.href = 'ausermgnt.aspx';");
        }*/

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string id = GridView1.Rows[rowIndex].Cells[0].Text;

            SqlConnection con = new SqlConnection(constr);

            con.Open();
            string query = "DELETE FROM userdata WHERE id = '" + id + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            LoadUserData();
        }
    }
 }