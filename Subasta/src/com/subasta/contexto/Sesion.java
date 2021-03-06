package com.subasta.contexto;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.subasta.Models.Usuario;
import com.subasta.servicios.ServicioUsuario;

/**
 * Servlet implementation class Sesion
 */
@WebServlet("/Sesion")
public class Sesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext contexto = getServletContext();
		HttpSession sesion = request.getSession(true);
		String correo = request.getParameter("email");
		Integer tarjeta=Integer.parseInt(request.getParameter("tarjeta"));
		Usuario u= new Usuario(correo,tarjeta);
		ServicioUsuario sc = new ServicioUsuario();
		String json = new Gson().toJson(sc.checkUsuario(correo, tarjeta));
		Usuario contextUser= (Usuario)sesion.getAttribute("usuario");
		if (!sc.checkUsuario(correo, tarjeta)&&contextUser==null) {
			sesion.setAttribute("usuario", u);
			sc.meteUsuario(u);
		}else {
			json=new Gson().toJson("Ya est�s logueado con el correo: "+contextUser.getCorreo());
		}
		PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(json);
        out.flush();
	}

}
