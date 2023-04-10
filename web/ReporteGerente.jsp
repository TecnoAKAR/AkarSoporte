<%-- 
    Document   : ReporteGerente
    Created on : 3/04/2023, 12:01:26 AM
    Author     : kalid
--%>

<%@page import="java.util.List"%>
<%@page import="org.akar.dao.TblUsuario"%>
<%@page import="org.akar.helper.ReporteGerenteHelper"%>
<%@page import="org.akar.dao.Reporte"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <body>
        <%
            String action = request.getParameter("action");
            if(action == null){
                action = "";
            }  
            
                    Reporte sol = new ReporteGerenteHelper().getById(request);
                    List<TblUsuario> reportito = new ReporteGerenteHelper().getlist();
                    List<TblUsuario> reportito2= new ReporteGerenteHelper().getlist2();
                    if(sol == null){
        %>
                        <h3> Ha ocurrido un error </h3>
        <%
                    } else{
        %>
                        <div align="left">
                            <table width="50%">
                                <tr>
                                    <th>
                                        <h3> <%=sol.getIdReporte()%></h3>
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <b> Reportado el: </b> <br/> <%=sol.getFechaI()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b> Problemática: </b> <br/> <%=sol.getProblema()%>
                                    </td>    
                                </tr>
                                <tr>
                                    <td>
                                        <b> Solución </b> <br/> <%=sol.getSolucion()%>
                                    </td>  
                                </tr>
                            </table>
                        </div>
                        <div>
                            <form method="post" action="GerenteSoporte.jsp">
                                <input hidden="true" id="Problema" name="Problema" value="<%=sol.getProblema()%>">
                                <label for="exampleFormControlInput1" class="form-label"> <b> Estatus </b> </label>
                                <select id="Estatus" name="Estatus" class="form-control">
                                    <option disable="true"> <%=sol.getEstatus()%> </option>
                                    <option value="En proceso">En proceso</option>
                                    <option value="A Mantenimiento">A Mantenimiento</option>
                                </select>
                                <label for="exampleFormControlInput1" class="form-label"> <b> Encargado </b> </label>
                                <select id="idEncargado" name="idEncargado" class="form-select" aria-label="Default select example">
                                <%
                                    for(TblUsuario repor : reportito){
                                        %>
                                            <option value="<%=repor.getNomUser()%>"> <%=repor.getNomUser()%>,Ingeniero de Soporte</option>                            
                                        <%
                                    }
                                %>
                                 <%
                                    for(TblUsuario repor : reportito2){
                                        %>
                                            <option value="<%=repor.getNomUser()%>"> <%=repor.getNomUser()%>,Gerente de Mantenimiento </option>                            
                                        <%
                                    }
                                %>
                                </select>

                                <button type="submit" id="send" name="send" value="enviar" class="btn btn-primary btn-lg">Asignar</button>
                            </form>
                        </div>
        <%                                
                    }
        %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.min.js" integrity="sha384-heAjqF+bCxXpCWLa6Zhcp4fu20XoNIA98ecBC1YkdXhszjoejr5y9Q77hIrv8R9i" crossorigin="anonymous"></script>
    </body>
</html>