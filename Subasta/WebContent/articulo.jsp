<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
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
    <script>
        const id = '<%= request.getParameter("id") %>'
        $(document).ready(function () {
            articulo();
            pujas();
        });
        function articulo() {
            $.get("rest/articulo/" + id, function (data) {
                document.getElementById('imagen').src = data.imagen;
            })
        }
        function pujas() {

        }
    </script>
</head>

<body class="container-fluid">
    <nav class="container-fluid navbar-dark bg-dark">
        <a class="navbar-brand" href="Index.html">Navbar</a>
    </nav>
    <div class="row m-5">
        <div class="card col-md-8">
            <div class="col-md-5">
                <img class="card-img-top" src="" alt="Card image cap" id="imagen">
            </div>
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's
                    content.</p>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Cras justo odio</li>
                <li class="list-group-item">Dapibus ac facilisis in</li>
                <li class="list-group-item">Vestibulum at eros</li>
            </ul>
            <div class="card-body">
                <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a>
            </div>
        </div>
        <div class="card col-md-3 mx-5">
            <div class="row">
                <div class="card-body col-md-12">
                    <h5 class="card-title">Pujas anteriores</h5>
                </div>
                <ul class="list-group list-group-flush col-md-12" id="pujas">
                    <li class="list-group-item">Cras justo odio</li>
                    <li class="list-group-item">Dapibus ac facilisis in</li>
                    <li class="list-group-item">Vestibulum at eros</li>
                </ul>
            </div>
        </div>
    </div>
</body>

</html>