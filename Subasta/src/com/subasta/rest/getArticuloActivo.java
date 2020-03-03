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



@Path(value = "/articulos/{nombre:.*}")
public class getArticuloActivo {
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String listaArticulos(@PathParam("nombre")String nombre){
		ServicioArticulo sc = new ServicioArticulo();
		String json = new Gson().toJson(sc.Articulos().get(0));
//		String salida=sc.Articulos().toString();
		return json;
	}
}
