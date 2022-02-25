package br.senai.sp.cadastro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// Mostando ao spring que a classe é um controller
@Controller
public class IndexController {
	// Cada requisição que eu quiser mapear irá ser um método...
	// Mapeando a request do método.. nos parentes eu tenho que colocar a url que eu quero abrir..
	@RequestMapping("/")
	public String index() {
		System.out.println("PASSEI NO CONTROLLER");
		return "index";
	}
}
