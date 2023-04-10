<%-- 
    Document   : IngMantenimiento
    Created on : 28/03/2023, 10:42:57 PM
    Author     : 52553
--%>

<%@page import="org.akar.dao.PSUsuario"%>
<%@page import="org.akar.dao.ReporteCambios"%>
<%@page import="org.akar.helper.ListEstatusHelper"%>
<%@page import="org.akar.dao.Reporte"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="esp">
    <%
    PSUsuario sesion = (PSUsuario)session.getAttribute("usuario");
    if(sesion != null){
        if(sesion.getTipo().getIdTipo() != 9 && sesion.getTipo().getIdTipo() != 10){
            response.sendRedirect("notAccess.jsp");
        }
    } else{
        response.sendRedirect("notSession.jsp");
    }
%>
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
        <title>Ingeniero de mantenimiento</title>
        <link href="sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="sources/assets/css/fontawesome.css">
        <link rel="stylesheet" href="sources/assets/css/akar.css">
        <link rel="stylesheet" href="sources/assets/css/animated.css">
        <link rel="stylesheet" href="sources/assets/css/owl.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    </head>
    <style> 
        body{
            margin: 0;
        }
        
        .left{
           background: #f3f3f3;
           width: 100%;
           position: fixed ;
           top: 50px;
           height: 40%;
           left: 0px;
        }
        .right{
            width: 100%;
            height: 60%;
            position: fixed;
            bottom: 0px;
            right: 0px;
        }
        .Solucion{
            width: 90%;
        }
        .Selecciona{
            width: 85%;
        }
    </style>
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
                                    <li class="scroll-to-section"><a href="?action=close">Cerrar sesión</a></li>



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
        <div class="container">
            
            <div class="left"> 
                <h1><center>Reportes asignados</center></h1>
                <hr>
                <div >
                    <table class="table table-striped table-hover">
                        <thead>
                          <tr>
                              <th><h4>Identificador</h4></th> 
                              <th><h4>Tareas asignadas</h4></th>
                              <th><h4>Estatus</h4></th>
                              <th><h4>Fecha de reporte</h4></th>  
                              <th><h4>Usuario</h4></th>  
                          </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <%
                            List<ReporteCambios>ListEstatus = new ListEstatusHelper().getList();
                            if( ListEstatus != null && ListEstatus.size() > 0 )
                            {
                               for( ReporteCambios listEstatus : ListEstatus )
                               {
                        %>
                          <tr>
                            <th value="<%=listEstatus.getRep().getIdReporte()%>">
                                
                                <a href="?action=rep&idreporte=<%=listEstatus.getRep().getIdReporte()%>"> <%=listEstatus.getRep().getIdReporte()%> </a>
                                
                            </th>
                            <th><%=listEstatus.getRep().getProblema()%></th>
                            <th><%=listEstatus.getRep().getEstatus()%></th>
                            <th><%=listEstatus.getRep().getFechaI()%></th>
                            <th><%=listEstatus.getUsuario().getCorreo()%></th>
                            
                            
                            <%
                                }
                            }
                        %>
                            
                          </tr>
                          
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="right">
                <%
                               if(action.equals("rep")){
                            %>
                                <jsp:include page="reporteSol.jsp" />
                            <%
                                }
            String send = request.getParameter("action");
            if(send == null){
                send = "";
            }
            
            if(send.equals("send")){
                boolean updated = new ListEstatusHelper().addRegistro(request);
                if(updated == true){
                %>
                    <script> alert("Reporte finalizado"); </script>
        <%
                } else{
        %>
                    <script> alert("Hubo un error al actualizar el reporte"); </script>
        <%
                }
            }
         %>
            </div>
        </div>
         
    </body>
</html>
