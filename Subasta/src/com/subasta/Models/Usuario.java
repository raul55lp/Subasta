package com.subasta.Models;

import java.util.List;

public class Usuario {
	@Override
	public String toString() {
		return "Usuario {correo:" + correo + ", tarjeta:" + tarjeta + ", pujas:" + pujas + ", articulos:" + articulos
				+ "}";
	}

	private String correo;
	private int tarjeta;
	private List<Puja> pujas;
	private List<Articulo> articulos;

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public int getTarjeta() {
		return tarjeta;
	}

	public void setTarjeta(int tarjeta) {
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

	public Usuario(String correo, int tarjeta) {
		
	}

	@Override
	public boolean equals(Object obj) {
		Usuario u = (Usuario)obj;
		if (u.getCorreo().equals(this.correo)) {
			return true;
		}else {
			return false;
		}
	}
	
	
}