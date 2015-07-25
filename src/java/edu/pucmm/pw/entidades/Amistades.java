/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pucmm.pw.entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author david
 */
@Entity
@Table(name = "AMISTADES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Amistades.findAll", query = "SELECT a FROM Amistades a"),
    @NamedQuery(name = "Amistades.findByIdamistad", query = "SELECT a FROM Amistades a WHERE a.idamistad = :idamistad"),
    @NamedQuery(name = "Amistades.findByAceptado", query = "SELECT a FROM Amistades a WHERE a.aceptado = :aceptado")})
public class Amistades implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDAMISTAD")
    private Integer idamistad;
    @Column(name = "ACEPTADO")
    private Boolean aceptado;
    @ManyToMany(mappedBy = "amistadesList")
    private List<Usuarios> usuariosList;
    @JoinColumn(name = "SOYAMIGODE", referencedColumnName = "IDUSUARIO")
    @ManyToOne
    private Usuarios soyamigode;

    public Amistades() {
    }

    public Amistades(Integer idamistad) {
        this.idamistad = idamistad;
    }

    public Integer getIdamistad() {
        return idamistad;
    }

    public void setIdamistad(Integer idamistad) {
        this.idamistad = idamistad;
    }

    public Boolean getAceptado() {
        return aceptado;
    }

    public void setAceptado(Boolean aceptado) {
        this.aceptado = aceptado;
    }

    @XmlTransient
    public List<Usuarios> getUsuariosList() {
        return usuariosList;
    }

    public void setUsuariosList(List<Usuarios> usuariosList) {
        this.usuariosList = usuariosList;
    }

    public Usuarios getSoyamigode() {
        return soyamigode;
    }

    public void setSoyamigode(Usuarios soyamigode) {
        this.soyamigode = soyamigode;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idamistad != null ? idamistad.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Amistades)) {
            return false;
        }
        Amistades other = (Amistades) object;
        if ((this.idamistad == null && other.idamistad != null) || (this.idamistad != null && !this.idamistad.equals(other.idamistad))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.pucmm.pw.entidades.Amistades[ idamistad=" + idamistad + " ]";
    }
    
}
