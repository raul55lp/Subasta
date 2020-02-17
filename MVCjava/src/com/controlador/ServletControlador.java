package com.controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.modelo.Curso;
import com.servicios.ServicioCursos;

/**
 * Servlet implementation class ServletControlador El asterisco se pone para que
 * recoger todas las llamadas posible
 */
@WebServlet("/ServletControlador/*")
public class ServletControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Se llame como se llame al servlet pasa por procesarPeticion
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		procesarPeticion(request, response);
	}

	// Trata todas las peticiones
	protected void procesarPeticion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Parte final de la página que llama al controlador
		String accion = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);// lo
		// Cargamos la lista
		ServicioCursos sc = new ServicioCursos();
		RequestDispatcher despachador = null;
		Curso c = null;
		switch (accion) {
		case "listar":
			despachador = request.getRequestDispatcher("/listaCursos.jsp");
			request.setAttribute("listaCursos", sc.getLista());
			break;
		case "formularioInsertar":
			despachador = request.getRequestDispatcher("/formularioCurso.jsp");
			break;
		case "borrar":
			c = new Curso(request.getParameter("nombre"), Integer.parseInt(request.getParameter("nivel")));
			sc.borrar(c);
			despachador = request.getRequestDispatcher("listar");
			break;
		case "insertar":
			c = new Curso(request.getParameter("nombre"), Integer.parseInt(request.getParameter("nivel")));
			sc.insertar(c);
			despachador = request.getRequestDispatcher("listar");
			break;
		default:
			despachador = request.getRequestDispatcher("/listaCursos.jsp");
			request.setAttribute("listaCursos", sc.getLista());
			break;
		}

	despachador.forward(request,response);

	}

	// Se llame como se llame al servlet pasa por procesarPeticion
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		procesarPeticion(request, response);
	}

}
