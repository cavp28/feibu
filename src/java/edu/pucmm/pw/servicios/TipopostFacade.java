/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pucmm.pw.servicios;

import edu.pucmm.pw.entidades.Tipopost;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author david
 */
@Stateless
public class TipopostFacade extends AbstractFacade<Tipopost> {
    @PersistenceContext(unitName = "parcial2_grupo6PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TipopostFacade() {
        super(Tipopost.class);
    }
    
}
