package com.subasta.rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.subasta.Models.Articulo;
import com.subasta.servicios.ServicioArticulo;
import com.subasta.servicios.ServicioUsuario;



@Path(value = "/UsuarioCheck/")
public class getUsuarioCheck {
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public String listaUsuario(@PathParam("id") Integer id){
		ServicioUsuario sc = new ServicioUsuario();
//		String userName = request.getParameter("username");
//	    String password = request.getParameter("password");
//		String json = new Gson().toJson(sc.checkUsuario(correo, tarjeta)(id));
		String json = new Gson().toJson(true);
		return json;
	}
}
