package com.redsocial.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.redsocial.entidad.Categoria;
import com.redsocial.entidad.Galleta;
import com.redsocial.servicio.CategoriaServicio;
import com.redsocial.servicio.GalletaServicio;

@Controller
public class GalletaController {

	@Autowired
	private GalletaServicio galletaServicio;
	@Autowired
	private CategoriaServicio categoriaServicio;
	
	@RequestMapping("/verRegistroGalleta")
	public String verRegGalleta() {
		return "registraGalleta";
	}
	
	//Permite retornar datos en formato JSON, sirve para llenar el combo de categoria
	@ResponseBody
	@RequestMapping("/cargaCategoria")
	public List<Categoria> cargaComboCategoria() {
		return categoriaServicio.listarTodos();
	}
	
	//session permite guardar en memoria objetos
	@RequestMapping("/registroDeGalleta")
	public String verRegGalleta(Galleta obj, HttpSession session) {
		Galleta objRep = galletaServicio.insertaGalleta(obj);
		if(objRep == null) {
			session.setAttribute("MENSAJE", "Registro erróneo");
		}else {
			session.setAttribute("MENSAJE", "Registro exitos");
		}
		return "registraGalleta";
	}
	
}
