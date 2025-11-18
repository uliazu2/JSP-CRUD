<%@page import="tpsemana11.Livro"%> 
<%@page import="tpsemana11.ALDAL"%> 
<%@page import="tpsemana11.Erro"%> 

<%
    Livro L = new Livro();
    L.setTitulo(request.getParameter("titulo"));
   
    ALDAL.get(L);
%>

<!DOCTYPE html>
<html>
<body>
    <% if (Erro.getErro()) { %>
        <h1>Erro ao consultar.</h1>
        <p><strong>Mensagem:</strong> <%= Erro.getMens() %></p>
    <% } else { %>
        <h1>Livro Encontrado:</h1>
        <p><strong>Título:</strong> <%= L.getTitulo() %></p>
        <p><strong>Autor:</strong> <%= L.getAutor() %></p>
        <p><strong>Editora:</strong> <%= L.getEditora() %></p>
        <p><strong>Ano:</strong> <%= L.getAno() %></p>
        <p><strong>Localização:</strong> <%= L.getLocalizacao() %></p>
    <% } %>
    <hr>
    <a href="consulta.html">Consultar outro</a>
</body>
</html>