package com.redsocial.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redsocial.entidad.Galleta;
import com.redsocial.repositorio.GalletaRepositorio;

@Service
public class GalletaServicioImpl implements GalletaServicio{

	@Autowired
	private GalletaRepositorio repositorio;
	
	@Override
	public Galleta insertaGalleta(Galleta obj) {
		
		return repositorio.save(obj);
	}

}
