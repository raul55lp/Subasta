package servicios;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import Models.Articulo;

public class ServicioArticulo {
	private static List<Articulo> lista = new ArrayList<>();

	static {
		Calendar c = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		c1.add(Calendar.MINUTE, 5);
		for (int i = 0; i < 10; i++) {
			lista.add(new Articulo(10, c, c1, "holi"));
			c.add(Calendar.MINUTE, 5);
			c1.add(Calendar.MINUTE, 5);
		}
	}

	public Articulo buscaArticuloPorId(int id) {
		for (Articulo articulo : lista) {
			if (id == articulo.getId())
				return articulo;
		}
		return null;
	}
	
}
