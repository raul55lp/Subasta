package com.subasta.Models;

import java.util.List;

public class Usuario {

	private String correo;
	private Integer tarjeta;
	private List<Puja> pujas;
	private List<Articulo> articulos;
	


	public Usuario(String correo, Integer tarjeta) {
		super();
		this.correo = correo;
		this.tarjeta = tarjeta;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public Integer getTarjeta() {
		return tarjeta;
	}

	public void setTarjeta(Integer tarjeta) {
		this.tarjeta = tarjeta;
	}

	public List<Puja> getPujas() {
		return pujas;
	}

	public void setPujas(List<Puja> pujas) {
		this.pujas = pujas;
	}

	public List<Articulo> getArticulos() {
		return articulos;
	}

	public void setArticulos(List<Articulo> articulos) {
		this.articulos = articulos;
	}

	public Usuario(String correo, Integer tarjeta) {
		
	}

	@Override
	public boolean equals(Object obj) {
		Usuario u = (Usuario)obj;
		if (u.getCorreo().equals(this.correo) || u.getTarjeta().equals(this.tarjeta)) {
			return true;
		}else {
			return false;
		}
	}
	
	
}
