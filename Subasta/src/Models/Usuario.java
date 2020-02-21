package Models;

import java.util.List;

public class Usuario {
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
}
