package Models;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;

public class Articulo {

	private int id;
	private double precioMinimo;
	private Calendar horaInicio;
	private Calendar horaFinal;
	private double pujaFinal;
	private ArrayList<Puja> pujas;
	private String imagen;
	private Usuario ganador;
	private static int ID = 1;

	public Articulo(double precioMinimo, Calendar horaInicio, Calendar horaFinal, String imagen) {
		this.id = Articulo.ID++;
		this.precioMinimo = precioMinimo;
		this.horaInicio = horaInicio;
		this.horaFinal = horaFinal;
		this.imagen = imagen;
	}
	public Articulo() {
		
	}

	public double getPujaFinal() {
		return pujaFinal;
	}

	public void setPujaFinal(double pujaFinal) {
		this.pujaFinal = pujaFinal;
	}

	public ArrayList<Puja> getPujas() {
		return pujas;
	}

	public void setPujas(ArrayList<Puja> pujas) {
		this.pujas = pujas;
	}

	public Usuario getGanador() {
		return ganador;
	}

	public void setGanador(Usuario ganador) {
		this.ganador = ganador;
	}

	public int getId() {
		return id;
	}

	public double getPrecioMinimo() {
		return precioMinimo;
	}

	public Calendar getHoraInicio() {
		return horaInicio;
	}

	public Calendar getHoraFinal() {
		return horaFinal;
	}

	public String getImagen() {
		return imagen;
	}

}
