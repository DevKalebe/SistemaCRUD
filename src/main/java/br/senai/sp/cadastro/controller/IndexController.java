package br.senai.sp.cadastro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// Mostando ao spring que a classe � um controller
@Controller
public class IndexController {
	// Cada requisi��o que eu quiser mapear ir� ser um m�todo...
	// Mapeando a request do m�todo.. nos parentes eu tenho que colocar a url que eu quero abrir..
	@RequestMapping("/")
	public String index() {
		System.out.println("PASSEI NO CONTROLLER");
		return "index";
	}
}
