/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pucmm.pw.servlets;

import edu.pucmm.pw.entidades.Imagenes;
import edu.pucmm.pw.entidades.Posts;
import edu.pucmm.pw.entidades.Usuarios;
import edu.pucmm.pw.servicios.ImagenesFacade;
import edu.pucmm.pw.servicios.PostsFacade;
import edu.pucmm.pw.servicios.TipopostFacade;
import edu.pucmm.pw.servicios.UsuariosFacade;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author CavP
 */
@WebServlet(name = "agregarFotoServlet", urlPatterns = {"/agregarFotoServlet"})
@MultipartConfig
public class agregarFotoServlet extends HttpServlet {

    @EJB
    UsuariosFacade usuariosFacade;
    @EJB
    PostsFacade postFacade;
    @EJB
    ImagenesFacade imagenesFacade;
    @EJB
    TipopostFacade tipoPostFacade;
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
        InputStream is = null;
        OutputStream fous =null;
        Part p1 =request.getPart("archivo");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String ruta = "C:\\Users\\darks_000\\Documents\\Universidad\\Programación Web\\Proyecto Final\\V2 - Chance\\parcial2_grupo6\\web\\fotos";
            
            
            System.out.println(ruta);
            is =p1.getInputStream();
            
            String nombreArchivo = getMD5FromBytes(IOUtils.toByteArray(is));
            is =p1.getInputStream();
            
            String extension = obtenerExtension(p1).split("\\.")[1];
            fous = new FileOutputStream(new File(ruta + File.separator+ nombreArchivo + "." +extension));
            int leido = 0;
            byte []bytes = new byte[1];
            while((leido=is.read(bytes))!=-1){
                fous.write(bytes,0,leido);
            }
            HttpSession sesion = request.getSession();
            
            Usuarios usuarioPost = usuariosFacade.find(sesion.getAttribute("idUsuario"));
            
            Posts nuevoPost = new Posts();
            nuevoPost.setIdusuario(usuarioPost);
            nuevoPost.setTipopost(tipoPostFacade.find(2));
            nuevoPost.setFechapost(new Date());
            nuevoPost.setDescripcion(request.getParameter("fotoDescripcion"));
            postFacade.create(nuevoPost);
            
            Imagenes nuevaImagen = new Imagenes();
            nuevaImagen.setImagen("fotos" + File.separator+ nombreArchivo + "." +extension);
            nuevaImagen.setIdpost(nuevoPost);
            nuevaImagen.setFechasubida(new Date());
            nuevaImagen.setDescripcion(request.getParameter("fotoDescripcion"));
            nuevaImagen.setIdusuario(usuarioPost);
            imagenesFacade.create(nuevaImagen);
            
            //nuevaImagen.se
            
            
            response.sendRedirect("home.jsp");
        } catch (FileNotFoundException ex) {
            System.out.println("El error es: " + ex.getMessage());
        } 
        finally{
            if (fous!=null){
                fous.close();
            }
            if(is!=null){
                is.close();
            }
            if (out!= null) {
                out.close();
            }
        }    
    }
    
    private static String getMD5FromBytes(byte[] uploadBytes){
		MessageDigest md5;
		String hashString="";
		try {
			md5 = MessageDigest.getInstance("MD5");
			byte[] digest = md5.digest(uploadBytes);
			hashString = new BigInteger(1, digest).toString(16);
		} catch (NoSuchAlgorithmException e) {
		}
		
		return hashString;
	}
    
    private String obtenerExtension(final Part part){
        final String partHeader = part.getHeader("content-disposition");
       // LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
