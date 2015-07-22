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
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author david
 */
@Entity
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Posts.findAll", query = "SELECT p FROM Posts p"),
    @NamedQuery(name = "Posts.findByIdpost", query = "SELECT p FROM Posts p WHERE p.idpost = :idpost"),
    @NamedQuery(name = "Posts.findByFechapost", query = "SELECT p FROM Posts p WHERE p.fechapost = :fechapost"),
    @NamedQuery(name = "Posts.findByDescripcion", query = "SELECT p FROM Posts p WHERE p.descripcion = :descripcion")})
public class Posts implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer idpost;
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechapost;
    @Size(max = 2147483647)
    private String descripcion;
    @ManyToMany(mappedBy = "postsList")
    private List<Likes> likesList;
    @ManyToMany(mappedBy = "postsList")
    private List<Comentarios> comentariosList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idpost")
    private List<Imagenes> imagenesList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idpost")
    private List<Albumes> albumesList;
    @JoinColumn(name = "TIPOPOST", referencedColumnName = "IDTIPOPOST")
    @ManyToOne(optional = false)
    private Tipopost tipopost;
    @JoinColumn(name = "IDUSUARIO", referencedColumnName = "IDUSUARIO")
    @ManyToOne(optional = false)
    private Usuarios idusuario;

    public Posts() {
    }

    public Posts(Integer idpost) {
        this.idpost = idpost;
    }

    public Integer getIdpost() {
        return idpost;
    }

    public void setIdpost(Integer idpost) {
        this.idpost = idpost;
    }

    public Date getFechapost() {
        return fechapost;
    }

    public void setFechapost(Date fechapost) {
        this.fechapost = fechapost;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @XmlTransient
    public List<Likes> getLikesList() {
        return likesList;
    }

    public void setLikesList(List<Likes> likesList) {
        this.likesList = likesList;
    }

    @XmlTransient
    public List<Comentarios> getComentariosList() {
        return comentariosList;
    }

    public void setComentariosList(List<Comentarios> comentariosList) {
        this.comentariosList = comentariosList;
    }

    @XmlTransient
    public List<Imagenes> getImagenesList() {
        return imagenesList;
    }

    public void setImagenesList(List<Imagenes> imagenesList) {
        this.imagenesList = imagenesList;
    }

    @XmlTransient
    public List<Albumes> getAlbumesList() {
        return albumesList;
    }

    public void setAlbumesList(List<Albumes> albumesList) {
        this.albumesList = albumesList;
    }

    public Tipopost getTipopost() {
        return tipopost;
    }

    public void setTipopost(Tipopost tipopost) {
        this.tipopost = tipopost;
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
        hash += (idpost != null ? idpost.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Posts)) {
            return false;
        }
        Posts other = (Posts) object;
        if ((this.idpost == null && other.idpost != null) || (this.idpost != null && !this.idpost.equals(other.idpost))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.pucmm.pw.entidades.Posts[ idpost=" + idpost + " ]";
    }
    
}
