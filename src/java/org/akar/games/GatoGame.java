package org.akar.games;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.akar.extConnections.Cliente;
import org.akar.extConnections.Servidor;

/**
 *
 * @author Axel Zarate Lozano
 */
@WebServlet(urlPatterns = {"/gato"})
public class GatoGame extends HttpServlet {

    private GatoLogic gLog;
    private String act;
    private Servidor servidor;
    private Cliente cliente;
    private int turno;
    private String msj;
    private String values;

    public GatoGame() {
        act = null;
        servidor = null;
        cliente = null;
        turno = 1;
        gLog = new GatoLogic();
        msj = "";
        values = "";
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");https://github.com/TecnoAKAR/WebSite.git

        try (PrintWriter out = response.getWriter()) {            

            if (act == null) {
                act = request.getParameter("act");
            }

            if (servidor == null && cliente == null) {
                if (act.equals("client")) {
                    cliente = new Cliente();
                    cliente.conexion(request.getParameter("ip"), request.getParameter("port"));
                    while (cliente.isConnected() == false) {
                        out.println("<script> console.log(\"Esperando\"); </script>");
                        System.out.println("Esperando conexion");
                        Thread.sleep(1000);
                    }
                    out.println("<script> console.log(\"Conexión establecida\"); </script>");
                    System.out.println("Conexion establecida");
                    System.out.println(cliente.connectedWith());

                } else if (act.equals("server")) {
                    servidor = new Servidor();
                    servidor.conexion(request.getParameter("port"));
                    while (servidor.isConnected() == false) {
                        out.println("<script> console.log(\"Esperando\"); </script>");
                        System.out.println("Esperando conexion");
                        Thread.sleep(1000);
                    }
                    System.out.println(servidor.isConnected().toString());
                    out.println("<script> console.log(\"Conexión establecida\"); </script>");
                    System.out.println("Conexion establecida");
                    System.out.println(servidor.connectedWith());
                }
                response.setIntHeader("Refresh", 1);
            }else{
                response.setIntHeader("Refresh", 1);
            }
            
            

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Gato</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h2> Turno: " + turno + "</h2>");
            out.println("<form>");
            out.println("<table>");
            out.println("<tr>");
            out.println("<td>");
            out.println("<button id=\"casilla\" name=\"casilla\" value=\"1\">");
            if (gLog.getVal(0, 0) == 1) {
                out.println("X");
            } else if (gLog.getVal(0, 0) == 5) {
                out.println("0");
            } else {
                out.println("-");
            }
            out.println("</button>");
            out.println("</td>");
            out.println("<td>");
            out.println("<button id=\"casilla\" name=\"casilla\" value=\"2\">");
            if (gLog.getVal(0, 1) == 1) {
                out.println("X");
            } else if (gLog.getVal(0, 1) == 5) {
                out.println("0");
            } else {
                out.println("-");
            }
            out.println("</button>");
            out.println("</td>");
            out.println("<td>");
            out.println("<button id=\"casilla\" name=\"casilla\" value=\"3\">");
            if (gLog.getVal(0, 2) == 1) {
                out.println("X");
            } else if (gLog.getVal(0, 2) == 5) {
                out.println("0");
            } else {
                out.println("-");
            }
            out.println("</button>");
            out.println("</td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>");
            out.println("<button id=\"casilla\" name=\"casilla\" value=\"4\">");
            if (gLog.getVal(1, 0) == 1) {
                out.println("X");
            } else if (gLog.getVal(1, 0) == 5) {
                out.println("0");
            } else {
                out.println("-");
            }
            out.println("</button>");
            out.println("</td>");
            out.println("<td>");
            out.println("<button id=\"casilla\" name=\"casilla\" value=\"5\">");
            if (gLog.getVal(1, 1) == 1) {
                out.println("X");
            } else if (gLog.getVal(1, 1) == 5) {
                out.println("0");
            } else {
                out.println("-");
            }
            out.println("</button>");
            out.println("</td>");
            out.println("<td>");
            out.println("<button id=\"casilla\" name=\"casilla\" value=\"6\">");
            if (gLog.getVal(1, 2) == 1) {
                out.println("X");
            } else if (gLog.getVal(1, 2) == 5) {
                out.println("0");
            } else {
                out.println("-");
            }
            out.println("</button>");
            out.println("</td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>");
            out.println("<button id=\"casilla\" name=\"casilla\" value=\"7\">");
            if (gLog.getVal(2, 0) == 1) {
                out.println("X");
            } else if (gLog.getVal(2, 0) == 5) {
                out.println("0");
            } else {
                out.println("-");
            }
            out.println("</button>");
            out.println("</td>");
            out.println("<td>");
            out.println("<button id=\"casilla\" name=\"casilla\" value=\"8\">");
            if (gLog.getVal(2, 1) == 1) {
                out.println("X");
            } else if (gLog.getVal(2, 1) == 5) {
                out.println("0");
            } else {
                out.println("-");
            }
            out.println("</button>");
            out.println("</td>");
            out.println("<td>");
            out.println("<button id=\"casilla\" name=\"casilla\" value=\"9\">");
            if (gLog.getVal(2, 2) == 1) {
                out.println("X");
            } else if (gLog.getVal(2, 2) == 5) {
                out.println("0");
            } else {
                out.println("-");
            }
            out.println("</button>");
            out.println("</td>");
            out.println("</tr>");
            out.println("</table>");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");

            if (act.equals("client")) { //CLIENTE
                if (turno % 2 == 0) {
                    String par = "";
                    par = request.getParameter("casilla");
                    switch (par) {
                        case "1":
                            if (gLog.getVal(0, 0) != 0) {
                                 
                            } else {
                                gLog.setVal(0, 0, 5);
                                turno++;
                                values = Integer.toString(turno) + ":5:0:0";
                                cliente.enviar(values);
                            }
                            break;
                        case "2":
                            if (gLog.getVal(0, 1) != 0) {
                                 
                            } else {
                                gLog.setVal(0, 1, 5);
                                turno++;
                                values = Integer.toString(turno) + ":5:1:0";
                                cliente.enviar(values);
                            }
                            break;
                        case "3":
                            if (gLog.getVal(0, 2) != 0) {
                                 
                            } else {
                                gLog.setVal(0, 2, 5);
                                turno++;
                                values = Integer.toString(turno) + ":5:2:0";
                                cliente.enviar(values);
                            }
                            break;
                        case "4":
                            if (gLog.getVal(1, 0) != 0) {
                                 
                            } else {
                                gLog.setVal(1, 0, 5);
                                turno++;
                                values = Integer.toString(turno) + ":5:0:1";
                                cliente.enviar(values);
                            }
                            break;
                        case "5":
                            if (gLog.getVal(1, 1) != 0) {
                                 
                            } else {
                                gLog.setVal(1, 1, 5);
                                turno++;
                                values = Integer.toString(turno) + ":5:1:1";
                                cliente.enviar(values);
                            }
                            break;
                        case "6":
                            if (gLog.getVal(1, 2) != 0) {
                                 
                            } else {
                                gLog.setVal(1, 2, 5);
                                turno++;
                                values = Integer.toString(turno) + ":5:2:1";
                                cliente.enviar(values);
                            }
                            break;
                        case "7":
                            if (gLog.getVal(2, 0) != 0) {
                                 
                            } else {
                                gLog.setVal(2, 0, 5);
                                turno++;
                                values = Integer.toString(turno) + ":5:0:2";
                                cliente.enviar(values);
                            }
                            break;
                        case "8":
                            if (gLog.getVal(2, 1) != 0) {
                                 
                            } else {
                                gLog.setVal(2, 1, 5);
                                turno++;
                                values = Integer.toString(turno) + ":5:1:2";
                                cliente.enviar(values);
                            }
                            break;
                        case "9":
                            if (gLog.getVal(2, 2) != 0) {
                                 
                            } else {
                                gLog.setVal(2, 2, 5);
                                turno++;
                                values = Integer.toString(turno) + ":5:2:2";
                                cliente.enviar(values);
                            }
                            break;

                    }
                } else {
                    if (!cliente.status().equals(msj)) {
                        msj = cliente.status();
                        String datos[] = new String[4];
                        datos = msj.split(":");
                        turno = Integer.parseInt(datos[0]);
                        gLog.setVal(Integer.parseInt(datos[3]), Integer.parseInt(datos[2]), Integer.parseInt(datos[1]));

                        if (gLog.tresEnRaya() == 3) {
                            out.println("<script> alert(\"Jugador 1 gana.\"); </script>");
                        } else if (gLog.tresEnRaya() == 15) {
                            out.println("<script> alert(\"Jugador 2 gana.\"); </script>");
                        }
                    }
                }
            } else { //SERVER
                if (turno % 2 == 1) {
                    String par = "";
                    par = request.getParameter("casilla");
                    switch (par) {
                        case "1":
                            if (gLog.getVal(0, 0) != 0) {
                                 
                            } else {
                                gLog.setVal(0, 0, 1);
                                turno++;
                                values = Integer.toString(turno) + ":1:0:0";
                                servidor.enviar(values);
                            }
                            break;
                        case "2":
                            if (gLog.getVal(0, 1) != 0) {
                                 
                            } else {
                                gLog.setVal(0, 1, 1);
                                turno++;
                                values = Integer.toString(turno) + ":1:1:0";
                                servidor.enviar(values);
                            }
                            break;
                        case "3":
                            if (gLog.getVal(0, 2) != 0) {
                                 
                            } else {
                                gLog.setVal(0, 2, 1);
                                turno++;
                                values = Integer.toString(turno) + ":1:2:0";
                                servidor.enviar(values);
                            }
                            break;
                        case "4":
                            if (gLog.getVal(1, 0) != 0) {
                                 
                            } else {
                                gLog.setVal(1, 0, 1);
                                turno++;
                                values = Integer.toString(turno) + ":1:0:1";
                                servidor.enviar(values);
                            }
                            break;
                        case "5":
                            if (gLog.getVal(1, 1) != 0) {
                                 
                            } else {
                                gLog.setVal(1, 1, 1);
                                turno++;
                                values = Integer.toString(turno) + ":1:1:1";
                                servidor.enviar(values);
                            }
                            break;
                        case "6":
                            if (gLog.getVal(1, 2) != 0) {
                                 
                            } else {
                                gLog.setVal(1, 2, 1);
                                turno++;
                                values = Integer.toString(turno) + ":1:2:1";
                                servidor.enviar(values);
                            }
                            break;
                        case "7":
                            if (gLog.getVal(2, 0) != 0) {
                                 
                            } else {
                                gLog.setVal(2, 0, 1);
                                turno++;
                                values = Integer.toString(turno) + ":1:0:2";
                                servidor.enviar(values);
                            }
                            break;
                        case "8":
                            if (gLog.getVal(2, 1) != 0) {
                                 
                            } else {
                                gLog.setVal(2, 1, 1);
                                turno++;
                                values = Integer.toString(turno) + ":1:1:2";
                                servidor.enviar(values);
                            }
                            break;
                        case "9":
                            if (gLog.getVal(2, 2) != 0) {
                                 
                            } else {
                                gLog.setVal(2, 2, 1);
                                turno++;
                                values = Integer.toString(turno) + ":1:2:2";
                                servidor.enviar(values);
                            }
                            break;

                    }
                } else {
                    if (!servidor.status().equals(msj)) {
                        msj = servidor.status();
                        String datos[] = new String[4];
                        datos = msj.split(":");
                        turno = Integer.parseInt(datos[0]);
                        gLog.setVal(Integer.parseInt(datos[3]), Integer.parseInt(datos[2]), Integer.parseInt(datos[1]));
                        if (gLog.tresEnRaya() == 3) {
                            out.println("<script> alert(\"Jugador 1 gana.\"); </script>");
                        } else if (gLog.tresEnRaya() == 15) {
                            out.println("<script> alert(\"Jugador 2 gana.\"); </script>");
                        }
                    }
                }
            }
            if (turno == 10) {
                out.println("<script> alert(\"Juego empatado.\"); </script>");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
