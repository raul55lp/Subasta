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
        $.get("../rest/articulos/", function (datos) {
          $("tr").remove();
          if (Array.isArray(datos.curso)) {
            for (var i = 0; i < datos.curso.length; i++) {
              var curso = datos.curso[i];
              generarTabla(curso);
            }
          } else {
            generarTabla(datos.curso);
          }
        })
      function generarTabla(curso) {

        $("#tabla1").append(
          "<tr><td>" + curso.nombre + "</td>" +
          "<td>" + curso.nivel + "</td>" +
          "<td><form action='../ServletControlador/borrar' method='post'>" +
          "<input type='hidden' name='nombre' value='" + curso.nombre + "' />" +
          "<input type='hidden' name='nivel'  value='" + curso.nivel + "' />" +
          "<input type='submit' value='borrar'/>" +
          "</form>" +
          "</td>" +
          "</tr>");
      }
    });
  </script>
</head>

<body>

  <nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
      </ul>
    </div>
  </nav>
  <br>

  <div class="container">
    <div class="row">
      <%
      for
     %>
    </div>
  </div>
</body>

</html>