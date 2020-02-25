package servicios;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import Models.Articulo;
import Models.Puja;
import Models.Usuario;

public class ServicioArticulo {
	private static List<Articulo> lista = new ArrayList<>();

	static {
		Calendar c = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		c1.add(Calendar.MINUTE, 5);
		lista.add(new Articulo(10, c, c1, "holi"));
		c.add(Calendar.MINUTE, 5);
		c1.add(Calendar.MINUTE, 5);
		lista.add(new Articulo(15, c, c1, "holi"));
		c.add(Calendar.MINUTE, 5);
		c1.add(Calendar.MINUTE, 5);
		lista.add(new Articulo(20, c, c1, "holi"));
	}

	public Articulo buscaArticuloPorId(int id) {
		for (Articulo articulo : lista) {
			if (id == articulo.getId())
				return articulo;
		}
		return null;
	}
	
	public List<Articulo> buscaArticuloPorUsuario(Usuario u) {
		List<Articulo> a = new ArrayList<Articulo>();
		for (Articulo articulo : lista) {
			for (Puja p : articulo.getPujas()) {
				if (p.getUsuario().equals(u)) {
					a.add(articulo);
					break;
				}
			}
		}
		return null;
	}
	
}
