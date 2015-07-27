/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pucmm.pw.servlets;

import com.google.gson.Gson;
import edu.pucmm.pw.entidades.Likes;
import edu.pucmm.pw.entidades.Posts;
import edu.pucmm.pw.entidades.Usuarios;
import edu.pucmm.pw.servicios.LikesFacade;
import edu.pucmm.pw.servicios.PostsFacade;
import edu.pucmm.pw.servicios.UsuariosFacade;
import edu.pucmm.pw.database.TablasCruzadasService;
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
 * @author CavP
 */
@WebServlet(name = "agregarLikeServlet", urlPatterns = {"/agregarLikeServlet"})
public class agregarLikeServlet extends HttpServlet {

    @EJB
    UsuariosFacade usuariosFacade;
    @EJB
    PostsFacade postFacade;
    @EJB
    LikesFacade likesFacade;
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
            Posts postActual = postFacade.find(Integer.parseInt(request.getParameter("idPost")));
            HttpSession sesion = request.getSession();
            Usuarios usuarioPost = usuariosFacade.find(sesion.getAttribute("idUsuario"));
            String estadoLike = request.getParameter("estadoLike");
            Likes nuevoLike = new Likes();
            
            String reponseJson = "";
            Map<String, String> jsonMap = new HashMap<>();
            
            switch (estadoLike) {
                case "AGREGAR":                    
                    nuevoLike.setIdusuario(usuarioPost);
                    likesFacade.create(nuevoLike);
                    if(TablasCruzadasService.getInstancia().insertarLikePost(postActual, nuevoLike)){
                        jsonMap.put("Status", "EXITO");
                        jsonMap.put("cantidadLikes", String.valueOf(postActual.getLikesList().size()));
                        jsonMap.put("idLike", String.valueOf(nuevoLike.getIdlike()));
                    } else {
                        jsonMap.put("Status", "FALLO");
                    }
                    break;
                case "ELIMINAR":
                    nuevoLike = likesFacade.find(Integer.parseInt(request.getParameter("idLike")));
                    if(TablasCruzadasService.getInstancia().eliminarLikePost(postActual, nuevoLike)){
                        jsonMap.put("Status", "EXITO");
                        jsonMap.put("cantidadLikes", String.valueOf(postActual.getLikesList().size()));
                        likesFacade.remove(nuevoLike);
                    } else {
                        jsonMap.put("Status", "FALLO");
                    }
                    break;
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
