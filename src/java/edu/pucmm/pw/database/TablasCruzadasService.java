/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pucmm.pw.database;

import edu.pucmm.pw.entidades.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author cavp
 */
public class TablasCruzadasService {
   
    private static TablasCruzadasService instancia; //Para Singleton...  
    
    private TablasCruzadasService() {
        try {
            Class.forName("org.h2.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TablasCruzadasService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static TablasCruzadasService getInstancia(){
        if(instancia == null)
        {
            instancia = new TablasCruzadasService();
        }
        return instancia;
    }
    
    public Connection getConexion(){
        Connection con = null;
        try {
            con = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/feibu", "sa", "");
        } catch (SQLException ex) {
            Logger.getLogger(TablasCruzadasService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
    
    public boolean insertarComentarioPost(Posts post, Comentarios comentario){
        
        boolean correcto = false;
        
        try(Connection con = getConexion()){
        
            PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO COMENTARIOS_POSTS(idComentario,idPost) VALUES(?,?)");
            preparedStatement.setInt(1, comentario.getIdcomentario());
            preparedStatement.setInt(2, post.getIdpost());
            
            int cantidadInsertada = preparedStatement.executeUpdate();
            if(cantidadInsertada > 0){
                correcto = true;
            }
        } catch(SQLException ex){
            Logger.getLogger(TablasCruzadasService.class.getName()).log(Level.SEVERE,null,ex);
        }
        
        return correcto;
    }
    
    public boolean insertarLikePost(Posts post, Likes like){
        
        boolean correcto = false;
        
        try(Connection con = getConexion()){
            
            PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO LIKES_POSTS(idLike,idPost) VALUES(?,?)");
            preparedStatement.setInt(1, like.getIdlike());
            preparedStatement.setInt(2, post.getIdpost());
            
            int cantidadInsertada = preparedStatement.executeUpdate();
            if(cantidadInsertada > 0){
                correcto = true;
            }
                
        } catch(SQLException ex){
            Logger.getLogger(TablasCruzadasService.class.getName()).log(Level.SEVERE,null,ex);
        }
        
        return correcto;      
    }
    
    public boolean eliminarLikePost(Posts post, Likes like){
        
        boolean correcto = false;
        
        try(Connection con = getConexion()){
            
            PreparedStatement preparedStatement = con.prepareStatement("DELETE FROM LIKES_POSTS WHERE idLike = ? AND idPost = ?");
            preparedStatement.setInt(1, like.getIdlike());
            preparedStatement.setInt(2, post.getIdpost());
            
            int cantidadEliminada = preparedStatement.executeUpdate();
            if(cantidadEliminada > 0){
                correcto = true;
            }
                
        } catch(SQLException ex){
            Logger.getLogger(TablasCruzadasService.class.getName()).log(Level.SEVERE,null,ex);
        }
        
        return correcto;
    }
    
    public boolean insertarAmistad(Usuarios usuario, Amistades amistad){
         
        boolean correcto = false;
        
        try(Connection con = getConexion()){
            
            PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO USUARIOS_AMISTADE(idUsuario,idAmistad) VALUES(?,?)");
            preparedStatement.setInt(1, usuario.getIdusuario());
            preparedStatement.setInt(2, amistad.getIdamistad());
            
            int cantidadInsertada = preparedStatement.executeUpdate();
            if(cantidadInsertada > 0){
                correcto = true;
            }
                
        } catch(SQLException ex){
            Logger.getLogger(TablasCruzadasService.class.getName()).log(Level.SEVERE,null,ex);
        }
        
        return correcto;    
    }
    
}
