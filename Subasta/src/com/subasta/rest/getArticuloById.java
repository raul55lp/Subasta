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



@Path(value = "/articulo/{id}")
public class getArticuloById {
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String listaArticulos(@PathParam("id") Integer id){
		ServicioArticulo sc = new ServicioArticulo();
		String json = new Gson().toJson(sc.buscaArticuloPorId(id));
		return json;
	}
}
