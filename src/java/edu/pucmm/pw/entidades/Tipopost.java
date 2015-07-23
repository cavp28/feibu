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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
@Table(name = "TIPOPOST")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tipopost.findAll", query = "SELECT t FROM Tipopost t"),
    @NamedQuery(name = "Tipopost.findByIdtipopost", query = "SELECT t FROM Tipopost t WHERE t.idtipopost = :idtipopost"),
    @NamedQuery(name = "Tipopost.findByTipopost", query = "SELECT t FROM Tipopost t WHERE t.tipopost = :tipopost")})
public class Tipopost implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDTIPOPOST")
    private Integer idtipopost;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "TIPOPOST")
    private String tipopost;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipopost")
    private List<Posts> postsList;

    public Tipopost() {
    }

    public Tipopost(Integer idtipopost) {
        this.idtipopost = idtipopost;
    }

    public Tipopost(Integer idtipopost, String tipopost) {
        this.idtipopost = idtipopost;
        this.tipopost = tipopost;
    }

    public Integer getIdtipopost() {
        return idtipopost;
    }

    public void setIdtipopost(Integer idtipopost) {
        this.idtipopost = idtipopost;
    }

    public String getTipopost() {
        return tipopost;
    }

    public void setTipopost(String tipopost) {
        this.tipopost = tipopost;
    }

    @XmlTransient
    public List<Posts> getPostsList() {
        return postsList;
    }

    public void setPostsList(List<Posts> postsList) {
        this.postsList = postsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipopost != null ? idtipopost.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipopost)) {
            return false;
        }
        Tipopost other = (Tipopost) object;
        if ((this.idtipopost == null && other.idtipopost != null) || (this.idtipopost != null && !this.idtipopost.equals(other.idtipopost))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.pucmm.pw.entidades.Tipopost[ idtipopost=" + idtipopost + " ]";
    }
    
}
