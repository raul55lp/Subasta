package com.subasta.servicios;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.subasta.Models.Articulo;
import com.subasta.Models.Puja;
import com.subasta.Models.Usuario;

public class ServicioPuja {
	private static ArrayList<Puja> lista = new ArrayList<>();

	public boolean Pujar(Articulo articulo, Usuario usuario, Double precio) {
		Calendar c = Calendar.getInstance();
		// <0 si el parámetro es menor
		if (articulo.getHoraInicio().compareTo(c) < 0 || articulo.getHoraFinal().compareTo(c) >= 0) {
			return false;
		}

		Puja p = new Puja(usuario,  precio);

		lista.add(p);
		articulo.getPujas().add(p);

		return true;
	}
	
	public ArrayList<Puja> PujasByEmail(String mail){
		ArrayList<Puja> pujas = new ArrayList<Puja>();
		for (Puja puja : lista) {
			if (puja.getUsuario().getCorreo().equals(mail)) {
				pujas.add(puja);
			}
		}
		return pujas;
	}
	public boolean metePuja(Usuario usuario, Double precio) {
		Puja p = new Puja(usuario,  precio);
		return lista.add(p);
	}
}
