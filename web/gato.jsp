<%-- 
    Document   : gato
    Created on : 20/01/2023, 06:13:53 PM
    Author     : Axel Zarate Lozano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gato</title>
    </head>
    <body>
        <form>
            <button id="action" name="action" value="server">servidor</button>
            <button id="action" name="action" value="client">cliente</button>
        </form>
    
    
    
    <%
        /*
    <body>
        <form>
            <table>
                <tr>
                    <td>
                        <button id="casilla" name="casilla" value="1">1</button>
                    </td>
                    <td>
                        <button id="casilla" name="casilla" value="2">2</button>
                    </td>
                    <td>
                        <button id="casilla" name="casilla" value="3">3</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button id="casilla" name="casilla" value="4">4</button>
                    </td>
                    <td>
                        <button id="casilla" name="casilla" value="5">5</button>
                    </td>
                    <td>
                        <button id="casilla" name="casilla" value="6">6</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button id="casilla" name="casilla" value="7">7</button>
                    </td>
                    <td>
                        <button id="casilla" name="casilla" value="8">8</button>
                    </td>
                    <td>
                        <button id="casilla" name="casilla" value="9">9</button>
                    </td>
                </tr>
            </table>
        </form>
    </body>
        */
        if( request == null )
        {
            return;
        }
        String action = request.getParameter( "action" );
        if( action == null )
        {
            action = "";
        }
        switch(action){
            case "server":
    %>
                server
                <form>
                    <button type="submit" id="action" name="action" value="initS"> Iniciar </button>
                </form>
    <%
                break;
            case "client":
    %>
                client
                <form>
                    <input id="ip" name="ip"></input>
                    <input id="port" name="port"></input>
                    <button type="submit" id="action" name="action" value="initC"> Iniciar </button>
                </form>
    <%
                break;
            case "initC":
                response.sendRedirect("gato?act=client&ip="+request.getParameter("ip")+"&port="+request.getParameter("port"));
                break;
            case "initS":
                response.sendRedirect("gato?act=server&port=5001"); //MODIFICAR DESPUÉS DE LAS PRUEBAS
                break;
        }
    %>
    </body>
</html>
