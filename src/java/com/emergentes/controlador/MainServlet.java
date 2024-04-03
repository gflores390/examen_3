
package com.emergentes.controlador;

import com.emergentes.modelo.Persona;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MainServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MainServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
        String op = request.getParameter("op");
        Persona objper = new Persona();
        int id, pos;
        HttpSession ses= request.getSession();
        ArrayList<Persona> lista = (ArrayList<Persona>) ses.getAttribute("listaper");
        switch (op){ 
            case "nuevo":
                
                request.setAttribute("miobjper", objper);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                
                id= Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(request,id);
                objper=lista.get(pos);
                 request.setAttribute("miobjper", objper);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                
                break;
            case "eliminar":
                id=Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(request,id);
                if (pos>=0) {
                    lista.remove(pos);
                }
                request.setAttribute("listaper", lista);
                response.sendRedirect("index.jsp");
                break;
                default:
        }}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses= request.getSession();       
        ArrayList<Persona> lista = (ArrayList<Persona>) ses.getAttribute("listaper");
        Persona objper = new Persona();
        objper.setId(id);
        objper.setNombres(request.getParameter("nombres"));
        objper.setApellidos(request.getParameter("apellidos"));
        objper.setEdad(Integer.parseInt(request.getParameter("edad")));
        if (id==0) {
            int idNuevo=obtenerId(request);
            objper.setId(idNuevo);
            lista.add(objper);
        } else {
            int pos= buscarPorIndice(request, id);
            lista.set(pos, objper);      
        }
        request.setAttribute("listaper", lista);
        response.sendRedirect("index.jsp");
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public int buscarPorIndice(HttpServletRequest request, int id){
        HttpSession ses= request.getSession();
        
        ArrayList<Persona> lista = (ArrayList<Persona>) ses.getAttribute("listaper");
        int pos= -1;
        if (lista!=null) {
            for (Persona ele:lista) {
               ++pos;
                if (ele.getId()== id) {
                    break;
                }
            }
    }
            return pos;
}
public int obtenerId(HttpServletRequest request){
     HttpSession ses =request.getSession();
     ArrayList<Persona> lista = (ArrayList<Persona>) ses.getAttribute("listaper");
     //buscar el ultimo id
     int idn =0;
     for(Persona ele : lista){
         idn = ele.getId();
     }
     return idn +1;
     
              
}
   
}