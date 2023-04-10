<%-- 
Document   : login
Created on : 12/10/2022, 10:52:51 PM
Author     : AKAR
--%>

<%@page import="org.akar.helper.PSResPassHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>

<html lang="es">
    <head>
        <title>Restablecer contraseña</title>
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
    <%
        if(new PSResPassHelper().getToken(request) == true)
        {
    %>   
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
                        <h2 class="heading-section">Restablecer contraseña</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                            <div class="login-wrap p-0">
                                <form action="#" class="signin-form" method="post">
                                    <div class="form-group">
                                        <input type="email" name="Correo" id="Correo" class="form-control" placeholder="Correo electrónico" required>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" type="password" class="form-control" id="newPass" name="newPass" placeholder="Contraseña nueva" required> 
                                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"> </span>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" type="password" class="form-control" id="pass" name="pass" placeholder="Repetir contraseña nueva" required> 
                                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"> </span>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" id="action" name="action" value="res" class="form-control btn btn-primary submit px-3">Restablecer contraseña</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                
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
                    switch(action){
                        case "res":
                            if(request.getParameter("newPass").equals(request.getParameter("pass"))){
                                boolean resPass = new PSResPassHelper().resPass(request);
                                if( resPass == true){
                                    response.sendRedirect("login.jsp");
                                }
                                else{
                %>
                                    <script>
                                        alert("Ha ocurrido un error y la contraseña no se ha actualizado.");
                                    </script>
                <%
                                }
                            }
                            else{
                %>
                                <script>
                                    alert("Las contraseñas ingresadas no coinciden.");
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

    <%
        }else{
    %>
            <script>
                alert("Su token ha caducado o es incorrecto. Genere otro por favor.");
            </script>
    <%
        }
    %>   
    </body>
</html>
