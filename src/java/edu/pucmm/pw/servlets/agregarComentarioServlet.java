/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pucmm.pw.servlets;

import com.google.gson.Gson;
import edu.pucmm.pw.entidades.Comentarios;
import edu.pucmm.pw.entidades.Posts;
import edu.pucmm.pw.entidades.Usuarios;
import edu.pucmm.pw.servicios.ComentariosFacade;
import edu.pucmm.pw.servicios.PersonasFacade;
import edu.pucmm.pw.servicios.PostsFacade;
import edu.pucmm.pw.servicios.UsuariosFacade;
import edu.pucmm.pw.database.TablasCruzadasService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cavp
 */
@WebServlet(name = "agregarComentarioServlet", urlPatterns = {"/agregarComentarioServlet"})
public class agregarComentarioServlet extends HttpServlet {

    @EJB
    UsuariosFacade usuariosFacade;
    @EJB
    PersonasFacade personasFacade;
    @EJB
    ComentariosFacade comentariosFacade;
    @EJB
    PostsFacade postFacade;

    
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
            //System.out.println(request.getParameter("idPost") + " : " + request.getParameter("comentario"));
            
            Posts postActual = postFacade.find(Integer.parseInt(request.getParameter("idPost")));
            ServletContext sesion = request.getSession().getServletContext();
            
            Usuarios usuarioPost = usuariosFacade.find(sesion.getAttribute("idUsuario"));
            
            Comentarios nuevoComentario = new Comentarios();           
            nuevoComentario.setComentario(request.getParameter("comentario"));
            nuevoComentario.setIdusuario(usuarioPost);
            nuevoComentario.setFecha(new Date());
            comentariosFacade.create(nuevoComentario);
            String reponseJson = "";
            Map<String, String> jsonMap = new HashMap<String, String>();
            boolean guardarComentarioPost = TablasCruzadasService.getInstancia().insertarComentarioPost(postActual, nuevoComentario);
            if(guardarComentarioPost){
                
                jsonMap.put("Status", "EXITO");
                jsonMap.put("usuario", usuarioPost.getIdpersona().getNombres() + " " +usuarioPost.getIdpersona().getApellidos());
                jsonMap.put("cantidadComentarios", String.valueOf(postActual.getComentariosList().size()));
                
            } else {
                
                jsonMap.put("Status", "FALLO");
            }
            
            reponseJson = new Gson().toJson(jsonMap);
            response.setContentType("application/json");
            response.getWriter().write(reponseJson);
      
        } catch(Exception e){
            System.out.println(e);
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
