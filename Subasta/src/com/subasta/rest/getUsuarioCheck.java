package com.subasta.rest;

import java.util.List;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.annotation.XmlRootElement;

import com.google.gson.Gson;
import com.subasta.Models.Articulo;
import com.subasta.Models.Usuario;
import com.subasta.servicios.ServicioArticulo;
import com.subasta.servicios.ServicioUsuario;


@Path(value = "/UsuarioCheck/")
public class getUsuarioCheck {
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public String listaUsuario(@FormParam("email") String email,@FormParam("tarjeta") Integer tarjeta){
		ServicioUsuario sc = new ServicioUsuario();
		String json = new Gson().toJson(sc.checkUsuario(email, tarjeta));
//		String json = new Gson().toJson(true);
		return json;
	}
}
