<%@page import="tpsemana11.Livro"%>
<%@page import="tpsemana11.ALDAL"%>
<%@page import="tpsemana11.Erro"%>

<%
    Livro L = new Livro();
    L.setTitulo(request.getParameter("titulo"));

    Erro.setErro(false);
    ALDAL.get(L); 
%>

<!DOCTYPE html>
<html>
<head>
    <title>Editando Livro</title>
</head>
<body>

    <% if (Erro.getErro()) { %>
        <h1>Erro ao buscar o livro.</h1>
        <p><strong>Mensagem:</strong> <%= Erro.getMens() %></p>
    <% } else { %>
        <h2>Editando o Livro: <%= L.getTitulo() %></h2>
        
        <form action="pagatualizar.jsp" method="POST">
        
            <input type="hidden" name="titulo_original" value="<%= L.getTitulo() %>" />
            
            <p>Título: <br>
            <input type="text" name="titulo" value="<%= L.getTitulo() %>" size="50"/></p>
            
            <p>Autor: <br>
            <input type="text" name="autor" value="<%= L.getAutor() %>" size="50"/></p>
            
            <p>Editora: <br>
            <input type="text" name="editora" value="<%= L.getEditora() %>" size="50"/></p>
            
            <p>Ano: <br>
            <input type="text" name="ano" value="<%= L.getAno() %>" size="10"/></p>
            
            <p>Localização: <br>
            <input type="text" name="localizacao" value="<%= L.getLocalizacao() %>" size="50"/></p>
            
            <input type="submit" value="Salvar Alterações"/>
        </form>
    <% } %>
</body>
</html>