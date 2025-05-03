using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.EnterpriseServices;
using System.Web.UI.WebControls;
using System.Web;


namespace EsigProject
{
    public partial class Pessoa : System.Web.UI.Page
    {
        string conexao = ConfigurationManager.ConnectionStrings["ConexaoSQL"].ConnectionString;

        // Busca os dados de Pessoas no banco e mostra no gridPessoas
        private void CarregarPessoas()
        {
            using (SqlConnection conn = new SqlConnection(conexao))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM pessoa", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gridPessoas.DataSource = dt;
                gridPessoas.DataBind();
            }
        }

        // Carrega os dados da tabela
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarPessoas();
            }
        }




        // Salva ou atualiza uma Pessoa
        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(conexao))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                if (string.IsNullOrEmpty(lblId.Text)) // Inserir
                {
                    // Gerar novo ID manualmente
                    SqlCommand getIdCmd = new SqlCommand("SELECT ISNULL(MAX(ID), 0) + 1 FROM pessoa", conn);
                    conn.Open();
                    float novoId = Convert.ToSingle(getIdCmd.ExecuteScalar());
                    conn.Close();

                    cmd.CommandText = @"INSERT INTO pessoa 
                                        (id, nome, cidade, email, cep, enderco, pais, usuario, telefone, data_nascimento, cargo_id) 
                                        VALUES 
                                        (@id, @nome, @cidade, @email, @cep, @enderco, @pais, @usuario, @telefone, @data_nascimento, @cargo_id)";

                    cmd.Parameters.AddWithValue("@id", novoId);
                }
                else // Atualizar
                {
                    cmd.CommandText = @"UPDATE pessoa SET 
                                        nome=@nome, cidade=@cidade, email=@email, cep=@cep, enderco=@enderco,
                                        pais=@pais, usuario=@usuario, telefone=@telefone, data_nascimento=@data_nascimento,
                                        cargo_id=@cargo_id 
                                        WHERE id=@id";

                    cmd.Parameters.AddWithValue("@id", float.Parse(lblId.Text));
                }

                cmd.Parameters.AddWithValue("@nome", txtNome.Text);
                cmd.Parameters.AddWithValue("@cidade", txtCidade.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@cep", txtCep.Text);
                cmd.Parameters.AddWithValue("@enderco", txtEndereco.Text);
                cmd.Parameters.AddWithValue("@pais", txtPais.Text);
                cmd.Parameters.AddWithValue("@usuario", txtUsuario.Text);
                cmd.Parameters.AddWithValue("@telefone", txtTelefone.Text);
                cmd.Parameters.AddWithValue("@data_nascimento", DateTime.Parse(txtDataNascimento.Text));
                cmd.Parameters.AddWithValue("@cargo_id", float.Parse(ddlCargo.SelectedValue));

                conn.Open();
                cmd.ExecuteNonQuery();

                // Chama a procedure para atualizar a tabela pessoa_salario
                SqlCommand cmdProc = new SqlCommand("calcular_salarios", conn);
                cmdProc.CommandType = CommandType.StoredProcedure;
                cmdProc.ExecuteNonQuery();
            }

            LimparCampos();
            CarregarPessoas();
        }



        protected void gridPessoas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gridPessoas.Rows[index];
            string id = row.Cells[0].Text;

            if (e.CommandName == "Editar")
            {
                using (SqlConnection conn = new SqlConnection(conexao))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM pessoa WHERE id=@id", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        lblId.Text = reader["id"].ToString();
                        txtNome.Text = Server.HtmlDecode(reader["nome"].ToString());
                        txtCidade.Text = Server.HtmlDecode(reader["cidade"].ToString());
                        txtEmail.Text = Server.HtmlDecode(reader["email"].ToString());
                        txtCep.Text = Server.HtmlDecode(reader["cep"].ToString());
                        txtEndereco.Text = Server.HtmlDecode(reader["enderco"].ToString());
                        txtPais.Text = Server.HtmlDecode(reader["pais"].ToString());
                        txtUsuario.Text = Server.HtmlDecode(reader["usuario"].ToString());
                        txtTelefone.Text = Server.HtmlDecode(reader["telefone"].ToString());

                        if (reader["data_nascimento"] != DBNull.Value)
                            txtDataNascimento.Text = Convert.ToDateTime(reader["data_nascimento"]).ToString("yyyy-MM-dd");

                        ddlCargo.Text = reader["cargo_id"].ToString();
                    }
                }
            }
            else if (e.CommandName == "Excluir")
            {
                using (SqlConnection conn = new SqlConnection(conexao))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM pessoa WHERE id=@id", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                CarregarPessoas();
            }
        }


        // Limpa os campos de texto
        private void LimparCampos()
        {
            lblId.Text = "";
            txtNome.Text = "";
            ddlCargo.Text = "";
            txtCidade.Text = "";
            txtEmail.Text = "";
            txtCep.Text = "";
            txtEndereco.Text = "";
            txtPais.Text = "";
            txtUsuario.Text = "";
            txtTelefone.Text = "";
            txtDataNascimento.Text = "";
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            LimparCampos();
        }

        protected void gridPessoas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }


}
