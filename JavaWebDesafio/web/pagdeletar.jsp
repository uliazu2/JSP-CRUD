<%@page import="tpsemana11.Livro"%>
<%@page import="tpsemana11.ALDAL"%>
<%@page import="tpsemana11.Erro"%>

<%
    Livro L = new Livro();
    L.setTitulo(request.getParameter("titulo"));
    Erro.setErro(false);
    ALDAL.delete(L);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Resultado</title>
</head>
<body>
    <% if (Erro.getErro()) { %>
        <h1>Erro ao deletar o livro.</h1>
        <p><strong>Mensagem:</strong> <%= Erro.getMens() %></p>
    <% } else { %>
        <h1>Livro deletado com sucesso!</h1>
        <p>O livro "<%= L.getTitulo() %>" foi removido.</p>
    <% } %>
    <hr>
    <a href="deletar.html">Deletar outro</a>
    <a href="index.html">Voltar para o Cadastro</a>
</body>
</html>