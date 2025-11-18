<%@page import="tpsemana11.Livro"%>
<%@page import="tpsemana11.ALDAL"%>
<%@page import="tpsemana11.Erro"%>

<%
    Livro dados = new Livro();
    dados.setTitulo(request.getParameter("titulo"));
    dados.setAutor(request.getParameter("autor"));
    dados.setEditora(request.getParameter("editora"));
    dados.setAno(request.getParameter("ano"));
    dados.setLocalizacao(request.getParameter("localizacao"));
    Livro chave = new Livro();
    chave.setTitulo(request.getParameter("titulo_original"));
    Erro.setErro(false);
    ALDAL.update(dados, chave);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Resultado da Atualização</title>
</head>
<body>
    <% if (Erro.getErro()) { %>
        <h1>Erro ao atualizar o livro.</h1>
        <p><strong>Mensagem:</strong> <%= Erro.getMens() %></p>
    <% } else { %>
        <h1>Livro atualizado com sucesso!</h1>
        <p>Título original: <%= chave.getTitulo() %></p>
        <p>Novo título: <%= dados.getTitulo() %></p>
    <% } %>
    <hr>
    <a href="index.html">Ir para o Cadastro</a>
    <a href="consulta.html">Ir para Consulta</a>
</body>
</html>