<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!-- importando biblioteca de tags java para usar aqui no jsp -->
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Fonte do google -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@200;400&display=swap" rel="stylesheet">
    <!-- --- -->
    <link rel="stylesheet" href="CSS/StyleListaCliente.css">
    <link rel="icon" href="IMG/folha.png">
    <title>Sistema | Faça sua busca</title>
</head>

<body>
    <h1 class="titulo">Clientes cadastrados</h1>
    <div class="scroll">
        <table class="tabela">
            <tr class="header">
                <th>ID</th>
                <th>Nome</th>
                <th>Gênero</th>
                <th>Email</th>
                <th>Endereço</th>
                <th>Celular</th>
                <th>Data de Nascimento</th>
                <th>Prod. interesse</th>
            </tr>
            <c:forEach items="${clientes }" var="c" varStatus="cont">
            	<tr class="linha <c:if test="${cont.count % 2 == 0}">linha2</c:if> " >
	                <td>${c.id }</td>
	                <td>${c.nome }</td>
	                <td>${c.genero }</td>
	                <td>${c.email }</td>
	                <td>${c.endereco }</td>
	                <td>${c.celular }</td>
	                <td><fmt:formatDate value="${c.dataNascimento.time }" pattern="dd/MM/yyyy"/></td>
            		<td>${c.produto }</td>
            	</tr>
            </c:forEach>
        </table>
    </div>
    <section class="botoes-forms">
        <div class="botoes">
            <button id="btn_excluir">Excluir Cliente</button>
            <button id="btn_atualizar">Atualizar Cliente</button>
        </div>
        <div class="forms">
            <div class="form" id="div_excluir">	
            		<p>Digite o ID do cliente que<br>voce deseja excluir</p>
	                <input type="number" name="input_excluir" placeholder="ID" id="input_excluir">
	                <button type="button" onclick="excluir()" id="excluir_def">Excluir<br>definitivamente</button>
            </div>
            <div class="form" id="div_atualizar">
	            	<p>Digite o ID do cliente que<br>voce deseja atualizar</p>
	                <input type="number" placeholder="ID" name="input_atualizar" id="input_atualizar">
	                <button type="button" onclick="atualizar()" id="atualizar_def">Ir para a página<br>de atualização</button>
            </div>
        </div>
    </section>
    <section class="estatisticas">
        <h1 class="titulo">Estatísticas</h1>
        <div class="estatisticas-content">
            <div class="genero">
                <h1>Quantidade de<br>clientes por genêro:</h1>
                <table class="est-tabela">
                    <tr class="est-header">
                        <th>Masculino</th>
                        <th>Feminino</th>
                    </tr>
                    <tr class="est-linha">
                        <td>${masculino }</td>
                        <td>${feminino }</td>
                    </tr>
                </table>
            </div>
            <div class="faixa-etaria">
                <h1>Quantidade de clientes<br>por faixa etária:</h1>
                <table class="est-tabela">
                    <tr class="est-header">
                        <th>Jovem</th>
                        <th>Adulto</th>
                        <th>Idoso</th>
                    </tr>
                    <tr class="est-linha">
                        <td>${jovem}</td>
						<td>${adulto}</td>
						<td>${idoso}</td>
                    </tr>
                </table>
            </div>
            <div class="periodo">
                <h1>Quantidade de clientes<br>por periodo do dia:</h1>
                <table class="est-tabela">
                    <tr class="est-header">
                        <th>Manhã</th>
                        <th>Tarde</th>
                        <th>Noite</th>
                    </tr>
                    <tr class="est-linha">
                        <td>${manha}</td>
						<td>${tarde}</td>
						<td>${noite}</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="dias">
            <h1>Quantidade de clientes por dia da semana:</h1>
            <div class="est-scroll">
                <table class="est-tabela">
                    <tr class="est-header">
                        <th>Segunda</th>
                        <th>Terça</th>
                        <th>Quarta</th>
                        <th>Quinta</th>
                        <th>Sexta</th>
                        <th>Sabado</th>
                        <th>Domingo</th>
                    </tr>
                    <tr class="est-linha">
                        <td>${segunda}</td>
						<td>${terca}</td>
						<td>${quarta}</td>
						<td>${quinta}</td>
						<td>${sexta}</td>
						<td>${sabado}</td>
						<td>${domingo}</td>						                        
                    </tr>
                </table>
            </div>
        </div>
    </section>
    <footer class="footer">
        <div class="developed">
        <p>developed by</p>
        <a href="#"><img src="IMG/folhaFooter.png"></a>
        </div>
        <p class="p-footer">Version 1.0.0</p>
        <p class="p-footer"> © Todos os direitos reservados - 2022</p>
    </footer>
    <script>
    
    		function excluir(){
    			const inputExcluir = document.getElementById("input_excluir");
    			const valorInputExcluir = inputExcluir.value;
    			if (valorInputExcluir == '') {
    				alert("Insira um id no campo para excluir o cliente...")
    			} else {
    				const valorConfirmar = confirm('Confirmar exclusão do cliente cujo o id é '+valorInputExcluir+'?');
        			if (valorConfirmar == 1) {
        				window.location.assign("ExcluirCliente?idCliente="+valorInputExcluir);	
        			}	
    			}
    		}
    		
    		function atualizar(){
    			const inputAtualizar = document.getElementById("input_atualizar");
    			const valorInputAtualizar = inputAtualizar.value;
    			if (valorInputAtualizar == '') {
    				alert("Insira um id no campo para atualizar o cliente...")
    			} else {
    				window.location.assign("AtualizarCliente?idCliente="+valorInputAtualizar);		
    			}
    		}
    
		    const btnExcluir = document.getElementById("btn_excluir");
			const divExcluir = document.getElementById("div_excluir");
			const btnExcDef = document.getElementById("excluir_def");
			var visivelExcluir = false;	
			btnExcluir.addEventListener('click', function(){
					if (visivelExcluir == false) {
						divExcluir.style.opacity = "1";
						btnExcDef.disabled = false;
						visivelExcluir = true;
					} else {
						divExcluir.style.opacity = "0";
						btnExcDef.disabled = true;
						visivelExcluir = false;
					}
			});
		
		    const btnAtualizar = document.getElementById("btn_atualizar");
			const divAtualizar = document.getElementById("div_atualizar");
			const btnAttDef = document.getElementById("atualizar_def");
			var visivelAtualizar = false;	
			btnAtualizar.addEventListener('click', function(){
					if (visivelAtualizar == false) {
						divAtualizar.style.opacity = "1";
						btnAttDef.disabled = false;
						visivelAtualizar = true;
					} else {
						divAtualizar.style.opacity = "0";
						btnAttDef.disabled = true;
						visivelAtualizar = false;
					}
			});
		</script>
</body>
</html>