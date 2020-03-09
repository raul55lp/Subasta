package com.subasta.contexto;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.subasta.Models.Articulo;
import com.subasta.Models.Puja;
import com.subasta.Models.Usuario;

@WebServlet("/Context")
public class Context extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ServletContext context = getServletContext();
		ArrayList<Articulo> articulos = new ArrayList<Articulo>();
		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
		ArrayList<Puja> pujas = new ArrayList<Puja>();

		context.setAttribute("articulos", articulos);
		context.setAttribute("usuarios", usuarios);
		context.setAttribute("pujas", pujas);

	}

}
