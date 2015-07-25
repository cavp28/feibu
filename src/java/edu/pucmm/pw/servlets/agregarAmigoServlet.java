/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pucmm.pw.servlets;

import com.google.gson.Gson;
import edu.pucmm.pw.database.TablasCruzadasService;
import edu.pucmm.pw.entidades.Amistades;
import edu.pucmm.pw.entidades.Usuarios;
import edu.pucmm.pw.servicios.AmistadesFacade;
import edu.pucmm.pw.servicios.UsuariosFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author david
 */
@WebServlet(name = "agregarAmigoServlet", urlPatterns = {"/agregarAmigoServlet"})
public class agregarAmigoServlet extends HttpServlet {

    @EJB
    UsuariosFacade usuariosFacade;
    @EJB
    AmistadesFacade amistadesFacade;
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession sesion = request.getSession();
            
            Usuarios usuarioSolicitante = usuariosFacade.find(sesion.getAttribute("idUsuario"));
            Usuarios usuarioASolicitar = usuariosFacade.find(Integer.parseInt(request.getParameter("idUsuarioASolicitar")));
            Amistades nuevaAmistad = new Amistades();
            nuevaAmistad.setAceptado(false);
            nuevaAmistad.setSoyamigode(usuarioASolicitar);
            amistadesFacade.create(nuevaAmistad);
            String reponseJson = "";
            Map<String, String> jsonMap = new HashMap<>();
            if(TablasCruzadasService.getInstancia().insertarAmistad(usuarioSolicitante, nuevaAmistad)){
                jsonMap.put("Status", "EXITO");
            } else{
                jsonMap.put("Status", "FALLO");
            }
            
            reponseJson = new Gson().toJson(jsonMap);
            response.setContentType("application/json");
            response.getWriter().write(reponseJson);
      
                
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
