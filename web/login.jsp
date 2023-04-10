<%-- 
Document   : login
Created on : 12/10/2022, 10:52:51 PM
Author     : AKAR
--%>

<%@page import="org.akar.helper.PSResPassHelper"%>
<%@page import="org.akar.dao.PSUsuario"%>
<%@page import="org.akar.helper.PSUsuarioHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>

<html lang="es">
    <head>
        <title>Login</title>
        <link rel="icon" href="sources\assets\images\logoAKAR100.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="sources/login&signup/css/style.css"> 
        
        <link rel="stylesheet" href="sources/assets/css/akar.css">
        <link rel="stylesheet" href="sources/assets/css/animated.css">
        <link rel="stylesheet" href="sources/assets/css/owl.css">
        
    </head>
    <body class="img js-fullheight" style="background-image: url(sources/assets/images/quote-bg-v2.jpg);">
        
        <div id="js-preloader" class="js-preloader">
            <div class="preloader-inner">
                <span class="dot"></span>
                <div class="dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        
        <div class="contenedor">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Inicie Sesión</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    
                
                <%
                    if( request == null )
                    {
                        return;
                    }
                    String action = request.getParameter( "action" );
                    if( action == null )
                    {
                        action = "";
                    }
                    
                    if(!action.equals("resPass")){
                %>
                        <div class="col-md-6 col-lg-4">
                            <div class="login-wrap p-0">
                                <form action="login.jsp" class="signin-form" method="post">
                                    <div class="form-group">
                                        <input type="text" name="nomU" id="nomU" class="form-control" placeholder="Nombre de usuario" required>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" type="password" class="form-control" id="pass" name="pass" placeholder="Contraseña" required> 
                                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"> </span>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" id="action" name="action" value="send" class="form-control btn btn-primary submit px-3">Iniciar sesión</button>
                                    </div>
                                    <div class="form-group d-md-flex">
                                        <div class="w-100 text-center">
                                                ¿Todavía no tienes una cuenta? <a href="signup.jsp" style="color: #00e7ff"> Cree una. </a>
                                        </div>
                                    </div>
                                    <div class="form-group d-md-flex">
                                        <div class="w-100 text-center">
                                                ¿Olvidó su contraseña? <a href="?action=resPass" style="color: #00e7ff"> Restablecer contraseña. </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                <%    
                    }
                    switch(action){
                        case "send":
                            PSUsuario usuario = new PSUsuarioHelper().Login(request);
                            if( usuario != null){
                                HttpSession sesion = request.getSession();
                                sesion.setAttribute("usuario", usuario);

                                if(usuario.getTipo().getIdTipo() == 5){
                                    response.sendRedirect("Asistente.jsp");
                                } else if(usuario.getTipo().getIdTipo() == 6){
                                    response.sendRedirect("GerenteSoporte.jsp");
                                } else if(usuario.getTipo().getIdTipo() == 7){
                                    response.sendRedirect("Soporte.jsp");
                                } else if(usuario.getTipo().getIdTipo() == 8){
                                    response.sendRedirect("GerenteMantenimiento.jsp");
                                }else if(usuario.getTipo().getIdTipo() == 9){
                                    response.sendRedirect("IngMantenimiento.jsp");
                                } else if(usuario.getTipo().getIdTipo() == 10){
                                    response.sendRedirect("Asistente.jsp");
                                }else{
                                    response.sendRedirect("Home.jsp");
                                }
                                
                            }
                            else{
                %>
                                <script>
                                    alert("Los datos que usted ingresó son incorrectos.");
                                </script>
                <%
                            }
                            break;
                        case "resPass":
                            
                %>   
                            <div class="col-md-6 col-lg-4">
                                <div class="login-wrap p-0">
                                    <form action="#" class="signin-form">
                                        <div class="form-group">
                                            <input type="email" name="CorreoRec" id="CorreoRec" class="form-control" placeholder="Correo electrónico con el que se registró" required>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" id="action" name="action" value="newPass" class="form-control btn btn-primary submit px-3">Recuperar contraseña</button>
                                        </div>
                                    </form>
                                </div>
                            </div>   
                <%
                            break;
                        case "newPass":
                            boolean isTokenG = new PSResPassHelper().setToken(request);
                            if (isTokenG = true) {
                %>
                                <script>
                                    alert("Revise su correo electrónico");
                                </script>
                <%        
                            }
                            else{
                %>
                                <script>
                                    alert("Su token no ha sido generado.");
                                </script>
                <% 
                            }                            
                            break;
                    }
                %>
                </div>
            </div>
        </div>

        <script src="sources/login&signup/js/jquery.min.js"></script>
        <script src="sources/login&signup/js/popper.js"></script>
        <script src="sources/login&signup/js/bootstrap.min.js"></script>
        <script src="sources/login&signup/js/main.js"></script>
        
        
        <script src="sources/vendor/jquery/jquery.min.js"></script>
        <script src="sources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="sources/assets/js/owl-carousel.js"></script>
        <script src="sources/assets/js/animation.js"></script>
        <script src="sources/assets/js/imagesloaded.js"></script>
        <script src="sources/assets/js/custom.js"></script>
        
        <style>
            .contenedor {
                align-items: center;
                display: flex;
                justify-content: center;
                height: 100%;
            }
        </style>

        
    </body>
</html>
