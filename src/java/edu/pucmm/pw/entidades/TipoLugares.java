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
@Table(name = "TIPO_LUGARES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoLugares.findAll", query = "SELECT t FROM TipoLugares t"),
    @NamedQuery(name = "TipoLugares.findByIdtipolugar", query = "SELECT t FROM TipoLugares t WHERE t.idtipolugar = :idtipolugar"),
    @NamedQuery(name = "TipoLugares.findByNombre", query = "SELECT t FROM TipoLugares t WHERE t.nombre = :nombre")})
public class TipoLugares implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDTIPOLUGAR")
    private Integer idtipolugar;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "NOMBRE")
    private String nombre;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idtipolugar")
    private List<Lugares> lugaresList;

    public TipoLugares() {
    }

    public TipoLugares(Integer idtipolugar) {
        this.idtipolugar = idtipolugar;
    }

    public TipoLugares(Integer idtipolugar, String nombre) {
        this.idtipolugar = idtipolugar;
        this.nombre = nombre;
    }

    public Integer getIdtipolugar() {
        return idtipolugar;
    }

    public void setIdtipolugar(Integer idtipolugar) {
        this.idtipolugar = idtipolugar;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @XmlTransient
    public List<Lugares> getLugaresList() {
        return lugaresList;
    }

    public void setLugaresList(List<Lugares> lugaresList) {
        this.lugaresList = lugaresList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipolugar != null ? idtipolugar.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoLugares)) {
            return false;
        }
        TipoLugares other = (TipoLugares) object;
        if ((this.idtipolugar == null && other.idtipolugar != null) || (this.idtipolugar != null && !this.idtipolugar.equals(other.idtipolugar))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.pucmm.pw.entidades.TipoLugares[ idtipolugar=" + idtipolugar + " ]";
    }
    
}
