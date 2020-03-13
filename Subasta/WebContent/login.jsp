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
    <script>
        let tarjeta = false;
        let email = false;
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
			if (usuario.length>0) {
				document.getElementById('user').innerHTML=usuario
			}
            $('#tarjeta').on('keyup', function () {
                if ($('#tarjeta').val().length < 5) {
                    $('#tarjeta').addClass('is-invalid')
                    tarjeta = false;
                } else {
                    tarjeta = true;
                    $('#tarjeta').removeClass('is-invalid')
                }
                activar();
            });
            $('#email').on('keyup', function () {
                if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test($('#email').val())) {
                    email = true;
                    $('#email').removeClass('is-invalid')
                } else {
                    $('#email').addClass('is-invalid')
                    email = false;
                }
                activar();
            });
        });
        function activar() {
            if (tarjeta && email) {
                $('#registrar').removeAttr('disabled')
            } else {
                $('#registrar').attr('disabled', '')
            }
        }
        function registrar() {
            const email = document.getElementById('email').value;
            const tarjeta = document.getElementById('tarjeta').value;
            $.post('Sesion', { email: email, tarjeta: tarjeta }, function (data) {
                const e = document.getElementById('resultado');
                if (data) {
                    if(data!=true){
                        e.innerHTML=data;
                    }else{
                    e.innerHTML = 'Este usuario ya existe'
                    }
                    e.className = 'text-danger'
                } else {
                    e.innerHTML = 'Usuario creado correctamente'
                    e.className = 'text-success'
                }
            });
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
    <form action="javascript:registrar()" method="post" class=" p-5 my-5 col-md-4 offset-4 shadow rounded border-dark">
        <h5>Registro de nuevo usuario</h5>
        <div class="form-group my-5">
            <label for="email">Email:</label>
            <input type="email" name="" id="email" class="form-control">
            <div class="invalid-feedback">
                El correo debe estar bien formado
            </div>
            <label for="tarjeta">Tarjeta:</label>
            <input type="number" name="" id="tarjeta" class="form-control" minlength="5">
            <div class="invalid-feedback">
                La tarjeta debe tener una longitud de por lo menos 5 dígitos
            </div>
            <input type="submit" value="Registrar" id="registrar" class="btn btn-primary my-2" disabled>
            <h5 id="resultado"></h5>
        </div>
    </form>
    <footer class="py-4 bg-dark text-white-50 fixed-bottom">
        <div class="container text-center">
            <small>Copyright &copy; Raúl Cabrejas</small>
        </div>
    </footer>
</body>

</html>