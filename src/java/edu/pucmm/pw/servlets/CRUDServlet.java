/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pucmm.pw.servlets;

import edu.pucmm.pw.entidades.Ciudades;
import edu.pucmm.pw.entidades.Lugares;
import edu.pucmm.pw.entidades.Paises;
import edu.pucmm.pw.entidades.Personas;
import edu.pucmm.pw.entidades.Posts;
import edu.pucmm.pw.entidades.Roles;
import edu.pucmm.pw.entidades.Sexo;
import edu.pucmm.pw.entidades.TipoLugares;
import edu.pucmm.pw.entidades.Usuarios;
import edu.pucmm.pw.servicios.CiudadesFacade;
import edu.pucmm.pw.servicios.LugaresFacade;
import edu.pucmm.pw.servicios.PaisesFacade;
import edu.pucmm.pw.servicios.PersonasFacade;
import edu.pucmm.pw.servicios.PostsFacade;
import edu.pucmm.pw.servicios.SexoFacade;
import edu.pucmm.pw.servicios.TipoLugaresFacade;
import edu.pucmm.pw.servicios.TipopostFacade;
import edu.pucmm.pw.servicios.UsuariosFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author david
 */
@WebServlet(name = "CRUDServlet", urlPatterns = {"/CRUDServlet"})
public class CRUDServlet extends HttpServlet {

    @EJB
    PersonasFacade personasFacade;

    @EJB
    CiudadesFacade ciudadesFacade;

    @EJB
    SexoFacade sexoFacade;

    @EJB
    PaisesFacade paisesFacade;

    @EJB
    UsuariosFacade usuariosFacade;

    @EJB
    TipopostFacade tipoPostFacade;

    @EJB
    PostsFacade postsFacade;

    
    @EJB
    LugaresFacade lugaresFacade;
 
    @EJB
    TipoLugaresFacade tipolugaresFacade;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
          
