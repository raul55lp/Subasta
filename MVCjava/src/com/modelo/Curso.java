package com.modelo;

import java.util.Objects;

public class Curso {//Objeto que vamos a manejar 
	private String nombre;
	private Integer nivel;
	
	public Curso(String nombre, int nivel) {//Constructor
		this.nombre = nombre;
		this.nivel = nivel;
	}
//getters y setters
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Integer getNivel() {
		return nivel;
	}

	public void setNivel(Integer nivel) {
		this.nivel = nivel;
	}
//Devuelve el contenido de un objeto
	@Override
	public String toString() {
		return "Curso [nombre=" + nombre + ", nivel=" + nivel + "]";
	}
//Hascode
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nivel == null) ? 0 : nivel.hashCode());
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		return result;
	}
//Método para establecer la igualdad entre objetos de Curso
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Curso other = (Curso) obj;
		if (nivel == null) {
			if (other.nivel != null)
				return false;
		} else if (!nivel.equals(other.nivel))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		return true;
	}
	
}
