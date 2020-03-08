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



@Path(value = "/usuario/{id}")
public class getUsuario {
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public String listaArticulos(){
		ServicioUsuario sc = new ServicioUsuario();
		String json = new Gson().toJson(sc.getUsuario("email"));
		return json;
	}
}
