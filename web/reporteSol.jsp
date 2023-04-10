<%-- 
    Document   : reporteSol
    Created on : 2/04/2023, 01:25:12 PM
    Author     : 52553
--%>

<%@page import="org.akar.dao.ReporteCambios"%>
<%@page import="org.akar.helper.ListEstatusHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="esp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        #scroll{
            border:1px solid;
            height:300px;
            width:90%;
            overflow-y:scroll;
            overflow-x:hidden;
            scroll-behavior: auto;
        }
    </style>
    </head>
    <body>
        <%
            String action = request.getParameter("action");
            if(action == null){
                action = "";
            }else{
                ReporteCambios sol = new ListEstatusHelper().getById(request);
            
            
        %>
        
        <br>
        <br>
                <center>
                    <div class="Solucion" id="scroll">
                        <%
                                if(sol.getRep().getSolucion()!=null){
                            System.out.println();        
                                
                            %>
                        <form>
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Identificador</h4></label>
                            <br>
                            <input type="hidden" name="IdReporte" value="<%=sol.getRep().getIdReporte()%>"><%=sol.getRep().getIdReporte()%></input>
                            <br>
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Descripción</h4></label>
                            <br>
                            
                            <label for="exampleFormControlTextarea1" class="form-label"><%=sol.getRep().getProblema() %></label>
                            <br>
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Identificador encargado</h4></label>
                            <br>
                            <input type="hidden" name="IdUsuario" value="5">5</input>
                            <br>
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Estatus actual</h4></label>
                            <br>
                            <input type="hidden" name="EstatusI" value="<%=sol.getEstatusI() %>"><%=sol.getEstatusI() %></input>
                            
                            <br>
                            
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Usuario</h4></label>
                            <br>
                            <input type="hidden" name="EstatusI" value="<%=sol.getUsuario().getCorreo()%>"><%=sol.getUsuario().getCorreo()%></input>
                            
                            <br>
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Cambiar Estatus</h4></label>
                            <select class="form-select" aria-label="Default select example" name="EstatusF">
                                    
                                    <option aria-label="Default select example" value="Programacion Finalizada">Programacion Finalizada</option>
                            </select>
                            <br>
                            <div class="mb-3">
                                    <label for="exampleFormControlTextarea1" class="form-label" disable="true "><h4>Solución</h4></label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="<%=sol.getRep().getSolucion()%>" name="Solucion" disabled="true"></textarea>
                            </div>
                            
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Fecha</h4></label>
                                <br>
                                <label for="exampleFormControlTextarea1" class="form-label" name="FechaC" value="<%=sol.getRep().getFechaI()%>"><%=sol.getRep().getFechaI() %></label>
                                <br>
                                
                        </form>
                                <%
                                    
                                
                                }else{
                            %>
                            <form>
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Identificador</h4></label>
                            <br>
                            <input type="hidden" name="IdReporte" value="<%=sol.getRep().getIdReporte()%>"><%=sol.getRep().getIdReporte()%></input>
                            <br>
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Descripción</h4></label>
                            <br>
                            
                            <label for="exampleFormControlTextarea1" class="form-label"><%=sol.getRep().getProblema() %></label>
                            <br>
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Identificador encargado</h4></label>
                            <br>
                            <input type="hidden" name="IdUsuario" value="5">5</input>
                            <br>
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Estatus actual</h4></label>
                            <br>
                            <input type="hidden" name="EstatusI" value="<%=sol.getEstatusI() %>"><%=sol.getEstatusI() %></input>
                            
                            <br>
                            
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Usuario</h4></label>
                            <br>
                            <input type="hidden" name="EstatusI" value="<%=sol.getUsuario().getCorreo()%>"><%=sol.getUsuario().getCorreo()%></input>
                            
                            <br>
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Cambiar Estatus</h4></label>
                            <select class="form-select" aria-label="Default select example" name="EstatusF">
                                    
                                    <option aria-label="Default select example" value="Programacion Finalizada">Programacion Finalizada</option>
                            </select>
                            <br>
                            <div class="mb-3">
                                    <label for="exampleFormControlTextarea1" class="form-label" disable="true "><h4>Solución</h4></label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Escribe la solución del reporte" name="Solucion"></textarea>
                            </div>
                            
                            <label for="exampleFormControlTextarea1" class="form-label"><h4>Fecha</h4></label>
                                <br>
                                <label for="exampleFormControlTextarea1" class="form-label" name="FechaC" value="<%=sol.getRep().getFechaI()%>"><%=sol.getRep().getFechaI() %></label>
                                <br>
                                <br>
                            
                                
                                <input type="hidden" id="action" name="action" value="send" />
                                <button type="submit" class="btn btn-secondary">Subir solución</button>
                                <br>
                        </form>
                                <%
                                    
                                
                                }
                    }
                            %>
                    </div>
                </center>
    </body>
</html>
