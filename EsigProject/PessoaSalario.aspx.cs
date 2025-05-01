using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EsigProject
{
	public partial class PessoaSalario : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                LoadGrid();
            }
        }

        private void LoadGrid()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConexaoSQL"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT pessoa_id, pessoa_nome, cargo_nome, salario FROM pessoa_salario";
                using (SqlDataAdapter da = new SqlDataAdapter(query, conn))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void btnRecalcular_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConexaoSQL"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("calcular_salarios", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                cmd.ExecuteNonQuery(); // Executa a SP de recálculo
            }
            // Recarrega o GridView com os novos valores de salário
            LoadGrid();
        }

    }
}