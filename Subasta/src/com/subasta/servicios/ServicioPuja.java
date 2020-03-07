package com.subasta.servicios;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.subasta.Models.Articulo;
import com.subasta.Models.Puja;
import com.subasta.Models.Usuario;

public class ServicioPuja {
	private static List<Puja> lista = new ArrayList<>();

	public boolean Pujar(Articulo articulo, Usuario usuario, Double precio) {
		Calendar c = Calendar.getInstance();
		// <0 si el parámetro es menor
		if (articulo.getHoraInicio().compareTo(c) < 0 || articulo.getHoraFinal().compareTo(c) >= 0) {
			return false;
		}

		Puja p = new Puja(usuario,  precio);

		lista.add(p);
		articulo.getPujas().add(p);
		usuario.getPujas().add(p);

		return true;
	}
}
