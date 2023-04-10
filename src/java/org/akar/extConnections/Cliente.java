
package org.akar.extConnections;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class Cliente {
    private Socket s;
    private ObjectInputStream ois;
    private ObjectOutputStream oos;
    private Boolean connected; 
    private String status;
    
    public Cliente(){
        connected = false;
        status = "";
    }
    
    public void iniSocket(InetAddress ip, int puerto){
        try {
            s = new Socket(ip, puerto);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void flujos(){
        try {
            oos = new ObjectOutputStream(s.getOutputStream());
            ois = new ObjectInputStream(s.getInputStream());
            oos.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void cerrar(){
        try {
            ois.close();
            oos.close();
            s.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void enviar(String msj){
        try {
            oos.writeObject(msj);
            oos.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void recibir(){
        try {
            boolean c = true;
            while(c == true){
                status = (String) ois.readObject();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void conexion(String sIp, String puertoS) {
        Thread hilo = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    InetAddress ip = InetAddress.getByName(sIp);
                    int puerto = Integer.parseInt(puertoS);
                    iniSocket(ip, puerto);
                    flujos();
                    connected = true;
                    recibir();
                }catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        });
        hilo.start();
    }
    
    public Boolean isConnected(){
        return connected;
    }
    
    public String status(){
        return status;
    }
    
    public String connectedWith(){
        return s.getInetAddress().toString();
    }
}
