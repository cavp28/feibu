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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author david
 */
@Entity
@Table(name = "ALBUMES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Albumes.findAll", query = "SELECT a FROM Albumes a"),
    @NamedQuery(name = "Albumes.findByIdalbum", query = "SELECT a FROM Albumes a WHERE a.idalbum = :idalbum"),
    @NamedQuery(name = "Albumes.findByDescripcion", query = "SELECT a FROM Albumes a WHERE a.descripcion = :descripcion")})
public class Albumes implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDALBUM")
    private Integer idalbum;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "DESCRIPCION")
    private String descripcion;
    @JoinTable(name = "ALBUMES_IMAGENES", joinColumns = {
        @JoinColumn(name = "IDALBUM", referencedColumnName = "IDALBUM")}, inverseJoinColumns = {
        @JoinColumn(name = "IDIMAGEN", referencedColumnName = "IDIMAGEN")})
    @ManyToMany
    private List<Imagenes> imagenesList;
    @JoinColumn(name = "IDPOST", referencedColumnName = "IDPOST")
    @ManyToOne(optional = false)
    private Posts idpost;
    @JoinColumn(name = "IDUSUARIO", referencedColumnName = "IDUSUARIO")
    @ManyToOne(optional = false)
    private Usuarios idusuario;

    public Albumes() {
    }

    public Albumes(Integer idalbum) {
        this.idalbum = idalbum;
    }

    public Albumes(Integer idalbum, String descripcion) {
        this.idalbum = idalbum;
        this.descripcion = descripcion;
    }

    public Integer getIdalbum() {
        return idalbum;
    }

    public void setIdalbum(Integer idalbum) {
        this.idalbum = idalbum;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @XmlTransient
    public List<Imagenes> getImagenesList() {
        return imagenesList;
    }

    public void setImagenesList(List<Imagenes> imagenesList) {
        this.imagenesList = imagenesList;
    }

    public Posts getIdpost() {
        return idpost;
    }

    public void setIdpost(Posts idpost) {
        this.idpost = idpost;
    }

    public Usuarios getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuarios idusuario) {
        this.idusuario = idusuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idalbum != null ? idalbum.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Albumes)) {
            return false;
        }
        Albumes other = (Albumes) object;
        if ((this.idalbum == null && other.idalbum != null) || (this.idalbum != null && !this.idalbum.equals(other.idalbum))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.pucmm.pw.entidades.Albumes[ idalbum=" + idalbum + " ]";
    }
    
}
