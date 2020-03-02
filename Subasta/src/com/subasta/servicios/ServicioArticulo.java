package com.subasta.servicios;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.subasta.Models.Articulo;

public class ServicioArticulo {
	private static List<Articulo> lista = new ArrayList<>();

	static {
		for (int i = 0; i < 10; i++) {
			Calendar c = Calendar.getInstance();
			Calendar c1 = Calendar.getInstance();
			c1.add(Calendar.MINUTE, 5);
			lista.add(new Articulo(10, c, c1, "holi"));
			c.add(Calendar.MINUTE, i*2);
			c1.add(Calendar.MINUTE, i*5);
		}
	}

	public Articulo buscaArticuloPorId(int id) {
		for (Articulo articulo : lista) {
			if (id == articulo.getId())
				return articulo;
		}
		return null;
	}
	
	public List<Articulo> ArticulosActivos(){
		List<Articulo> articulos =new ArrayList<Articulo>();
		long c = Calendar.getInstance().getTimeInMillis();
		for (Articulo articulo : lista) {
			if (c>=articulo.getHoraInicio().getTimeInMillis()&&c<articulo.getHoraFinal().getTimeInMillis()) {
				articulos.add(articulo);
			}
		}
		return articulos;
	}
	public List<Articulo> Articulos(){
		List<Articulo> articulos =new ArrayList<Articulo>();
		long c = Calendar.getInstance().getTimeInMillis();
		for (Articulo articulo : lista) {
				articulos.add(articulo);
		}
		return articulos;
	}
}
