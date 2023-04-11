<%@page import="org.akar.dao.PSUsuario"%>
<%@page import="org.akar.dao.PSReporte"%>
<%@page import="org.akar.helper.ReporteGerenteHelper"%>
<%@page import="java.util.List"%>
<%@page import="org.akar.dao.Reporte"%>
<%
    PSUsuario sesion = (PSUsuario)session.getAttribute("usuario");

    if(sesion != null){
        if(sesion.getTipo().getIdTipo() != 6 && sesion.getTipo().getIdTipo() != 10){
            response.sendRedirect("notAccess.jsp");
        }
    } else{
        response.sendRedirect("notSession.jsp");
    }
%>
<html lang="esp">
    <link rel="stylesheet" href="sources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="sources/assets/css/akar.css">
    <link rel="stylesheet" href="sources/assets/css/animated.css">
    <link rel="stylesheet" href="sources/assets/css/owl.css">
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Gerente de Soporte</title>
    </head>
    <body>
        <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <%
                                if(sesion.getTipo().getIdTipo() == 10){
                            %>
                                    <ul class="nav">
                                        <li class="scroll-to-section"><a href="Asistente.jsp">Asistente</a></li>
                                        <li class="scroll-to-section"><a href="GerenteSoporte.jsp" class="active">Gerente de soporte</a></li>
                                        <li class="scroll-to-section"><a href="GerenteMantenimiento.jsp">Gerente de mantenimiento</a></li>
                                        <li class="scroll-to-section"><a href="IngMantenimiento.jsp">Ing de mantenimiento</a></li>
                                        <li class="scroll-to-section"><a href="Soporte.jsp">Ing de soporte</a></li>
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
                            
                            <!-- ** Menu End ** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
                                      <br>
                            <br>
                            <br><br><br>
     <h1><center>Reportes Abiertos y en Mantenimiento</center></h1>
     <br>
     <br>
    <%
            String action = request.getParameter("action");
            List<Reporte> Reportito= new ReporteGerenteHelper().getList();
            if(action == null){
                action = "";
            }
            if(Reportito==null){
                %>
     <h2><center>Sin reportes</center></h2>
                <%
            }
            else{
        %>
    <div align="center">
                        <table class="table">
                            <tr>
                                <th>
                                    Reporte
                                </th>
                                <th>
                                    Estatus
                                </th>
                                <th>
                                    Fecha Inicial
                                </th>
                                <th>
                                    Ultima Fecha de modificación
                                </th>
                                <th>
                                    Fecha Final
                                </th>
                            </tr>

                            <%
                                for(Reporte reportito : Reportito){
                            %>
                                    <tr>
                                        <td>
                                            <a href="?action=rep&idreporte=<%=reportito.getIdReporte()%>"> <%=reportito.getIdReporte()%></a>
                                        </td>
                                        <td>
                                            <%=reportito.getEstatus() %>
                                        </td>
                                        <td>
                                            <%=reportito.getFechaI()%>
                                        </td>
                                        <td>
                                            <%=reportito.getFechaI()%>
                                        </td>
                                         <td>
                                            <%=reportito.getFechaF()%>
                                        </td>
                                    </tr>    
                            <%
                                }
                            }
                            %>

                        </table>
        
        <br>
        <br>
                    </div>        
                            <%
                                if (action.equals("rep")) {
                            %>
                                    <jsp:include page="ReporteGerente.jsp" />
                            <%
                                }
                   String send=request.getParameter("send");
                        if(send==null){
                            send="";
                        }
                    if(send.equals("enviar")){
                    boolean reporte;
                    reporte=new ReporteGerenteHelper().AsignarReporteIng(request);;
                    if(reporte == true){
        %>
                        <script>
                            window.location.replace("GerenteSoporte.jsp");
                        </script>
        <%
                    } else{
        %>
                        <script>
                            window.location.replace("GerenteSoporte.jsp");
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