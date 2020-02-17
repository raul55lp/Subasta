<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.Curso"%>
<%@page import="com.servicios.ServicioCursos"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MANTENIMIENTO CURSOS</title>
</head>
<body>
	<table border="1px">
		<%
			ServicioCursos sc = new ServicioCursos();
			List<Curso> lista = sc.getLista();
			for (Curso c : lista) {
		%>

		<tr>
			<td><%=c.getNombre()%></td>
			<td><%=c.getNivel()%></td>
			<td>
				<form action="../ServletControlador/borrar" method="post">
					<input type="hidden" name="nombre" value="<%=c.getNombre()%>" />
					<input type="hidden" name="nivel" value="<%=c.getNivel()%>" /> 
					<input type="submit" value="borrar" />
				</form>
			</td>
		</tr>
		<%
			}
		%>

	</table>
	<form action="../ServletControlador/formularioInsertar">
		<input type="submit" value="nuevo" />
	</form>


</body>
</html>