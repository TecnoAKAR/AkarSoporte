<%@page import="org.akar.dao.TblUsuario"%>
<%@page import="org.akar.helper.ReporteGerenteMHelper"%>
<%@page import="java.util.List"%>
<%@page import="org.akar.dao.Reporte"%>
<%@page import="org.akar.dao.PSUsuario"%>
<%@page import="org.akar.helper.RegistroTareaHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    PSUsuario sesion = (PSUsuario)session.getAttribute("usuario");
    List<Reporte> historial=new ReporteGerenteMHelper().getlist5();

    if(sesion != null){
        if(sesion.getTipo().getIdTipo() != 5 && sesion.getTipo().getIdTipo() != 10){
            response.sendRedirect("notAccess.jsp");
        }
    } else{
        response.sendRedirect("notSession.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asistente</title>
        <link rel="preconnect" href="https://fonts.googleapis.com/%22%3E
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="sources/assets/css/fontawesome.css">
        <link rel="stylesheet" href="sources/assets/css/akar.css">
        <link rel="stylesheet" href="sources/assets/css/animated.css">
        <link rel="stylesheet" href="sources/assets/css/owl.css">
    
    </head>
    <style>
        h1{
            font-family:"Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
            font-size: 69px;
            padding: 20px 20px;
            text-align: center;
        }
        
        body{
            margin-left: 200px;
            margin-right: 200px;   
        }
    </style>
    
    
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
                                        <li class="scroll-to-section"><a href="Asistente.jsp" class="active">Asistente</a></li>
                                        <li class="scroll-to-section"><a href="GerenteSoporte.jsp">Gerente de soporte</a></li>
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
                            
                            <!-- * Menu End * -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
                            <br>
                            <br>
                            <br><br><br>
        
    

  <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <!-- * Logo Start * -->
            <a href="index.jsp" class="logo">
              <img src="sources/assets/images/loguitoakar.png" alt="">
            </a>
            <!-- * Logo End * -->
            <!-- * Menu Start * -->
            <ul class="nav">
              <li class="scroll-to-section"><div class="border-first-button"><a href="?action=close">Cerrar sesión</a></div></li>
            </ul> 
            <ul class="nav">
              <li class="scroll-to-section"><div class="border-first-button"><a href="Home.jsp">Regresar</a></div></li> 
            </ul>  
            <a class='menu-trigger'>
                <span>Menu</span>
            </a>
            <!-- * Menu End * -->
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
                case "send":
                    boolean act = new RegistroTareaHelper().addRegistro(request);
                    if(act == true){
        %>
                        <!-- <script> alert("Se ha actualizado el estatus del reporte."); </script> -->
                        <script>
                            window.location.replace("Asistente.jsp");
                        </script>
        <%
                    } else{
        %>
                        <!-- <script> alert("No se ha actualizado."); </script> -->
                        <script>
                            window.location.replace("Asistente.jsp");
                        </script>
        <%
                    } 
                    break;          
                case "close":
                    request.getSession().removeAttribute("usuario");
                    response.sendRedirect("index.jsp");
                    break;
        }
        %>
        
        <br><br><br><br>
        <h1> Bienvenido Asistente!</h1>
        <br>
        <div>
            <form>
                <div>
                <div>
                    <%
                        List<TblUsuario> list = new RegistroTareaHelper().getListU();
                    %>
                    <select name="correo" id="correo" class="form-select" aria-label="Default select example" required="true">
                        <option selected="true" value=""> Seleccione un usuario </option>
                        <%
                            for(TblUsuario usuario : list){
                        %>
                        <option value="<%=usuario.getCorreo()%>"> <%=usuario.getNomUser()%> - <%=usuario.getCorreo()%> </option>
                        <%
                            }
                        %>
                    </select>
                </div>
                </br>
                <div class="mb-3">
                    <textarea class="form-control" id="desc" name="desc" rows="10" maxlength="1024" placeholder="Descripción del problema" required></textarea>
                    <br>
                    <br>
                </div>
                <div class="d-grid gap-2 col-6 mx-auto">
                    <button type="submit" id="action" name="action" class="btn btn-outline-dark" value="send">Subir reporte</button>
                </div>
            </form>
        </div>
                <br>
                <br><br><br><br>
                
                <%
                if(historial==null){
                %>
                        
     <h4><center>Sin reportes</center></h4>
                <%
                    }
                    else{
%>
                <h2>Historial</h2>           
        <table class="table">
                            <tr>
                                <th>
                                    Reporte
                                </th>
                                <th>
                                    Problema
                                </th>
                                <th>
                                    Fecha Inicial
                                </th>
                            </tr>

                            <%
                                for(Reporte reportito : historial){
                            %>
                                    <tr>
                                        <td>
                                            <%=reportito.getIdReporte()%>
                                        </td>
                                        <td>
                                            <%=reportito.getProblema()%>
                                        </td>
                                        <td>
                                            <%=reportito.getFechaI()%>
                                        </td>
                                    </tr>  
                            <%
                                }
}
                                
                            %>

                        </table>
        
        
    </body>
</html>