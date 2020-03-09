<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        const id = '<%= request.getParameter("id") %>'
        var articulo;
        $(document).ready(function () {
            articulo();
            $('#precio').on('keyup',function () {
                if ($('#precio').val() > articulo.pujas[0].precio) {
                    $('#precio').removeClass('is-invalid')
                    $('#pujar').removeAttr('disabled')
                } else {
                    $('#pujar').attr('disabled','')
                    $('#precio').addClass('is-invalid')
                }
            });
            onConnectClick();
        });
        function articulo() {
            $.get("rest/articulo/" + id, function (data) {
                articulo = data;
                document.getElementById('imagen').src = data.imagen;
                if (data.pujas) {
                    data.pujas.map(p => {
                        document.getElementById('pujas').innerHTML += `<li class="list-group-item">` + p.precio + `€</li>`
                    });
                    $('#precio').prop('min', (data.pujas[0].precio+'').replace('.',','));
                }else{
                    $('#precio').prop('min', (data.precioMinimo+'').replace('.',','));
                }
                setInterval(() => { timer(data) }, 1000);
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
                // botones(d.id, { disabled: true, clase: 'btn btn-secondary' });
            }
            else if (distance > 0) { //Está en curso
                // botones(d.id, { disabled: false, clase: 'btn btn-success' });
                contadores(d.id, { clase: 'text-success', text: tiempo(distance) })
            }
            else { // ha acabado
                contadores(d.id, { clase: 'text-danger', text: 'No disponible' })
                // botones(d.id, { disabled: true, clase: 'btn btn-danger' });
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
    </script>
</head>

<body class="container-fluid">

    <nav class="navbar navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Navbar</a>
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
                        <form action="javascript:alert('trigered');" method="post" class="form">
                            <div class="row">
                                <div class="col-md-8">
                                    <input type="number" name="precio" id="precio" class="form-control">
                                    <div class="invalid-feedback">
                                        La cantidad debe ser mayor que la última puja registrada
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <input type="submit" value="Pujar" class="btn btn-success" id="pujar" disabled onclick="onSendClick()">
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
</body>

</html>