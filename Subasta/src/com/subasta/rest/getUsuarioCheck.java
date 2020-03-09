package com.subasta.rest;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.subasta.servicios.ServicioUsuario;


@Path(value = "/UsuarioCheck/")
public class getUsuarioCheck {
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public String listaUsuario(@Context ServletContext context,@FormParam("email") String email,@FormParam("tarjeta") Integer tarjeta){
		ServicioUsuario sc = new ServicioUsuario();
		String json = new Gson().toJson(sc.checkUsuario(email, tarjeta));
		// si lo check devuelve que hay, salimos, si no hay que llamar el servlet Sesion la creamos y dentro hay que meter el usuario, osea, que antes no debería poder meterse 
//		RequestDispatcher dispatcher = context.getServletContext().getRequestDispatcher("/servlet/ShowSupplies");
//		dispatcher.include(request, response);
//		
		
		
		return json;
	}
}
