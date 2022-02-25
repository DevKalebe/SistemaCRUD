package br.senai.sp.cadastro.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.senai.sp.cadastro.dao.ClienteDao;
import br.senai.sp.cadastro.model.Cliente;

@Controller
public class ClienteController {
	@RequestMapping("CadastroCliente")
	public String cadastro() {
		return "cliente/cadastroCliente";
	}

	@RequestMapping(value = "cadastrar", method = RequestMethod.POST)
	public String cadastrar(Cliente cliente) {
		System.out.println(cliente.getNome());
		System.out.println(cliente.getGenero());
		System.out.println(cliente.getEndereco());
		System.out.println(cliente.getCelular());
		System.out.println(cliente.getEmail());
		System.out.println(cliente.getProduto());
		System.out.println(cliente.getDataNascimento());

		ClienteDao dao = new ClienteDao();

		if (cliente.getId() == null) {
			dao.inserir(cliente);
		} else {
			dao.atualizar(cliente);
		}

		return "redirect:CadastroCliente";
	}

	@RequestMapping("ListaCliente")
	public String listar(Model model) {
		List<Cliente> lista = new ArrayList<Cliente>(new ClienteDao().listar());

		int jovem = 0, adulto = 0, idoso = 0;
		int seg = 0, terca = 0, quarta = 0, quinta = 0, sexta = 0, sabado = 0, domingo = 0;
		int manha = 0, tarde = 0, noite = 0;
		for (Cliente cliente : lista) {

			// listando idade
			if (cliente.getIdade() < 18) {
				jovem++;
			} else if (cliente.getIdade() < 60) {
				adulto++;
			} else {
				idoso++;
			}

			// listando o dia da semana
			if (new ClienteDao().dia(cliente.getId()) == 2) {
				seg++;
			} else if (new ClienteDao().dia(cliente.getId()) == 3) {
				terca++;
			} else if (new ClienteDao().dia(cliente.getId()) == 4) {
				quarta++;
			} else if (new ClienteDao().dia(cliente.getId()) == 5) {
				quinta++;
			} else if (new ClienteDao().dia(cliente.getId()) == 6) {
				sexta++;
			} else if (new ClienteDao().dia(cliente.getId()) == 7) {
				sabado++;
			} else if (new ClienteDao().dia(cliente.getId()) == 1) {
				domingo++;
			}
			
			// listando o periodo do dia em que o lciente foi cadastrado
			if (new ClienteDao().hora(cliente.getId()) < 12) {
				manha++;
			} else if (new ClienteDao().hora(cliente.getId()) < 18) {
				tarde++;
			} else {
				noite++;
			}
			
		}

		model.addAttribute("jovem", jovem);
		model.addAttribute("adulto", adulto);
		model.addAttribute("idoso", idoso);

		model.addAttribute("segunda", seg);
		model.addAttribute("terca", terca);
		model.addAttribute("quarta", quarta);
		model.addAttribute("quinta", quinta);
		model.addAttribute("sexta", sexta);
		model.addAttribute("sabado", sabado);
		model.addAttribute("domingo", domingo);
		
		model.addAttribute("manha", manha);
		model.addAttribute("tarde", tarde);
		model.addAttribute("noite", noite);


		model.addAttribute("clientes", new ClienteDao().listar());
		model.addAttribute("masculino", new ClienteDao().contar("Masculino"));
		model.addAttribute("feminino", new ClienteDao().contar("Feminino"));
		return "cliente/listaCliente";
	}

	@RequestMapping("ExcluirCliente")
	public String excluir(long idCliente) {
		ClienteDao dao = new ClienteDao();
		dao.excluir(idCliente);
		return "redirect:ListaCliente";
	}

	@RequestMapping("AtualizarCliente")
	public String atualizar(long idCliente, Model model) {
		ClienteDao dao = new ClienteDao();
		model.addAttribute("cliente", dao.buscar(idCliente));
		return "forward:CadastroCliente";
	}

}
