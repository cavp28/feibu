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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author david
 */
@Entity
@Table(name = "LUGARES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Lugares.findAll", query = "SELECT l FROM Lugares l"),
    @NamedQuery(name = "Lugares.findByIdlugar", query = "SELECT l FROM Lugares l WHERE l.idlugar = :idlugar"),
    @NamedQuery(name = "Lugares.findByNombre", query = "SELECT l FROM Lugares l WHERE l.nombre = :nombre"),
    @NamedQuery(name = "Lugares.findByDescripcion", query = "SELECT l FROM Lugares l WHERE l.descripcion = :descripcion"),
    @NamedQuery(name = "Lugares.findByFechainicio", query = "SELECT l FROM Lugares l WHERE l.fechainicio = :fechainicio"),
    @NamedQuery(name = "Lugares.findByFechafin", query = "SELECT l FROM Lugares l WHERE l.fechafin = :fechafin")})
public class Lugares implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDLUGAR")
    private Integer idlugar;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "NOMBRE")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "DESCRIPCION")
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FECHAINICIO")
    private int fechainicio;
    @Column(name = "FECHAFIN")
    private Integer fechafin;
    @ManyToMany(mappedBy = "lugaresList")
    private List<Usuarios> usuariosList;
    @JoinColumn(name = "IDCIUDAD", referencedColumnName = "IDCIUDAD")
    @ManyToOne(optional = false)
    private Ciudades idciudad;
    @JoinColumn(name = "IDTIPOLUGAR", referencedColumnName = "IDTIPOLUGAR")
    @ManyToOne(optional = false)
    private TipoLugares idtipolugar;

    public Lugares() {
    }

    public Lugares(Integer idlugar) {
        this.idlugar = idlugar;
    }

    public Lugares(Integer idlugar, String nombre, String descripcion, int fechainicio) {
        this.idlugar = idlugar;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.fechainicio = fechainicio;
    }

    public Integer getIdlugar() {
        return idlugar;
    }

    public void setIdlugar(Integer idlugar) {
        this.idlugar = idlugar;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getFechainicio() {
        return fechainicio;
    }

    public void setFechainicio(int fechainicio) {
        this.fechainicio = fechainicio;
    }

    public Integer getFechafin() {
        return fechafin;
    }

    public void setFechafin(Integer fechafin) {
        this.fechafin = fechafin;
    }

    @XmlTransient
    public List<Usuarios> getUsuariosList() {
        return usuariosList;
    }

    public void setUsuariosList(List<Usuarios> usuariosList) {
        this.usuariosList = usuariosList;
    }

    public Ciudades getIdciudad() {
        return idciudad;
    }

    public void setIdciudad(Ciudades idciudad) {
        this.idciudad = idciudad;
    }

    public TipoLugares getIdtipolugar() {
        return idtipolugar;
    }

    public void setIdtipolugar(TipoLugares idtipolugar) {
        this.idtipolugar = idtipolugar;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idlugar != null ? idlugar.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Lugares)) {
            return false;
        }
        Lugares other = (Lugares) object;
        if ((this.idlugar == null && other.idlugar != null) || (this.idlugar != null && !this.idlugar.equals(other.idlugar))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.pucmm.pw.entidades.Lugares[ idlugar=" + idlugar + " ]";
    }
    
}
