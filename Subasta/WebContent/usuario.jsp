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
                $.post('rest/usuario/', { usuario: usuario }, function (data) {
                    if (data) {
                        $('#correo').html(data.correo);
                        $('#tarjeta').html(data.tarjeta);
                        $.get('rest/articuloGanados/' + data.correo, function (data) {
                            data.map(d => {
                                document.getElementById('ganados').innerHTML += `<div class="col-lg-4 col-md-6 col-sm-12 col-12 card" " >
                                    <img class="card-img-top" src="`+ d.imagen + `" alt="" name="imagen` + d.id + `">
                                    <div class="card-body">
                                        <h5 class="card-title" name="timer`+ d.id + `">Puja final: ` + d.pujaFinal + `</h5>
                                        </div>
                                        </div>`;
                            })
                        })
                        $.get('rest/articuloByEmail/' + data.correo, function (data) {
                            console.log(data);
                            data.map(d => {
                                let ganador_ = '';
                                if (typeof (d.ganador) !== 'undefined') {
                                    ganador_ ='Ganador:'+ d.ganador.correo;
                                }
                                document.getElementById('pujados').innerHTML += `<div class="col-lg-4 col-md-6 col-sm-12 col-12 card" " >
                                    <img class="card-img-top" src="`+ d.imagen + `" alt="" name="imagen` + d.id + `">
                                    <div class="card-body">
                                        <h5 class="card-title" name="ganador`+ d.id + `">` + ganador_ + `</h5>
                                        <a href="articulo.jsp?id=`+ d.id + `" name="boton` + d.id + `" class='btn btn-primary'>Ir a la puja</a>
                                        </div>
                                        </div>`;
                            })
                            console.log('pujados', data);
                        })
                    } else {
                        $('#correo').html('Necesitas estar registrado para ver los datos');
                        $('#tarjeta').html('Necesitas estar registrado para ver los datos');
                    }
                })
            }
        });
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
    <div class="container-fluid row">
        <div class="p-5 my-5 col-md-8 offset-2 shadow rounded border-dark">
            <div>
                <p>
                    Nombre: <span id="correo"></span>
                </p>
                <p>
                    Tarjeta: <span id="tarjeta"></span>
                </p>
            </div>
            <div>
                <h3>Artículos ganados:</h3>
                <div id="ganados" class="row"></div>
            </div>
            <div>
                <h3>Artículos pujados:</h3>
                <div id="pujados" class="row"></div>
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