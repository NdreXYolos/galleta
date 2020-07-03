package com.redsocial.entidad;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity
public class Categoria {
	
 @Id
 @Column(name = "idcategoria")
 private int idCategoria;
 
 @Column(name = "nombre")
 private String nombre;
 	
 @OneToMany(mappedBy = "categoria")
 private List<Galleta> galletas;
 
public int getIdCategoria() {
	return idCategoria;
}
public void setIdCategoria(int idCategoria) {
	this.idCategoria = idCategoria;
}
public String getNombre() {
	return nombre;
}
public void setNombre(String nombre) {
	this.nombre = nombre;
}
 
}
