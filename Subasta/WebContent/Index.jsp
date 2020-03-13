<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.subasta.Models.Usuario" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">

		$(document).ready(function () {
			<%
				HttpSession session_ = request.getSession(true);
			String correo = "";
			if (null != session.getAttribute("usuario")) {
				Usuario u = (Usuario)session_.getAttribute("usuario");
				correo = u.getCorreo();
			}
        
        %>
        const usuario = '<%= correo %>';
			if (usuario.length > 0) {
				document.getElementById('user').innerHTML = usuario
			}
			slider();
			activos();
			articulos();
		});
		var interval = [];
		var intervalActivo = [];
		function activos() {
			$.get("rest/articulosActivos/", function (data) {
				console.log(data);
				data.map((d) => {
					let precio = 0;
					if (d.pujas.length > 0) {
						precio = d.pujas[0].precio;
					} else {
						precio = d.precioMinimo;
					}
					document.getElementById('activas').innerHTML += `<div class=" card" id="activo` + d.id + `" >
				<img class="card-img-top" src="`+ d.imagen + `" alt="" name="imagen` + d.id + `">
				<div class="card-body">
				<h5 class="card-title" name="timer`+ d.id + `"></h5>
				<p class="card-text" name="precio`+ d.id + `">` + precio + `€</p>
    			<a href="articulo.jsp?id=`+ d.id + `" name="boton` + d.id + `">Pujar</a>
				</div>
				</div>`;
					// intervalActivo.push({ id: d.id, interval: setInterval(() => { timer(d) }, 1000) });
				})
			});
		}
		function articulos() {
			$.get("rest/articulos/", function (data) {
				console.log(data);
				data.map((d) => {
					let precio = 0;
					let mail_ = '';
					if (d.pujas.length > 0) {
						precio = d.pujas[0].precio;
					} else {
						precio = d.precioMinimo;
					}
					if (typeof(d.ganador) !== 'undefined'){
						mail_=d.ganador.correo;
					}
					document.getElementById('subastas').innerHTML += `<div class="col-md-6 col-lg-4 col-sm-6 col-12 card" >
				<img class="card-img-top" src="`+ d.imagen + `" alt="" name="imagen` + d.id + `">
				<div class="card-body">
				<h5 class="card-title" name="timer`+ d.id + `"></h5>
				<p class="card-text" name="precio`+ d.id + `">` + precio + `€</p>
				<h5 class="card-title" id="ganador`+ d.id + `">`+mail_+`</h5>
    			<a href="articulo.jsp?id=`+ d.id + `" name="boton` + d.id + `">Pujar</a>
				</div>
				</div>`;
					if (!d.pujaFinal) {
						interval.push({ id: d.id, interval: setInterval(() => { timer(d) }, 1000) });
					} else {
						timer(d);
					}
				})
			});
		}
		function slider() {
			$.get("rest/articulosSlider/", function (data) {
				console.log(data);
				let cont = 0;
				data.map(d => {
					document.getElementById('barras').innerHTML += `<li data-target="#carouselExampleIndicators" data-slide-to="` + cont + `" class="bg-dark"></li>`
					document.getElementById('carousel').innerHTML += `<div class="carousel-item text-center">
					<img class="d-block " src="`+ d.imagen + `" alt="First slide">
				</div>`
					cont += 1;
				})
				document.getElementsByClassName('carousel-item ')[0].className = 'carousel-item text-center active';
			});
		}
		function tiempo(d) {
			let days = Math.floor(d / (1000 * 60 * 60 * 24));
			let hours = Math.floor((d % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			let minutes = Math.floor((d % (1000 * 60 * 60)) / (1000 * 60));
			const seconds = Math.floor((d % (1000 * 60)) / 1000);
			days = days == 0 ? '' : days + 'd';
			hours = hours == 0 ? '' : hours + 'h';
			minutes = minutes == 0 ? '' : minutes + 'm';
			const text = days + " " + hours + " " + minutes + " " + seconds + "s ";
			return text;
		}
		function timer(d) {
			const final = new Date(d.horaFinal.year, d.horaFinal.month, d.horaFinal.dayOfMonth, d.horaFinal.hourOfDay, d.horaFinal.minute, d.horaFinal.second)
			const inicio = new Date(d.horaInicio.year, d.horaInicio.month, d.horaInicio.dayOfMonth, d.horaInicio.hourOfDay, d.horaInicio.minute, d.horaInicio.second)
			const now = new Date().getTime();
			const distance = final - now;

			if (inicio > now) { // aún no ha empezado
				contadores(d.id, { clase: 'text-dark', text: 'Empieza en ' + tiempo(inicio - now) })
				botones(d.id, { disabled: true, clase: 'btn btn-secondary' });
			}
			else if (distance > 0) { //Está en curso
				botones(d.id, { disabled: false, clase: 'btn btn-success' });
				contadores(d.id, { clase: 'text-dark', text: tiempo(distance) })
				if (!$('#activo' + d.id).length) {
					let precio = 0;
					if (d.pujas.length > 0) {
						precio = d.pujas[0].precio;
					} else {
						precio = d.precioMinimo;
					}
					document.getElementById('activas').innerHTML += `<div class=" card" id="activo` + d.id + `" >
				<img class="card-img-top" src="`+ d.imagen + `" alt="" name="imagen` + d.id + `">
				<div class="card-body">
				<h5 class="card-title" name="timer`+ d.id + `"></h5>
				<p class="card-text" name="precio`+ d.id + `">` + precio + `€</p>
    			<a href="articulo.jsp?id=`+ d.id + `" name="boton` + d.id + `">Pujar</a>
				</div>
				</div>`;
				}
			}
			else { // ha acabado
				contadores(d.id, { clase: 'text-danger', text: 'No disponible' })
				botones(d.id, { disabled: true, clase: 'btn btn-danger' });
				$.get("rest/actualiza/", function (data) {
					console.log(data);
					data.map(d => {
						$('#activo' + d.id).remove();
						console.log(d.ganador.correo);
						
						$('#ganador' + d.id).html(d.ganador.correo);
						clearInterval(interval.find(e => e.id == d.id).interval);
						// clearInterval(intervalActivo.find(e => e.id == d.id).interval);
					})
				});
			}
		}
		function contadores(id, attr) {
			document.getElementsByName('timer' + id).forEach(e => {
				e.innerHTML = attr.text;
				e.className = attr.clase;
			})
		}
		function botones(id, attr) {
			document.getElementsByName('boton' + id).forEach(e => {
				e.disabled = attr.disabled;
				e.className = attr.clase;
			})
		}
	</script>
</head>

<body>

	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="/Subasta/Index.jsp">Inicio</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		  <span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
		  <ul class="navbar-nav">
			<li class="nav-item">
			  <a class="nav-link" href="/Subasta/login.jsp">Registrarse</a>
			</li>
		  </ul>
		  <ul class="navbar-nav ml-auto">
			<li class="nav-item">
			  <a class="nav-link" href="/Subasta/usuario.jsp" id="user">Usuario</a>
			</li>
		  </ul>
		</div>
	  </nav>

	<div class="container">
		<div id="carouselExampleIndicators"
			class="d-sm-none d-none d-md-block shadow rounded border-dark col-12 mt-3 carousel slide pb-3"
			data-ride="carousel">
			<h1>Próximas subastas</h1>
			<ol class="carousel-indicators" id="barras">
			</ol>
			<div class="container">
				<div class="carousel-inner row" id="carousel">
				</div>
			</div>
		</div>
	</div>


	<div class="container-fluid">
		<div class="row">
			<!-- col-md-6 col-lg-3 col-sm-6 col-12 -->
			<div class="col-md-12 col-lg-7 offset-lg-2 my-5">
				<div id="subastas" class="row"></div>
			</div>
			<div class="col-md-12 col-lg-2 my-5 col-sm-7">
				<h1>Pujas en curso</h1>
				<div id="activas" class="row"></div>
			</div>
		</div>
	</div>
	<footer class="py-3 bg-dark text-white-50">
        <div class="container text-center">
            <small>Copyright &copy; Raúl Cabrejas</small>
        </div>
    </footer>
</body>

</html>