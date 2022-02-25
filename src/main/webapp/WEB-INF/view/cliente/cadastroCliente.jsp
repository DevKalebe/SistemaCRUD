<!DOCTYPE html>
<!-- importando biblioteca de tags java para usar aqui no jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Fonts Google -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lexend+Deca&display=swap" rel="stylesheet">
    <!-- Link Para formatar o telefone -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- Link CSS -->
    <link rel="stylesheet" href="CSS/StyleCadastroCliente.css">
    <link rel="icon" href="IMG/folha.png">
    <title>Cadastro Cliente</title>
</head>

<body>
    <section class="Section_Register">
        <div class="one-div-Register">
            <h1>Insira o cadastro do cliente</h1>

            <div class="Image_one_div">
                <img src="IMG/folha.png" alt="Logo da empresa de desenvolvimento">
            </div>

            <a href="ListaCliente"><button type="button">Visualizar clientes cadastrados</button></a>

            <h4>Nome do quiosque</h4>
        </div>
        <div class="two-div-Register">
            <h1>Cadastro do cliente</h1>

            <form action="cadastrar" method="post">
            <input type="hidden" name="id" value="${cliente.id }">
                <div class="div_input">
                    <div class="input_and_image">
                        <img class="imagem_Position" src="IMG/user.png" alt="Imagem user para o input sobre nome">
                        <input class="Input-Forms" type="text" name="nome" id="nome" value="${cliente.nome }" required autofocus>
                        <label class="labelInput">Nome</label>
                    </div>

                </div>

                <div class="div_radio">
                    <div class="div_title_radio">
                        <img src="IMG/genero.png" alt="Logo referenciando o gênero">
                        <label>Gênero:</label>
                    </div>
                    <div class="div_masculine_radio">
                        <label>Masculino:</label>
                        <input type="radio" name="genero" id="genero" value="Masculino" required <c:if test="${cliente.genero.equals('Masculino')}">checked</c:if>>
                    </div>
                    <div class="div_feminine_radio">
                        <label>Feminino:</label>
                        <input type="radio" name="genero" id="genero" value="Feminino" required <c:if test="${cliente.genero.equals('Feminino')}">checked</c:if>>
                    </div>
                </div>

                <div class="div_input">
                    <label class="labelData">Data de nascimento</label>
                    <div class="input_and_image">
                        <img src="IMG/calendario.png" alt="Imagem calendario para o input sobre data de nascimento">
                        <input class="Input-Forms" type="date" name="dataNascimento" id="dataNascimento" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${cliente.dataNascimento.time }"/>" required>

                    </div>

                </div>

                <div class="div_input">
                    <div class=" input_and_image ">
                        <img src="IMG/arroba.png " alt="Imagem arroba para o input sobre o e-mail ">
                        <input class="Input-Forms " type="email" name="email" id="email" value="${cliente.email }" required>
                        <label class="labelInput ">E-mail</label>
                    </div>

                </div>

                <div class="div_input ">
                    <div class="input_and_image ">
                        <img src="IMG/place.png " alt="Imagem place para o input sobre o endereço " />
                        <input class="Input-Forms" type="text" name="endereco" id="endereco" value="${cliente.endereco }" required>
                        <label class="labelInput ">Endereço</label>
                    </div>

                </div>

                <div class="div_input ">
                    <div class="input_and_image ">
                        <img src="IMG/phonecall.png " alt="Imagem phone para o input sobre o celular " />
                        <input class="Input-Forms" type="tel" name="celular" id="celular" value="${cliente.celular }" onkeypress="$(this).mask('(00) 90000-0000')"required>
                        <label class="labelInput ">Celular</label>
                    </div>

                </div>

                <div class="div_input ">
                    <div class="input_and_image ">
                        <img src="IMG/Vector.png " alt="Imagem phone para o input sobre o celular " />
                        <input class="Input-Forms" type="text" name="produto" id="produto" value="${cliente.produto }" required>
                        <label class="labelInput ">Produto de Interesse</label>
                    </div>

                </div>
                <button type="submit ">INSERIR CADASTRO</button>
            </form>
        </div>
    </section>
    <footer class="footer ">
        <div class="developed ">
            <p>developed by</p>
            <!-- era pra ter um link redirecionando para nossa empresa -->
            <a href="# "><img src="IMG/folhaFooter.png"></a>
        </div>
        <p class="p-footer ">Version 1.0.0</p>
        <p class="p-footer "> © Todos os direitos reservados - 2022</p>
    </footer>

</body>

</html>