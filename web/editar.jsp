<%@page import="com.emergentes.modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Persona reg = (Persona) request.getAttribute("miobjper");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Registro de Persona</title>
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
            width: 50%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            text-align: left;
        }
        input[type="text"] {
            width: calc(100% - 20px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Editar Registro de Persona</h1>
    <form action="MainServlet" method="post">
        <table>
            <tr>
                <td>ID</td>
                <td><input type="text" name="id" value="<%= reg.getId()%>" readonly></td>
            </tr>
            <tr>
                <td>Nombres</td>
                <td><input type="text" name="nombres" value="<%= reg.getNombres()%>"></td>
            </tr>
            <tr>
                <td>Apellidos</td>
                <td><input type="text" name="apellidos" value="<%= reg.getApellidos()%>"></td>
            </tr>
            <tr>
                <td>Edad</td>
                <td><input type="text" name="edad" value="<%= reg.getEdad()%>"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Enviar"></td>
            </tr>
        </table>
    </form>
</body>
</html>
