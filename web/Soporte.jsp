<%-- 
    Document   : Soporte
    Created on : 27/03/2023, 07:00:58 PM
    Author     : Axel Zarate Lozano
--%>

<%@page import="org.akar.dao.RelReporteEncargado"%>
<%@page import="org.akar.dao.Reporte"%>
<%@page import="org.akar.dao.PSUsuario"%>
<%@page import="java.util.List"%>
<%@page import="org.akar.helper.SolucionHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    PSUsuario sesion = (PSUsuario)session.getAttribute("usuario");

    if(sesion == null){
        response.sendRedirect("notSession.jsp");
    } else{
        if(sesion.getTipo().getIdTipo() != 7 && sesion.getTipo().getIdTipo() != 10){
            response.sendRedirect("notAccess.jsp");
        }
		
		
		
		int lastR = 0;
		
		
		
%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="sources\assets\images\logoAKAR100.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Soporte</title>
        <link href="sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="sources/assets/css/fontawesome.css">
        <link rel="stylesheet" href="sources/assets/css/akar.css">
        <link rel="stylesheet" href="sources/assets/css/animated.css">
        <link rel="stylesheet" href="sources/assets/css/owl.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    
    <body>    
        <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a href="Home.jsp" class="logo">
                                <img src="sources/assets/images/loguitoakar.png" alt="">
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <%
                                if(sesion.getTipo().getIdTipo() == 10){
                            %>
                                    <ul class="nav">
                                        <li class="scroll-to-section"><a href="Asistente.jsp">Asistente</a></li>
                                        <li class="scroll-to-section"><a href="GerenteSoporte.jsp">Gerente de soporte</a></li>
                                        <li class="scroll-to-section"><a href="GerenteMantenimiento.jsp">Gerente de mantenimiento</a></li>
                                        <li class="scroll-to-section"><a href="IngMantenimiento.jsp">Ing de mantenimiento</a></li>
                                        <li class="scroll-to-section"><a href="Soporte.jsp" class="active">Ing de soporte</a></li>
                                        <li class="scroll-to-section"><a href="?action=close">Cerrar sesión</a></li> 
                                    </ul>        
                                    <a class='menu-trigger'>
                                        <span>Menu</span>
                                    </a>
                            <%
                                } else{
                            %>
                                    <ul class="nav">
                                    <li class="scroll-to-section"><a href="#top" class="active">Inicio</a></li>
                                    <li class="scroll-to-section"><a href="#sobrenosotros">Sobre nosotros</a></li>
                                    <li class="scroll-to-section"><a href="#proyecto">Proyecto</a></li>
                                    <li class="scroll-to-section"><a href="#galeria">Galería</a></li>
                                    <li class="scroll-to-section"><a href="Foro.jsp">Foro</a></li>
                                    <li class="scroll-to-section"><a href="#contact">Contáctanos</a></li> 
                                    <li class="scroll-to-section">
                                      <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="true"> <%= sesion.getUsuario().getNomUser() %> </a>
                                      <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="profile.jsp">Perfil</a></li>
                                        <li><a class="dropdown-item" href="editProf.jsp">Editar perfil</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="?action=close" id="action" name="action" value="close">Cerrar sesión</a></li>
                                      </ul>
                                    </li>



                                  </ul>        
                                  <a class='menu-trigger'>
                                      <span>Menu</span>
                                  </a>
                            <%
                                }
                            %>
                            
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        
        <%
            String action = request.getParameter("action");
            if(action == null){
                action = "";
            }
            switch(action){
                case "close":
                    request.getSession().removeAttribute("usuario");
                    response.sendRedirect("index.jsp");
                    break;
            }        
        %>
        
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        
        <br/>
        <br/>
        <%
            if(!action.equals("rep")){
                List<RelReporteEncargado> list = new SolucionHelper().getList();
                if (list == null){
        %>
                    <h3> No hay reportes asignados </h3>
        <%
                } else {
        %>
                    <div>
                        <table width="70%" align="center">
                            <tr>
                                <th>
                                    <h4 align="center">Reportes en proceso</h4>
                                </th>
                                <th>
                                    <h4 align="center">Reportes solucionados</h4>
                                </th>   
                                <th>
                                    <h4 align="center">Reportes cerrados</h4>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <table class="table">
                                        <tr>
                                            <th>
                                                Reporte
                                            </th>
                                            <th>
                                                Fecha de creación
                                            </th>
                                            <th>
                                                Estatus
                                            </th>
                                        </tr>

                                        <%
                                            if(sesion.getTipo().getIdTipo() == 10){
                                                for(RelReporteEncargado reporte : list){
                                                    if(reporte.getRep().getEstatus().equals("En proceso")){
														if(lastR != reporte.getRep().getIdReporte()){
															lastR = reporte.getRep().getIdReporte();
                                        %>
															<tr>
																<td>
																	<a href="?action=rep&tipo=Sol&idreporte=<%=reporte.getRep().getIdReporte()%>"> <button type="button" class="btn btn-dark"> <%=reporte.getRep().getIdReporte()%> </button> </a>
																</td>
																<td>
																	<%=reporte.getRep().getFechaI()%>
																</td>
																<td>
																	<%=reporte.getRep().getEstatus()%>
																</td>
															</tr>    
                                        <%
														}
													}
                                                }
                                            } else {
                                                for(RelReporteEncargado reporte : list){
                                                    if(reporte.getRep().getEstatus().equals("En proceso")){
                                                        if(reporte.getEncargado().getIdUsuario() == sesion.getUsuario().getIdUsuario()){
                                        %>
                                                            <tr>
                                                                <td>
                                                                    <a href="?action=rep&tipo=Sol&idreporte=<%=reporte.getRep().getIdReporte()%>"> <button type="button" class="btn btn-dark"> <%=reporte.getRep().getIdReporte()%> </button> </a>
                                                                </td>
                                                                <td>
                                                                    <%=reporte.getRep().getFechaI()%>
                                                                </td>
                                                                <td>
                                                                    <%=reporte.getRep().getEstatus()%>
                                                                </td>
                                                            </tr>
                                        <%
                                                        }
                                                    }
                                                }
                                            }
                                        %>
                                    </table>
                                </td>
                                <td>
                                    <table class="table">
                                        <tr>
                                            <th>
                                                Reporte
                                            </th>
                                            <th>
                                                Fecha de creación
                                            </th>
                                            <th>
                                                Estatus
                                            </th>
                                        </tr>

                                        <%
                                            if(sesion.getTipo().getIdTipo() == 10){
                                                for(RelReporteEncargado reporte : list){
                                                    if(reporte.getRep().getEstatus().equals("Solucionado")){
														if(lastR != reporte.getRep().getIdReporte()){
															lastR = reporte.getRep().getIdReporte();
                                        %>
															<tr>
																<td>
																	<a href="?action=rep&tipo=Sol&idreporte=<%=reporte.getRep().getIdReporte()%>"> <button type="button" class="btn btn-dark"> <%=reporte.getRep().getIdReporte()%> </button> </a>
																</td>
																<td>
																	<%=reporte.getRep().getFechaI()%>
																</td>
																<td>
																	<%=reporte.getRep().getEstatus()%>
																</td>
															</tr>    
                                        <%
														}
													}
                                                }
                                            } else {
                                                for(RelReporteEncargado reporte : list){
                                                    if(reporte.getRep().getEstatus().equals("Solucionado")){
                                                        if(reporte.getEncargado().getIdUsuario() == sesion.getUsuario().getIdUsuario()){
                                        %>
                                                            <tr>
                                                                <td>
                                                                    <a href="?action=rep&tipo=Sol&idreporte=<%=reporte.getRep().getIdReporte()%>"> <button type="button" class="btn btn-dark"> <%=reporte.getRep().getIdReporte()%> </button> </a>
                                                                </td>
                                                                <td>
                                                                    <%=reporte.getRep().getFechaI()%>
                                                                </td>
                                                                <td>
                                                                    <%=reporte.getRep().getEstatus()%>
                                                                </td>
                                                            </tr>
                                        <%
                                                        }
                                                    }
                                                }
                                            }
                                        %>
                                    </table>
                                </td>
                                <td>
                                    <table class="table">
                                        <tr>
                                            <th>
                                                Reporte
                                            </th>
                                            <th>
                                                Fecha de creación
                                            </th>
                                            <th>
                                                Fecha de finalización
                                            </th>
                                            <th>
                                                Estatus
                                            </th>
                                        </tr>

                                        <%
                                            if(sesion.getTipo().getIdTipo() == 10){
                                                for(RelReporteEncargado reporte : list){
                                                    if(reporte.getRep().getEstatus().equals("Cerrado")){
														if(lastR != reporte.getRep().getIdReporte()){
															lastR = reporte.getRep().getIdReporte();
                                        %>
															<tr>
																<td>
																	<a href="?action=rep&tipo=Sol&idreporte=<%=reporte.getRep().getIdReporte()%>"> <button type="button" class="btn btn-dark"> <%=reporte.getRep().getIdReporte()%> </button> </a>
																</td>
																<td>
																	<%=reporte.getRep().getFechaI()%>
																</td>
																<td>
																	<%=reporte.getRep().getFechaF()%>
																</td>
																<td>
																	<%=reporte.getRep().getEstatus()%>
																</td>
															</tr>    
                                        <%
														}
													}
                                                }
                                            } else {
                                                for(RelReporteEncargado reporte : list){
                                                    if(reporte.getRep().getEstatus().equals("Cerrado")){
                                                        if(reporte.getEncargado().getIdUsuario() == sesion.getUsuario().getIdUsuario()){
                                        %>
                                                            <tr>
                                                                <td>
                                                                    <a href="?action=rep&tipo=Sol&idreporte=<%=reporte.getRep().getIdReporte()%>"> <button type="button" class="btn btn-dark"> <%=reporte.getRep().getIdReporte()%> </button> </a>
                                                                </td>
                                                                <td>
                                                                    <%=reporte.getRep().getFechaI()%>
                                                                </td>
                                                                <td>
                                                                    <%=reporte.getRep().getFechaF()%>
                                                                </td>
                                                                <td>
                                                                    <%=reporte.getRep().getEstatus()%>
                                                                </td>
                                                            </tr>
                                        <%
                                                        }
                                                    }
                                                }
                                            }
                                        %>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>        
        <%
                }
            }else{
        %>
                <jsp:include page="reporte.jsp" />
                
        <%
            }

            String send = request.getParameter("send");
            if(send == null){
                send = "";
            }
            
            if(send.equals("enviar")){
                String updated = new SolucionHelper().sp_Soporte(request);
                if(!updated.equals("Reporte actualizado")){
        %>
                    <script> 
                        Swal.fire({
                            icon: 'warning',
                            title: 'Alerta',
                            text: '<%=updated%>',
                            footer: '<button type="button" class="btn btn-light"> <a href="Soporte.jsp">Actualizar página</a> </button>'
                          }); 
                    </script>
        <%        
                } else{
        %>
                    <script> 
                        Swal.fire({
                            icon: 'success',
                            title: 'Atención',
                            text: '<%=updated%>',
                            footer: '<button type="button" class="btn btn-light"> <a href="Soporte.jsp">Actualizar página</a> </button>'
                          }); 
                    </script>
        <%                
                }
            }
        %>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.min.js" integrity="sha384-heAjqF+bCxXpCWLa6Zhcp4fu20XoNIA98ecBC1YkdXhszjoejr5y9Q77hIrv8R9i" crossorigin="anonymous"></script>
        
    </body>

</html>
<%
    }
%>