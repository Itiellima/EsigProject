<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pessoa.aspx.cs" Inherits="EsigProject.Pessoa" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Cadastro de Pessoa</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">

    <!-- Bootstrap JS e jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="mb-4">Cadastro de Pessoa</h2>

            <asp:Label ID="lblId" runat="server" Visible="false" />

            <div class="form-group">
                <label for="txtID">ID</label>
                <asp:TextBox ID="txtID" runat="server" CssClass="form-control" ReadOnly/>
            </div>

            <div class="form-group">

                <asp:Label ID="lblNome" runat="server" Text="Nome:" />
                <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvNome" runat="server"
                    ControlToValidate="txtNome"
                    ErrorMessage="* Campo obrigatório"
                    ForeColor="Red"
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtCidade">Cidade</label>
                <asp:TextBox ID="txtCidade" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtCep">CEP</label>
                <asp:TextBox ID="txtCep" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtEndereco">Endereço</label>
                <asp:TextBox ID="txtEndereco" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtPais">País</label>
                <asp:TextBox ID="txtPais" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtUsuario">Usuário</label>
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtTelefone">Telefone</label>
                <asp:TextBox ID="txtTelefone" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblDataNascimento" runat="server" Text="Data de Nascimento:" />
                <asp:TextBox ID="txtDataNascimento" runat="server" TextMode="Date" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvDataNascimento" runat="server"
                    ControlToValidate="txtDataNascimento"
                    ErrorMessage="* Campo obrigatório"
                    ForeColor="Red"
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblCargoId" runat="server" Text="Cargo ID:" />
                <asp:TextBox ID="txtCargoId" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvCargoId" runat="server"
                    ControlToValidate="txtCargoId"
                    ErrorMessage="* Campo obrigatório"
                    ForeColor="Red"
                    Display="Dynamic" />
            </div>
            <br />

            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-primary" OnClick="btnSalvar_Click" />
            <asp:Button ID="btnLimpar" runat="server" Text="Limpar Campos" OnClick="btnLimpar_Click" CssClass="btn btn-secondary" CausesValidation="false"/>



            <hr class="my-4" />

            <h3>Lista de Pessoas</h3>
            <asp:GridView ID="gridPessoas" runat="server" CssClass="table table-bordered"
                AutoGenerateColumns="False" OnRowCommand="gridPessoas_RowCommand">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:BoundField DataField="nome" HeaderText="Nome" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="cidade" HeaderText="Cidade" />
                    <asp:TemplateField HeaderText="Ações">

                        <ItemTemplate>
                            <asp:LinkButton ID="btnEditar" runat="server" Text="Editar" CommandName="Editar"
                                CommandArgument='<%# Container.DataItemIndex %>' CausesValidation="false" CssClass="btn btn-warning btn-sm mr-1" />
                            |
                            <asp:LinkButton ID="btnExcluir" runat="server" Text="Excluir" CommandName="Excluir"
                                CommandArgument='<%# Container.DataItemIndex %>' CausesValidation="false" CssClass="btn btn-danger btn-sm" />
                        </ItemTemplate>

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
