package com.subasta.servicios;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.subasta.Models.Articulo;
import com.subasta.Models.Puja;
import com.subasta.Models.Usuario;

public class ServicioPuja {
	private static ArrayList<Puja> lista = new ArrayList<Puja>();

	public boolean Pujar(Integer id, String mail, Double precio) {
		Calendar c = Calendar.getInstance();
		Articulo articulo = new ServicioArticulo().buscaArticuloPorId(id);
		
		if (articulo.getHoraInicio().getTimeInMillis() > c.getTimeInMillis()||c.getTimeInMillis() >= articulo.getHoraFinal().getTimeInMillis()) {
			return false;
		}
		Usuario u =new ServicioUsuario().getUsuario(mail);
		Puja p = new Puja(u,  precio);
		ServicioPuja.lista.add(p);
		articulo.metePuja(p);
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
