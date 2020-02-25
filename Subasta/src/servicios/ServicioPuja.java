package servicios;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import Models.Articulo;
import Models.Puja;
import Models.Usuario;

public class ServicioPuja {
	private static List<Puja> lista = new ArrayList<>();

	public boolean Pujar(Articulo articulo, Usuario usuario, float precio) {
		Calendar c = Calendar.getInstance();
		// <0 si el parámetro es menor
		if (articulo.getHoraInicio().compareTo(c) < 0 || articulo.getHoraFinal().compareTo(c) >= 0) {
			return false;
		}

		Puja p = new Puja(usuario, articulo, precio);

		lista.add(p);
		articulo.getPujas().add(p);
		usuario.getPujas().add(p);

		return true;
	}
}
