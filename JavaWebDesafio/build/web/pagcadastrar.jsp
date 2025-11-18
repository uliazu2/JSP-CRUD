<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="tpsemana11.Livro"%>
<%@page import="tpsemana11.ALDAL"%>
<%@page import="tpsemana11.Erro"%>

<%
    Erro.setErro(false);
    String titulo = request.getParameter("titulo");
    String autor = request.getParameter("autor");
    String editora = request.getParameter("editora");
    String ano = request.getParameter("ano");
    String localizacao = request.getParameter("localizacao");

    if (titulo == null || titulo.trim().isEmpty() ||
        autor == null || autor.trim().isEmpty() ||
        editora == null || editora.trim().isEmpty() ||
        ano == null || ano.trim().isEmpty() ||
        localizacao == null || localizacao.trim().isEmpty()) 
    {
        Erro.setErro("Todos os campos são de preenchimento obrigatório.");
    } 
    else 
    {
        try {
            Livro L = new Livro();
            L.setTitulo(titulo);
            L.setAutor(autor);
            L.setEditora(editora);
            L.setAno(ano); 
            
            L.setLocalizacao(localizacao);
            ALDAL.set(L);
            
        } catch (NumberFormatException nfe) {
            Erro.setErro("O campo 'Ano' deve ser um número válido.");
        } catch (Exception e) {
            Erro.setErro("Ocorreu um erro: " + e.getMessage());
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Resultado do Cadastro</title>
</head>
<body>
    <% if (Erro.getErro()) { %>
        
        <h1>Erro ao Cadastrar</h1>
        <p><strong>Mensagem:</strong> <%= Erro.getMens() %></p>
        <hr>
        <a href="index.html">Voltar ao cadastro</a>
        
    <% } else { %>
        
        <h1>Livro Cadastrado com Sucesso!</h1>
        <hr>
        <a href="index.html">Cadastrar outro livro</a>
        <br>
        <a href="index.html">Ir para o Início</a>
        
    <% } %>
</body>
</html>