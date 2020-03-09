package com.subasta.servicios;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.subasta.Models.Articulo;
import com.subasta.Models.Puja;
import com.subasta.Models.Usuario;

public class ServicioArticulo {
	private static List<Articulo> lista = new ArrayList<>();
	private static String[] imagenes=new String[15];

	static {
		imagenes[0]="./Images/botero.jpg";
		imagenes[1]="./Images/caminante.jpg";
		imagenes[2]="./Images/el_beso.jpg";
		imagenes[3]="./Images/creacion-de-adan.jpg";
		imagenes[4]="./Images/el_grito.png";
		imagenes[5]="./Images/El_jardín_de_las_Delicias.jpg";
		imagenes[6]="./Images/guernica.jpg";
		imagenes[7]="./Images/la_joven_de_la_perla.jpg";
		imagenes[8]="./Images/Las_Meninas.jpg";
		imagenes[9]="./Images/mona_lisa.jpg";
		imagenes[10]="./Images/murillo.jpg";
		imagenes[11]="./Images/Nighthawks.jpg";
		imagenes[12]="./Images/noche_estrellada.jpg";
		imagenes[13]="./Images/Ophelia.jpg";
		imagenes[14]="./Images/Saturno_devorando_a_su_hijo.jpg";
		for (int i = 0; i < 15; i++) {
			Calendar c = Calendar.getInstance();
			Calendar c1 = Calendar.getInstance();
			c1.add(Calendar.MINUTE, 55);
			lista.add(new Articulo(10, c, c1, imagenes[i]));
			c.add(Calendar.MINUTE, i*1);
			c1.add(Calendar.MINUTE, i*2);
		}
	}

	public Articulo buscaArticuloPorId(Integer id) {
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
		for (Articulo articulo : lista) {
				articulos.add(articulo);
		}
		return articulos;
	}
	public List<Articulo> ArticulosByEmail(String email){
		List<Articulo> articulos =new ArrayList<Articulo>();
		for (Articulo articulo : lista) {
			for (Puja puja : articulo.getPujas()) {
				if (puja.getUsuario().getCorreo().equals(email)) {
					articulos.add(articulo);
					break;
				}
			}
		}
		return articulos;
	}
	public List<Articulo>ArticulosGanados(String email){
		List<Articulo> articulos =new ArrayList<Articulo>();
		for (Articulo articulo : lista) {
			if (articulo.getGanador()!=null &&articulo.getGanador().getCorreo().equals(email)) {
				articulos.add(articulo);
			}
		}
		return articulos;
	}
	public List<Articulo> ArticulosSlider(){
		List<Articulo> articulos =new ArrayList<Articulo>();
		long c = Calendar.getInstance().getTimeInMillis();
		int i = 0;
		for (Articulo articulo : lista) {
			if (c<=articulo.getHoraInicio().getTimeInMillis()) {
				articulos.add(articulo);
				i++;
				if (i==3) {
					break;
				}
			}
		}
		return articulos;
	}
}
