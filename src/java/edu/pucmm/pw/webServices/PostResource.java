/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pucmm.pw.webServices;

import edu.pucmm.pw.entidades.Posts;
import edu.pucmm.pw.entidades.Usuarios;
import edu.pucmm.pw.servicios.PersonasFacade;
import edu.pucmm.pw.servicios.PostsFacade;
import edu.pucmm.pw.servicios.TipopostFacade;
import edu.pucmm.pw.servicios.UsuariosFacade;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;

/**
 * REST Web Service
 *
 * @author david
 */
@Path("post")
public class PostResource {

    @Context
    private UriInfo context;
    @EJB
    UsuariosFacade usuariosFacade;
    
    @EJB
    PersonasFacade personasFacade;

    @EJB
    TipopostFacade tipoPostFacade;
    
    @EJB
    PostsFacade postsFacade;
    /**
     * Creates a new instance of PostResource
     */
    public PostResource() {
    }

    /**
     * Retrieves representation of an instance of edu.pucmm.pw.webServices.PostResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces("text/html")
    public String getHtml() {
        //TODO return proper representation object
        throw new UnsupportedOperationException();
    }

    /**
     * PUT method for updating or creating an instance of PostResource
     * @param content representation for the resource
     * @return an HTTP response with content of the updated or created resource.
     */
    @PUT
    @Consumes("text/html")
    public void putHtml(String content) {
    }
    
    @POST
  
    public Boolean registroPosteo(@FormParam("emailUsuario") String emailUsuario, 
                                    @FormParam("emailUsuarioPerfil") String emailUsuarioPerfil, 
                                    @FormParam("contrasena")String contrasena,
                                    @FormParam("post")String post,
                                    @FormParam("tipoPost")int tipoPost){
        //Creando Post
        Boolean creado=false;
        Usuarios usuarioPost = new Usuarios();
        if(tipoPost==1){
            Posts nuevoPost = new Posts();
            List<Usuarios> listaUsuarios = usuariosFacade.findAll();
            for (Usuarios usuario : listaUsuarios) {
              if(usuario.getIdpersona().getEmail().equals(emailUsuario)){
                  usuarioPost=usuario;
              }  
            }
            if(usuarioPost.getIdpersona().getEmail()!=null){ //En caso de que encuentre el email
                //nuevoPost.setTipopost(tipoPostFacade.find(request.getParameter("tipoPost")));
                nuevoPost.setTipopost(tipoPostFacade.find(tipoPost));
                nuevoPost.setDescripcion(post);
                nuevoPost.setIdusuario(usuarioPost);
                nuevoPost.setFechapost(new Date());
                postsFacade.create(nuevoPost);
                creado=true;
            }
        }
        if(tipoPost==3){
            Usuarios emisorPost = new Usuarios();
            Posts nuevoPost = new Posts();
            List<Usuarios> listaUsuarios = usuariosFacade.findAll();
            for (Usuarios usuario : listaUsuarios) {
              if(usuario.getIdpersona().getEmail().equals(emailUsuario)){
                  usuarioPost=usuario;
              }
              if(usuario.getIdpersona().getEmail().equals(emailUsuarioPerfil)){
                  emisorPost=usuario;
              }
            }
            
            nuevoPost.setDescripcion(post);
            nuevoPost.setFechapost(new Date());
            System.out.println("SOy el emisor"+emisorPost.getIdpersona().getNombres());
            System.out.println("Perfil de"+usuarioPost.getIdpersona().getNombres());
            if(usuarioPost!=emisorPost){
                nuevoPost.setTipopost(tipoPostFacade.find(3));
                nuevoPost.setEmisorusuario(usuarioPost);
                nuevoPost.setIdusuario(emisorPost);
            }
            else{
                nuevoPost.setTipopost(tipoPostFacade.find(1));
                nuevoPost.setIdusuario(emisorPost);
            }
            postsFacade.create(nuevoPost);
            creado=true;
        }
        return creado;
     }
}
