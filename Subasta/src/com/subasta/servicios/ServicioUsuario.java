package com.subasta.servicios;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import com.subasta.Models.Puja;
import com.subasta.Models.Usuario;

public class ServicioUsuario {
	private static List<Usuario> lista = new ArrayList<>();
	
	public boolean checkUsuario(String correo,Integer tarjeta) {
		Usuario u = new Usuario(correo,tarjeta);
		for (Usuario usuario : lista) {
			if (usuario.equals(u)) {
				return true;
			}
		}
		lista.add(u);
		return false;
	}
	public Usuario getUsuario(String email) {
		for (Usuario usuario : lista) {
			if (usuario.getCorreo().equals(email)) {
				return usuario;
			}
		}
		return null;
	}
	public boolean meteUsuario(Usuario u) {
		return lista.add(u);
	}
}
