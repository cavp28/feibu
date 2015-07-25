/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pucmm.pw.eventos;

import edu.pucmm.pw.entidades.Ciudades;
import edu.pucmm.pw.entidades.Lugares;
import edu.pucmm.pw.entidades.Paises;
import edu.pucmm.pw.entidades.Personas;
import edu.pucmm.pw.entidades.Sexo;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author david
 */
public class AppInit implements ServletContextListener{
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
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Inicializando la aplicacion.....");
                List<Usuarios> listaUsuarios =usuariosFacade.findAll();
        boolean existeAdmin=false;
        for (Usuarios usuario : listaUsuarios) {
            if (usuario.getIdpersona().getIdrol().getIdrol()==1){
                existeAdmin=true;
            }
        }
        if (existeAdmin==false){
            try{
            Personas persona = new Personas();
            persona.setNombres("admin");
            persona.setApellidos("admin");
            persona.setContrasena("admin");
            persona.setEmail("admin@gmail.com");
            Sexo sexo=new Sexo();
            sexo.setIdsexo(1);
            sexo.setNombre("Femenino");
            Ciudades ciudad = new Ciudades();
            ciudad.setNombre("Santiago");
            Paises pais = new Paises();
            pais.setNombre("Republica Dominicana");
            List<Ciudades> listaCiudades = new ArrayList<>();
            listaCiudades.add(ciudad);
            pais.setCiudadesList(listaCiudades);
            persona.setSexo(sexo);
            persona.setLugaractual(ciudad);
            persona.setLugarnacimiento(ciudad);
            persona.setFechanacimiento(new Date());
            persona.setFechacreacion(new Date());
            personasFacade.create(persona);
            Usuarios usuario = new Usuarios();
            usuario.setIdpersona(persona);
            Lugares lugar= new Lugares();
            lugar.setNombre("Colegio Juan XXIII");
            lugar.setDescripcion("Estudie ahi por muchos anos");
            lugar.setFechainicio(2009);
            lugar.setFechafin(2013);
            List<Lugares>listaLugares = new ArrayList<>();
            listaLugares.add(lugar);
            usuario.setLugaresList(listaLugares);
            usuariosFacade.create(usuario);
            System.out.println("Usuario admin creado");
            }
            catch(EJBException e){
                System.out.println(e.getMessage());
            }
        }
    }

    /**
     *
     * @param sce
     */
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Destruyendo la aplicacion.....");
    }
    
}