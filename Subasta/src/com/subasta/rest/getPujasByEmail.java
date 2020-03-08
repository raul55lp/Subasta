package com.subasta.rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.subasta.Models.Articulo;
import com.subasta.servicios.ServicioArticulo;
import com.subasta.servicios.ServicioPuja;



@Path(value = "/pujas/{id}")
public class getPujasByEmail {
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String listaArticulos(@PathParam("id") String id){
		ServicioPuja sc = new ServicioPuja();
		String json = new Gson().toJson(sc.PujasByEmail(id));
		return json;
	}
}
