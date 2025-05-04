<%@ Page Title="Sobre" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="EsigProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="Sobre">
        <br /><br />
        <h2 id="title"><%: Title %>.</h2>
        <h3>Descrição da aplicação.</h3>
        <p>
        
        <strong># Sistema de Cadastro de Pessoas e Salários<br /></strong>

        Sistema web desenvolvido em ASP.NET Web Forms com banco de dados SQL Server para realizar o cadastro, edição, listagem e cálculo de salários de pessoas.
        </p>
        ---
        </p>
        <strong>## Funcionalidades</p></strong>
        - Cadastro de pessoas com dados completos<br />
        - Edição e exclusão de registros<br />
        - Cálculo de salário por cargo (via procedure no banco)<br />
        - Listagem de salários atualizada<br />
        - Interface com Bootstrap<br />
        - Validações de formulário<br />
        - Imagem de fundo e layout responsivo com navbar e footer<br />
        </p>

        <strong>## Tecnologias Utilizadas<br /></strong>
        - C# (.NET Framework 4.7.2)<br />
        - ASP.NET Web Forms<br />
        - SQL Server<br />
        - Bootstrap 5<br />
        - HTML/CSS/JavaScript</p>

        <strong>## Estrutura do Banco de Dados<br /></strong>
        - Tabelas: Pessoas, Cargos, Salários<br />
        - Relacionamentos: Pessoas (FK) -> Cargos (PK), Salários (FK) -> Cargos (PK)<br />
        - Procedures: Cálculo de Salário: realiza cálculo baseado no cargo</p>

        <strong>## Como Executar o Projeto<br /></strong>
        - Clone o repositório ou baixe os arquivos<br />
        - Abra com o Visual Studio<br />
        - Configure a string de conexão no Web.config<br />
        - Execute as scripts SQL para criar as tabelas e procedures<br />
        - Pressione F5 para rodar o projeto</p>

        <strong>## Observações</strong><br />
        - O campo ID da tabela pessoa é float para compatibilidade com importações<br />
        - O cálculo de salário é feito por procedure no banco, chamado ao editar/inserir<br />
        - A navbar e o footer seguem um layout padrão definido na MasterPage</p>

        <strong>## Autor<br /></strong>
        Itiel Lima Cavalcante da Silva<br />
        <a>https://github.com/Itiellima</a>
        
        </p></p></p></p></p></p>.
        
    </main>
</asp:Content>
