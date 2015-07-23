/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pucmm.pw.entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author david
 */
@Entity
@Table(name = "USUARIOS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuarios.findAll", query = "SELECT u FROM Usuarios u"),
    @NamedQuery(name = "Usuarios.findByIdusuario", query = "SELECT u FROM Usuarios u WHERE u.idusuario = :idusuario"),
    @NamedQuery(name = "Usuarios.findByApodo", query = "SELECT u FROM Usuarios u WHERE u.apodo = :apodo"),
    @NamedQuery(name = "Usuarios.findByFotoperfil", query = "SELECT u FROM Usuarios u WHERE u.fotoperfil = :fotoperfil")})
public class Usuarios implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDUSUARIO")
    private Integer idusuario;
    @Size(max = 50)
    @Column(name = "APODO")
    private String apodo;
    @Column(name = "FOTOPERFIL")
    private Integer fotoperfil;
    @ManyToMany(mappedBy = "usuariosList")
    private List<Posts> postsList;
    @JoinTable(name = "USUARIOS_NOTIFICACIONES", joinColumns = {
        @JoinColumn(name = "IDUSUARIO", referencedColumnName = "IDUSUARIO")}, inverseJoinColumns = {
        @JoinColumn(name = "IDNOTIFICACIONES", referencedColumnName = "IDNOTIFICACIONES")})
    @ManyToMany
    private List<Notificaciones> notificacionesList;
    @JoinTable(name = "USUARIOS_LUGARES", joinColumns = {
        @JoinColumn(name = "IDUSUARIO", referencedColumnName = "IDUSUARIO")}, inverseJoinColumns = {
        @JoinColumn(name = "IDLUGAR", referencedColumnName = "IDLUGAR")})
    @ManyToMany
    private List<Lugares> lugaresList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idusuario")
    private List<Imagenes> imagenesList;
    @JoinColumn(name = "IDPERSONA", referencedColumnName = "IDPERSONA")
    @ManyToOne(optional = false)
    private Personas idpersona;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idusuario")
    private List<Likes> likesList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idusuario")
    private List<Comentarios> comentariosList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idusuario")
    private List<Albumes> albumesList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idusuario")
    private List<Posts> postsList1;
    @OneToMany(mappedBy = "emisorusuario")
    private List<Posts> postsList2;

    public Usuarios() {
    }

    public Usuarios(Integer idusuario) {
        this.idusuario = idusuario;
    }

    public Integer getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Integer idusuario) {
        this.idusuario = idusuario;
    }

    public String getApodo() {
        return apodo;
    }

    public void setApodo(String apodo) {
        this.apodo = apodo;
    }

    public Integer getFotoperfil() {
        return fotoperfil;
    }

    public void setFotoperfil(Integer fotoperfil) {
        this.fotoperfil = fotoperfil;
    }

    @XmlTransient
    public List<Posts> getPostsList() {
        return postsList;
    }

    public void setPostsList(List<Posts> postsList) {
        this.postsList = postsList;
    }

    @XmlTransient
    public List<Notificaciones> getNotificacionesList() {
        return notificacionesList;
    }

    public void setNotificacionesList(List<Notificaciones> notificacionesList) {
        this.notificacionesList = notificacionesList;
    }

    @XmlTransient
    public List<Lugares> getLugaresList() {
        return lugaresList;
    }

    public void setLugaresList(List<Lugares> lugaresList) {
        this.lugaresList = lugaresList;
    }

    @XmlTransient
    public List<Imagenes> getImagenesList() {
        return imagenesList;
    }

    public void setImagenesList(List<Imagenes> imagenesList) {
        this.imagenesList = imagenesList;
    }

    public Personas getIdpersona() {
        return idpersona;
    }

    public void setIdpersona(Personas idpersona) {
        this.idpersona = idpersona;
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
    public List<Albumes> getAlbumesList() {
        return albumesList;
    }

    public void setAlbumesList(List<Albumes> albumesList) {
        this.albumesList = albumesList;
    }

    @XmlTransient
    public List<Posts> getPostsList1() {
        return postsList1;
    }

    public void setPostsList1(List<Posts> postsList1) {
        this.postsList1 = postsList1;
    }

    @XmlTransient
    public List<Posts> getPostsList2() {
        return postsList2;
    }

    public void setPostsList2(List<Posts> postsList2) {
        this.postsList2 = postsList2;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idusuario != null ? idusuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuarios)) {
            return false;
        }
        Usuarios other = (Usuarios) object;
        if ((this.idusuario == null && other.idusuario != null) || (this.idusuario != null && !this.idusuario.equals(other.idusuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.pucmm.pw.entidades.Usuarios[ idusuario=" + idusuario + " ]";
    }
    
}
