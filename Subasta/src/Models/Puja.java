package Models;

public class Puja {
	private Usuario usuario;
	private Articulo articulo;
	private float precio;
	
	public Puja() {
		
	}
	

	public Puja(Usuario usuario, Articulo articulo, float precio) {
		this.usuario = usuario;
		this.articulo = articulo;
		this.precio = precio;
	}


	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Articulo getArticulo() {
		return articulo;
	}

	public void setArticulo(Articulo articulo) {
		this.articulo = articulo;
	}

	public float getPrecio() {
		return precio;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}
}
