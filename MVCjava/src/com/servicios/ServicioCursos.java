package com.servicios;

import java.util.ArrayList;
import java.util.List;

import com.modelo.Curso;

public class ServicioCursos {// Accede a una colección de curos. Lo que se hacía en el main. Luego será una
								// acceso a BB.DD.
	private static List<Curso> lista = new ArrayList<>();// define lista de datos

	static {// Asigna contenido
		lista.add(new Curso("Java", 1));
		lista.add(new Curso("PHP", 2));
		lista.add(new Curso(".NET", 3));
	}

	public List<Curso> getLista() {// recupera toda la lista
		return lista;
	}

	public Curso buscaCurso(String nombre) {// Localiza un curso
		for (Curso c : lista) {
			if (nombre.equals(c.getNombre())) {
				return c;
			}
		}
		return null;
	}
	
	public boolean borrar(Curso c) {//borra curso de la lista
		return lista.remove(c);
	}
	
	public void insertar(Curso c) {//inserta curso en la lista
		lista.add(c);
	}
}
