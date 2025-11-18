<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="tpsemana11.Livro"%>
<%@page import="tpsemana11.ALDAL"%>
<%@page import="tpsemana11.Erro"%>

<%
    Erro.setErro(false);
    String mensagem = "";

    try {
        Livro L = new Livro();
        ALDAL.geraTabela(L);
        if (Erro.getErro()) {
            mensagem = "Erro ao criar a tabela: " + Erro.getMens();
        } else {
            mensagem = "Tabela 'TabLivros' criada com sucesso!";
        }
        
    } catch (Exception e) {
        Erro.setErro(e.getMessage());
        mensagem = "Erro: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Criação de Tabela</title>
</head>
<body>
    <h1>Resultado da Criação da Tabela</h1>
    <p><strong>Status:</strong> <%= mensagem %></p>
    
    <hr>
    <a href="index.html">Voltar ao Início</a>
</body>
</html>