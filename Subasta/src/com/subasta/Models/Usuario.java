package com.subasta.Models;

import java.util.ArrayList;
import java.util.List;

public class Usuario {

	private String correo;
	private Integer tarjeta;
	

	public Usuario(String correo, Integer tarjeta) {
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
