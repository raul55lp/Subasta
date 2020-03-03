<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.subasta.Models.Articulo"%>
<%@page import="com.subasta.servicios.ServicioArticulo"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#filtroNombre").keyup(function() {
			$.get("../rest/cursos/"+$(this).val(), function(datos){
				console.log(datos);
			})
		})
	});
</script>
</head>

<body>

	<nav class="navbar navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Navbar</a>
	</nav>
	<div class="row h-100">
	<div class="col-md-8 offset-md-2">
		<h1>Lista de artículos activos</h1>
			<%
				Calendar hora = Calendar.getInstance();
				ServicioArticulo sa = new ServicioArticulo();
				List<Articulo> lista = sa.ArticulosActivos();
				for (Articulo a : lista) {
			%>
				<h3>Precio mínmo:<%=a.getPrecioMinimo()%></h3>
				<p>Id:<%=a.getId()%></p>
				<p><%=a.getHoraFinal().get(Calendar.SECOND) %></p>
				<p><%=hora.get(Calendar.SECOND)  %></p>
				<p><%=a.getHoraFinal().get(Calendar.SECOND)-hora.get(Calendar.SECOND) %></p>
			<%
				}
			%>
		</div>
		<div class="col-md-8 offset-md-2">
		<h1>Lista de artículos</h1>
			
			<%
				lista = sa.Articulos();
				for (Articulo a : lista) {
			%>
				<h3>Precio mínmo:<%=a.getPrecioMinimo()%></h3>
				<p>Id:<%=a.getId()%></p>
			<%
				}
			%>
		</div>
	</div>
</body>

</html>