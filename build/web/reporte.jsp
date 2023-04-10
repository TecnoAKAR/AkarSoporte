<%-- 
    Document   : reporte
    Created on : 27/03/2023, 07:57:15 PM
    Author     : Axel Zarate Lozano
--%>

<%@page import="org.akar.dao.PSUsuario"%>
<%@page import="java.util.Date"%>
<%@page import="org.akar.dao.RelReporteUsuario"%>
<%@page import="org.akar.dao.Reporte"%>
<%@page import="org.akar.helper.SolucionHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    PSUsuario sesion = (PSUsuario)session.getAttribute("usuario");

    if(sesion != null){
        if(sesion.getTipo().getIdTipo() != 7){
            response.sendRedirect("notAccess.jsp");
        }
    } else{
        response.sendRedirect("notSession.jsp");
    }
%>
<html lang="es">
    <body>
        <%
            String action = request.getParameter("action");
            if(action == null){
                action = "";
            }  
            
                RelReporteUsuario rep = new SolucionHelper().getById(request);
                if(rep == null){
        %>
                    <h3> Ha ocurrido un error </h3>
        <%
                } else{
        %>
                        <table align="center">
                            <tr>
                                <th>
                                    <h3> Reporte: </br> <%=rep.getRep().getIdReporte()%> </h3>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <b> Reportado el: </b> <br/> <%=rep.getRep().getFechaI()%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b> Por: </b> <br/> <%=rep.getUser().getIdUsuario()%>. <%=rep.getUser().getNomUser()%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b> Correo: </b> <br/> <%=rep.getUser().getCorreo()%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b> Problemática: </b> <br/> <%=rep.getRep().getProblema()%>
                                </td>    
                            </tr>
                            <tr>
                                <td>
                                    <b> Estatus actual: </b> <br/> <%=rep.getRep().getEstatus()%>
                                </td>    
                            </tr>
                        </table>
                    
                        <%
                            if(rep.getRep().getEstatus().equals("En proceso")){
                        %>
                                <div> 
                                    <form method="post" action="Soporte.jsp">

                                        <input type="hidden" id="idTarea" name="idRep" value="<%=rep.getRep().getIdReporte()%>">
                                        <input type="hidden" id="estatusInicial" name="estatI" value="<%=rep.getRep().getEstatus()%>">
                                        <input type="hidden" id="estatusInicial" name="idIng" value="<%=sesion.getUsuario().getIdUsuario()%>">
                                        <input type="hidden" id="estat" name="estat" value="Solucionado">
                                        <label for="exampleFormControlTextarea1" class="form-label"> <b> Solución </b> </label>
                                        <%
                                            if(rep.getRep().getSolucion() == null || rep.getRep().getSolucion().equals("") || rep.getRep().getSolucion().equals(" ")){
                                                if(request.getParameter("sol") == null){
                                        %>
                                                    <textarea name="sol" id="sol" class="form-control" rows="3" required> </textarea>
                                        <%
                                                }else{
                                        %>
                                                    <textarea name="sol" id="sol" class="form-control" rows="3" required> <%=request.getParameter("sol")%> </textarea>
                                        <%
                                                }
                                            }else{
                                        %>
                                                <input type="hidden" id="sol" name="sol" value="<%=rep.getRep().getSolucion()%>">
                                                <textarea disabled="true" class="form-control" rows="3"> <%=rep.getRep().getSolucion()%> </textarea>
                                        <%
                                            }
                                        %>
                                        

                                        </br>
                                        <center>  
                                            <button type="submit" id="send" name="send" value="enviar" class="btn btn-primary btn-lg">Subir</button>
                                            <a href="Soporte.jsp"> <button type="button" class="btn btn-secondary btn-lg">Regresar a la lista</button> </a>
                                        </center>
                                    </form>
                                        
                                </div>
                        <%
                            } else if(rep.getRep().getEstatus().equals("Solucionado")){
                        %>
                                <div> 
                                    <form method="post" action="Soporte.jsp">

                                        <input type="hidden" id="idTarea" name="idRep" value="<%=rep.getRep().getIdReporte()%>">
                                        <input type="hidden" id="estatusInicial" name="estatI" value="<%=rep.getRep().getEstatus()%>">
                                        <input type="hidden" id="estatusInicial" name="idIng" value="<%=sesion.getUsuario().getIdUsuario()%>">
                                        <input type="hidden" id="sol" name="sol" value="<%=rep.getRep().getSolucion()%>">
                                        <input type="hidden" id="estat" name="estat" value="Cerrado">
                                        <label for="exampleFormControlTextarea1" class="form-label"> <b> Solución </b> </label>
                                        <textarea disabled="true" class="form-control" rows="3"> <%=rep.getRep().getSolucion()%> </textarea>

                                        </br>
                                        <center>  
                                            <button type="submit" id="send" name="send" value="enviar" class="btn btn-primary btn-lg">Cerrar reporte</button>
                                            <a href="Soporte.jsp"> <button type="button" class="btn btn-secondary btn-lg">Regresar a la lista</button> </a>
                                        </center>
                                    </form>
                                        
                                </div>
                        <%
                            } else if(rep.getRep().getEstatus().equals("Cerrado")){
                        %>
                                <div> 
                                    <table align="center">
                                        <tr>
                                            <td>
                                                <b> Finalizado el: </b> <br/> <%=rep.getRep().getFechaF()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Solución: </b> <br/> <%=rep.getRep().getSolucion()%>
                                            </td>
                                        </tr>
                                    </table>
                                    <center>         
                                        <a href="Soporte.jsp"> <button type="button" class="btn btn-secondary btn-lg">Regresar a la lista</button> </a>
                                    </center>
                                </div>
        <%                                
                    }
                }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.min.js" integrity="sha384-heAjqF+bCxXpCWLa6Zhcp4fu20XoNIA98ecBC1YkdXhszjoejr5y9Q77hIrv8R9i" crossorigin="anonymous"></script>
    </body>
</html>
