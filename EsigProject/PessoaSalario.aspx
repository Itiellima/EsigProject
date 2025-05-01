<%@ Page Title="Pessoa Salario - " Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PessoaSalario.aspx.cs" Inherits="EsigProject.PessoaSalario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Button ID="btnRecalcular1" runat="server" CssClass="btn btn-primary" Text="Recalcular Salários" OnClick="btnRecalcular_Click" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover"
        AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="pessoa_id" HeaderText="ID" />
            <asp:BoundField DataField="pessoa_nome" HeaderText="Nome" />
            <asp:BoundField DataField="cargo_nome" HeaderText="Cargo" />
            <asp:BoundField DataField="salario" HeaderText="Salário" DataFormatString="{0:C}" />
        </Columns>
    </asp:GridView>

    <asp:Button ID="btnRecalcular" runat="server" CssClass="btn btn-primary" Text="Recalcular Salários" OnClick="btnRecalcular_Click" />




</asp:Content>
