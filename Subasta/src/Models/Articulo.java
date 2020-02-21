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

	public Articulo() {

	}

	public boolean pujar(Usuario u, double puja) {

		if (this.checkTiempo()) {
			this.termina();
			return false;
		}
		return false;
	}

	/*
	 * Returns true if the bid is in the time frame
	 */
	private boolean checkTiempo() {
		double c = Calendar.getInstance().getTimeInMillis();
		if (c < this.horaInicio.getTimeInMillis() || c >= this.horaFinal.getTimeInMillis()) {
			return false;
		} else {
			return true;
		}
	}

	public void termina() {
		
	}

}
