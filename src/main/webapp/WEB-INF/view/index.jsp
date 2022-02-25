<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Fonte do google -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lexend+Deca&display=swap" rel="stylesheet">
    <!-- --- -->
    <link rel="stylesheet" href="CSS/Style.css">
    <link rel="icon" href="IMG/folha.png">
    <title>Sistema | Welcome</title>
</head>
<body>
    <main class="main">
        <h1 class="titulo">Bem vindo(a)!
            <br>O que você deseja fazer hoje?</h1>
        <div class="botoes">
            <a href="CadastroCliente"><button type="button" class="left">Cadastrar cliente</button></a>
            <a href="ListaCliente"><button type="button" class="right">Buscar cliente</button></a>
        </div>
    </main>
    <footer class="footer">
        <div class="developed">
            <p>developed by</p>
            <!-- era pra ter um link redirecionando para nossa empresa -->
            <a href="#"><img src="IMG/folhaFooter.png"></a>
        </div>
        <p class="p-footer">Version 1.0.0</p>
        <p class="p-footer"> © Todos os direitos reservados - 2022</p>
    </footer>
</body>
</html>