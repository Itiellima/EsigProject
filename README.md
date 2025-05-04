# EsigProject

# Sistema de Cadastro de Pessoas e Salários
Sistema web desenvolvido em ASP.NET Web Forms com banco de dados SQL Server para realizar o cadastro, edição, listagem e cálculo de salários de pessoas.

---
## Funcionalidades
- Cadastro de pessoas com dados completos
- Edição e exclusão de registros
- Cálculo de salário por cargo (via procedure no banco)
- Listagem de salários atualizada
- Interface com Bootstrap
- Validações de formulário
- Imagem de fundo e layout responsivo com navbar e footer
## Tecnologias Utilizadas
- C# (.NET Framework 4.7.2)
- ASP.NET Web Forms
- SQL Server
- Bootstrap 5
- HTML/CSS/JavaScript
## Estrutura do Banco de Dados
- Tabelas: Pessoas, Cargos, Salários
- Relacionamentos: Pessoas (FK) -> Cargos (PK), Salários (FK) -> Cargos (PK)
- Procedures: Cálculo de Salário: realiza cálculo baseado no cargo
## Como Executar o Projeto
- Clone o repositório ou baixe os arquivos
- Abra com o Visual Studio
- Configure a string de conexão no Web.config
- Execute as scripts SQL para criar as tabelas e procedures
- Pressione F5 para rodar o projeto
## Observações
- O campo ID da tabela pessoa é float para compatibilidade com importações
- O cálculo de salário é feito por procedure no banco, chamado ao editar/inserir
- A navbar e o footer seguem um layout padrão definido na MasterPage
## Autor
Itiel Lima Cavalcante da Silva
https://github.com/Itiellima