            //Registrando un Usuario
            if (request.getParameter("nombres") != null && request.getParameter("apellidos") != null
                    && request.getParameter("email") != null && request.getParameter("sexo") != null
                    && request.getParameter("fechaNacimiento") != null && request.getParameter("ciudadNacimiento") != null
                    && request.getParameter("ciudadActual") != null
                    && request.getParameter("contrasena") != null
                    && request.getParameter("opcion").equals("Registrarse")) {
                Personas persona = new Personas();
                persona.setNombres(request.getParameter("nombres"));
                persona.setApellidos(request.getParameter("apellidos"));
                persona.setEmail(request.getParameter("email"));

                List<Personas> listaEmail = personasFacade.findAll();
                boolean existeEmail = false;
                MessageDigest md;
                String contrasenaGenerada = null;

                for (Personas p : listaEmail) {
                    if (p.getEmail().equals(request.getParameter("email"))) {
                        existeEmail = true;
                    }
                }
                if (existeEmail) {
                    response.sendRedirect("index.jsp?respuesta=2");
                } else {
                    try {
                        byte[] contrasena = request.getParameter("contrasena").getBytes();
                        md = MessageDigest.getInstance("MD5");
                        md.reset();
                        md.update(contrasena);
                        byte[] contrasenaDigested = md.digest();
                        StringBuilder stringBuilder = new StringBuilder();
                        for (int i = 0; i < contrasenaDigested.length; i++) {
                            stringBuilder.append(Integer.toString((contrasenaDigested[i] & 0xff) + 0x100, 16).substring(1));
                        }
                        contrasenaGenerada = stringBuilder.toString();
                        persona.setContrasena(contrasenaGenerada);
                        Sexo sexo = sexoFacade.find(Integer.parseInt(request.getParameter("sexo")));
                        persona.setSexo(sexo);
                        SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
                        persona.setFechanacimiento(formateador.parse(request.getParameter("fechaNacimiento")));
                        List<Ciudades> ciudades = ciudadesFacade.findAll();
                        int idCiudadNacimiento = 0;
                        for (Ciudades ciudade : ciudades) {
                            if (request.getParameter("ciudadNacimiento").equals(ciudade.getNombre())) {
                                idCiudadNacimiento = ciudade.getIdciudad();
                                System.out.println("ciudad Nacimiento" + idCiudadNacimiento);
                            }
                        }
                        Ciudades ciudadNacimiento = ciudadesFacade.find(idCiudadNacimiento);
                        persona.setLugarnacimiento(ciudadNacimiento);
                        int idCiudadActual = 0;
                        for (Ciudades ciudade : ciudades) {
                            if (request.getParameter("ciudadActual").equals(ciudade.getNombre())) {
                                idCiudadActual = ciudade.getIdciudad();
                                System.out.println("ciudad Actual" + idCiudadActual);
                            }
                        }
                        Ciudades ciudadActual = ciudadesFacade.find(idCiudadActual);
                        persona.setLugaractual(ciudadActual);
                        persona.setFechacreacion(new Date());
                        persona.setIdrol(new Roles(2, "Usuario"));
                        personasFacade.create(persona);
                        Usuarios usuario = new Usuarios();
                        usuario.setIdpersona(persona);
                        usuariosFacade.create(usuario);
                        ServletContext sc = request.getSession().getServletContext();
                        sc.setAttribute("idUsuario", usuario.getIdusuario());
                        response.sendRedirect("editarPerfil.jsp");
                    } catch (NoSuchAlgorithmException ex) {
                        System.out.println(ex.getMessage());
                        Logger.getLogger(CRUDServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            
            //Tratando de logearse al sistema
            if (request.getParameter("email") != null && request.getParameter("contrasena") != null
                    && request.getParameter("opcion").equals("Login")) {
                List<Usuarios> listaUsuarios = usuariosFacade.findAll();
                Usuarios usuarioLogin = new Usuarios();
                for (Usuarios us : listaUsuarios) {
                    if (us.getIdpersona().getEmail().equals(request.getParameter("email"))) {
                        usuarioLogin = us;
                    }
                }
                byte[] contrasena = request.getParameter("contrasena").getBytes();
                MessageDigest md;
                try {
                    md = MessageDigest.getInstance("MD5");
                    md.reset();
                    md.update(contrasena);
                    byte[] contrasenaDigested = md.digest();
                    StringBuilder stringBuilder = new StringBuilder();
                    for (int i = 0; i < contrasenaDigested.length; i++) {
                        stringBuilder.append(Integer.toString((contrasenaDigested[i] & 0xff) + 0x100, 16).substring(1));
                    }
                    String contrasenaGenerada = stringBuilder.toString();

                    if (contrasenaGenerada.equals(usuarioLogin.getIdpersona().getContrasena())) {
                        Cookie cookie = new Cookie("idUsuario", usuarioLogin.getIdusuario().toString());
                        cookie.setMaxAge(86400);//poniendo 
                        ServletContext sesion = request.getSession().getServletContext();
                        sesion.setAttribute("idUsuario", usuarioLogin.getIdusuario());
                        response.sendRedirect("home.jsp");
                    } else {
                        response.sendRedirect("index.jsp?respuesta=1");
                    }
                } catch (NoSuchAlgorithmException ex) {
                    Logger.getLogger(CRUDServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            //Creando lugares 
            if(request.getParameter("lugar")!=null && request.getParameter("descripcion")!=null 
                && request.getParameter("tipoLugar")!=null
                && request.getParameter("ciudadLugar")!=null && request.getParameter("fechaInicio")!=null
                        &&request.getParameter("fechaFinal")!=null){
                Lugares lugar = new Lugares();
                TipoLugares tipoLugar;
                lugar.setNombre(request.getParameter("lugar"));
                lugar.setDescripcion(request.getParameter("descripcion"));
                tipoLugar= tipolugaresFacade.find(Integer.parseInt(request.getParameter("tipoLugar")));
                lugar.setIdtipolugar(tipoLugar);
                List<Ciudades> listaCiudad= ciudadesFacade.findAll();
                int idCiudad=-1;
                for (Ciudades ciudade : listaCiudad) {
                    if(ciudade.getNombre().equals(request.getParameter("ciudadLugar"))){
                        idCiudad=ciudade.getIdciudad();
                    }
                }
                Ciudades ciudad = ciudadesFacade.find(idCiudad);
                lugar.setIdciudad(ciudad);
                lugar.setFechainicio(Integer.parseInt(request.getParameter("fechaInicio")));
                if(!request.getParameter("fechaFinal").equals("Actualmente...")){
                    lugar.setFechafin(Integer.parseInt(request.getParameter("fechaFinal")));
                }
                ServletContext sc = request.getSession().getServletContext();
                List <Usuarios> listaUsuarios = new ArrayList<>();
                Usuarios us;
                us=usuariosFacade.find(sc.getAttribute("idUsuario"));
                System.out.println(us);
                listaUsuarios.add(us);
                lugar.setUsuariosList(listaUsuarios);
                List<Lugares> listaLugares = us.getLugaresList();
                listaLugares.add(lugar);
                us.setLugaresList(listaLugares);
                lugaresFacade.create(lugar);
                usuariosFacade.edit(us);
                response.sendRedirect("home.jsp");
            }
            
                        
            //Creando Post 
            if (request.getParameter("post") != null /*&& request.getParameter("tipoPost")!=null*/) {
                try{
                    ServletContext sesion = request.getSession().getServletContext();
                    Posts nuevoPost = new Posts();
                    Usuarios usuarioPost = usuariosFacade.find(sesion.getAttribute("idUsuario"));
                    //nuevoPost.setTipopost(tipoPostFacade.find(request.getParameter("tipoPost")));
                    nuevoPost.setTipopost(tipoPostFacade.find(1));

                    nuevoPost.setDescripcion(request.getParameter("post"));
                    nuevoPost.setIdusuario(usuarioPost);
                    nuevoPost.setFechapost(new Date());
                    postsFacade.create(nuevoPost);
                    response.sendRedirect("home.jsp");
                } catch(Exception e){
                   out.println("<p>Hay problemas, contante</p>");
                }
            }
            
            out.println("<html>");
        } catch (ParseException ex) {
            Logger.getLogger(CRUDServlet.class.getName()).log(Level.SEVERE, null, ex);

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
