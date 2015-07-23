/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pucmm.pw.entidades;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author david
 */
@Entity
@Table(name = "IMAGENES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Imagenes.findAll", query = "SELECT i FROM Imagenes i"),
    @NamedQuery(name = "Imagenes.findByIdimagen", query = "SELECT i FROM Imagenes i WHERE i.idimagen = :idimagen"),
    @NamedQuery(name = "Imagenes.findByDescripcion", query = "SELECT i FROM Imagenes i WHERE i.descripcion = :descripcion"),
    @NamedQuery(name = "Imagenes.findByImagen", query = "SELECT i FROM Imagenes i WHERE i.imagen = :imagen"),
    @NamedQuery(name = "Imagenes.findByFechasubida", query = "SELECT i FROM Imagenes i WHERE i.fechasubida = :fechasubida")})
public class Imagenes implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDIMAGEN")
    private Integer idimagen;
    @Size(max = 2147483647)
    @Column(name = "DESCRIPCION")
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "IMAGEN")
    private String imagen;
    @Column(name = "FECHASUBIDA")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechasubida;
    @ManyToMany(mappedBy = "imagenesList")
    private List<Albumes> albumesList;
    @JoinColumn(name = "IDPOST", referencedColumnName = "IDPOST")
    @ManyToOne(optional = false)
    private Posts idpost;
    @JoinColumn(name = "IDUSUARIO", referencedColumnName = "IDUSUARIO")
    @ManyToOne(optional = false)
    private Usuarios idusuario;

    public Imagenes() {
    }

    public Imagenes(Integer idimagen) {
        this.idimagen = idimagen;
    }

    public Imagenes(Integer idimagen, String imagen) {
        this.idimagen = idimagen;
        this.imagen = imagen;
    }

    public Integer getIdimagen() {
        return idimagen;
    }

    public void setIdimagen(Integer idimagen) {
        this.idimagen = idimagen;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public Date getFechasubida() {
        return fechasubida;
    }

    public void setFechasubida(Date fechasubida) {
        this.fechasubida = fechasubida;
    }

    @XmlTransient
    public List<Albumes> getAlbumesList() {
        return albumesList;
    }

    public void setAlbumesList(List<Albumes> albumesList) {
        this.albumesList = albumesList;
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
        hash += (idimagen != null ? idimagen.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Imagenes)) {
            return false;
        }
        Imagenes other = (Imagenes) object;
        if ((this.idimagen == null && other.idimagen != null) || (this.idimagen != null && !this.idimagen.equals(other.idimagen))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.pucmm.pw.entidades.Imagenes[ idimagen=" + idimagen + " ]";
    }
    
}
