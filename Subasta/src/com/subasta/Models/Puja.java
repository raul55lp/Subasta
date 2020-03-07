package com.subasta.Models;

public class Puja {

	private Usuario usuario;
	private Double precio;
	
	public Puja() {
		
	}
	

	public Puja(Usuario usuario, Double precio) {
		this.usuario = usuario;
		this.precio = precio;
	}


	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}
}
