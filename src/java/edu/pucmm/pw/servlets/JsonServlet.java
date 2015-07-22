/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pucmm.pw.servlets;

import com.google.gson.Gson;
import edu.pucmm.pw.entidades.Ciudades;
import edu.pucmm.pw.entidades.Paises;
import edu.pucmm.pw.servicios.CiudadesFacade;
import edu.pucmm.pw.servicios.PaisesFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author david
 */
@WebServlet(name = "JsonServlet", urlPatterns = {"/JsonServlet"})
public class JsonServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                try {
            javax.naming.Context context = new javax.naming.InitialContext();
            String jndiUrl = "java:comp/env/PaisesFacade";
            PaisesFacade paisesFacade = (PaisesFacade) context.lookup(jndiUrl);
            
            String jndiUr2 = "java:comp/env/CiudadesFacade";
            CiudadesFacade ciudadesFacade = (CiudadesFacade) context.lookup(jndiUr2);
            String json=" ";
            int idPais = Integer.parseInt(request.getParameter("idPais"));
            
            List<String> lista = new ArrayList<>();
            List <Ciudades> listaCiudades=ciudadesFacade.findAll();
            listaCiudades.stream().forEach((listaCiudade) -> {
                Paises p = listaCiudade.getIdpais();
                System.out.println(listaCiudade.getNombre()+" "+p.getNombre()+" "+idPais);
                
                if(p.getIdpais()==idPais){
                    lista.add(listaCiudade.getNombre());
                    System.out.println(listaCiudade.getNombre()+" "+p.getNombre()+" "+idPais);
                
                }
            });
            json = new Gson().toJson(lista);
            response.setContentType("application/json");
            response.getWriter().write(json);
        } catch (NamingException ex) {
            Logger.getLogger(JsonServlet.class.getName()).log(Level.SEVERE, null, ex);
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
