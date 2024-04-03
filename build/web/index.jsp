<%@ page import="com.emergentes.modelo.Persona" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<Persona> lista = (ArrayList<Persona>) session.getAttribute("listaper");

    if (lista == null) {
        lista = new ArrayList<Persona>();
        session.setAttribute("listaper", lista);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Registros</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color:  #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
        .btn {
            display: inline-block;
            padding: 8px 12px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-danger {
            background-color: #f44336;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .btn-danger:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <h1>LISTADO DE REGISTROS</h1>
    <a href="MainServlet?op=nuevo" class="btn">NUEVO REGISTRO</a>
    <table>
        <tr>
            <th>ID</th>
            <th>NOMBRES</th>
            <th>APELLIDOS</th>
            <th>EDAD</th>
            <th></th>
            <th></th>
        </tr>
        
        <% if (lista != null && !lista.isEmpty()) { %>
            <% for (Persona item : lista) { %>
                <tr>
                    <td><%= item.getId()%></td>
                    <td><%= item.getNombres()%></td>
                    <td><%= item.getApellidos() %></td>
                    <td><%= item.getEdad() %></td>
                    <td><a href="MainServlet?op=editar&id=<%= item.getId() %>" class="btn">Editar</a></td>
                    <td><a href="MainServlet?op=eliminar&id=<%= item.getId() %>" onclick="return confirm('¿Está seguro de eliminar?')" class="btn btn-danger">Eliminar</a></td>
                </tr>
            <% } %>
        <% } else { %>
            <tr>
                <td colspan="6">No hay registros</td>
            </tr>
        <% } %>
    </table>
</body>
</html>
