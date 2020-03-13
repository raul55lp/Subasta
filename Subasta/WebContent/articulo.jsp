<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.subasta.Models.Usuario" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="WebSocketClient.js"></script>
    <script>
        <%
            HttpSession session_ = request.getSession(true);
        String correo = "";
        if (null != session.getAttribute("usuario")) {
            Usuario u = (Usuario)session_.getAttribute("usuario");
            correo = u.getCorreo();
        }
        
        %>
        const usuario = '<%= correo %>'
        const id_ = '<%= request.getParameter("id") %>'
        var articulo;
        var interval = null;
        $(document).ready(function () {
            if (usuario.length>0) {
				document.getElementById('user').innerHTML=usuario
			}
            articulo();
            $('#precio').on('keyup change', function () {
                if ($('[name="timer"]').hasClass('text-secondary')) {
                    $('#errorTiempo').removeAttr('hidden')
                    $('#precio').val('');
                } else {
                    $('#errorTiempo').attr('hidden', 'hidden')
                    if (parseFloat($('#precio').val().replace(',', '.')) > parseFloat($('#precio').attr('min').replace(',', '.'))) {
                        $('#errorPrecio').attr('hidden', 'hidden')
                        if (usuario.length > 0) {
                            $('#precio').removeClass('is-invalid')
                            $('#pujar').removeAttr('disabled')
                            $('#errorRegistro').attr('hidden', 'hidden')
                        } else {
                            $('#errorRegistro').removeAttr('hidden')
                        }
                    } else {
                        $('#errorPrecio').removeAttr('hidden')
                        $('#pujar').attr('disabled', 'disabled')
                        $('#precio').addClass('is-invalid')
                    }
                }
            });
            onConnectClick();
        });
        function articulo() {
            $.get("rest/articulo/" + id_, function (data) {
                articulo = data;
                document.getElementById('imagen').src = data.imagen;
                if (data.pujas.length > 0) {
                    console.log('entro');
                    data.pujas.map(p => {
                        console.log(1);
                        document.getElementById('pujas').innerHTML += `<li class="list-group-item">` + p.precio + `€</li>`
                    });
                    $('#precio').prop('min', (data.pujas[0].precio + '').replace('.', ','));
                    $('#precioMin').html(data.pujas[0].precio);
                } else {
                    $('#precio').prop('min', (data.precioMinimo + '').replace('.', ','));
                    $('#precioMin').html(data.precioMinimo);
                }
                interval = setInterval(() => { timer(data) }, 1000);
            })
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
                contadores(d.id, { clase: 'text-secondary', text: 'Empieza en ' + tiempo(inicio - now) })
            }
            else if (distance > 0) { //Está en curso
                contadores(d.id, { clase: 'text-success', text: tiempo(distance) })
            }
            else { // ha acabado
                contadores(d.id, { clase: 'text-danger', text: 'No disponible' })
                console.log('he terminado');
                clearInterval(interval);
                $.get("rest/actualiza/");
            }
        }
        function contadores(id, attr) {
            document.getElementsByName('timer').forEach(e => {
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
        function actualizar(msg) {
            $('#precio').val('');
            $('#precio').prop('min', (msg + '').replace('.', ','));
            $('#precioMin').html(msg);
            document.getElementById('pujas').innerHTML = `<li class="list-group-item">` + msg + `</li>` + document.getElementById('pujas').innerHTML
            $('#pujar').attr('disabled', '')
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
    <div class="row m-5">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body row">
                    <div class="col-md-6">
                        <img class="img-fluid" src="" alt="Card image cap" id="imagen">
                    </div>
                    <div class="col-md-6">
                        <h5 name="timer"></h5>
                        <p>Para pujar tienes que estar registrado previamente</p>
                        <form action="javascript:;" method="post" class="form">
                            <div class="row">
                                <div class="col-md-8">
                                    <input type="number" name="precio" id="precio" class="form-control">
                                    <h5>La puja mínima actual es: <span id="precioMin"></span></h5>
                                    <div id="errorPrecio" class="text-danger" hidden>
                                        La cantidad debe ser mayor que la última puja registrada
                                    </div>
                                    <div id="errorRegistro" class="text-danger" hidden>
                                        Debes estar registrado para poder pujar
                                    </div>
                                    <div id="errorTiempo" class="text-danger" hidden>
                                        La puja no está disponible
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <input type="submit" value="Pujar" class="btn btn-success" id="pujar" disabled
                                        onclick="onSendClick()">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 mx-5">
            <div class="card">
                <div class="row">
                    <div class="card-body col-md-12">
                        <h5 class="card-title">Pujas anteriores</h5>
                        <ul class="list-group list-group-flush" id="pujas">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="py-4 bg-dark text-white-50 fixed-bottom">
        <div class="container text-center">
            <small>Copyright &copy; Raúl Cabrejas</small>
        </div>
    </footer>
</body>

</html>