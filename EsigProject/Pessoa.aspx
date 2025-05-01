<%@ Page Title="Cadastro Pessoa" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Pessoa.aspx.cs" Inherits="EsigProject.Pessoa" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <content>
            <div class="container mt-5">
                <h2 class="mb-4">Cadastro de Pessoa</h2>

                <asp:Label ID="lblId" runat="server" Visible="false" />

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
                    <label for="Cargo">Cargo</label>
                    <asp:DropDownList ID="ddlCargo" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Selecione o Cargo" Value="" />
                        <asp:ListItem Text="Estagiário" Value="1" />
                        <asp:ListItem Text="Técnico" Value="2" />
                        <asp:ListItem Text="Analista" Value="3" />
                        <asp:ListItem Text="Coordenador" Value="4" />
                        <asp:ListItem Text="Gerente" Value="5" />
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="rfvCargo" runat="server"
                        ControlToValidate="ddlCargo"
                        InitialValue=""
                        ErrorMessage="* Selecione um cargo"
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

        </content>

    </asp:Content>

