/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author TriHuynh
 */
@Entity
@Table(name = "cakes", catalog = "MoonShop", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cakes.findAll", query = "SELECT c FROM Cakes c"),
    @NamedQuery(name = "Cakes.findAllByIsActive", query = "SELECT c FROM Cakes c WHERE c.isActive = :isActive"),
    @NamedQuery(name = "Cakes.findByNameAndPriceAndCategory",
            query = "SELECT c FROM Cakes c WHERE c.name LIKE :name AND c.price >= :minPrice AND c.price <= :maxPrice AND c.categoryId.id = :cateId AND c.isActive = :isActive"),
    @NamedQuery(name = "Cakes.findByNameAndPrice",
            query = "SELECT c FROM Cakes c WHERE c.name LIKE :name AND c.price >= :minPrice AND c.price <= :maxPrice AND c.isActive = :isActive"),
    @NamedQuery(name = "Cakes.findById", query = "SELECT c FROM Cakes c WHERE c.id = :id"),
    @NamedQuery(name = "Cakes.findByName", query = "SELECT c FROM Cakes c WHERE c.name = :name"),
    @NamedQuery(name = "Cakes.findByImageUrl", query = "SELECT c FROM Cakes c WHERE c.imageUrl = :imageUrl"),
    @NamedQuery(name = "Cakes.findByDescription", query = "SELECT c FROM Cakes c WHERE c.description = :description"),
    @NamedQuery(name = "Cakes.findByPrice", query = "SELECT c FROM Cakes c WHERE c.price = :price"),
    @NamedQuery(name = "Cakes.findByQuantity", query = "SELECT c FROM Cakes c WHERE c.quantity = :quantity"),
    @NamedQuery(name = "Cakes.findByIsActive", query = "SELECT c FROM Cakes c WHERE c.isActive = :isActive"),
    @NamedQuery(name = "Cakes.findByCreateDate", query = "SELECT c FROM Cakes c WHERE c.createDate = :createDate"),
    @NamedQuery(name = "Cakes.findByExpirationDate", query = "SELECT c FROM Cakes c WHERE c.expirationDate = :expirationDate"),
    @NamedQuery(name = "Cakes.findByUpdatedDate", query = "SELECT c FROM Cakes c WHERE c.updatedDate = :updatedDate")})
public class Cakes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "name", nullable = false, length = 64)
    private String name;
    @Basic(optional = false)
    @Column(name = "image_url", nullable = false, length = 256)
    private String imageUrl;
    @Basic(optional = false)
    @Column(name = "description", nullable = false, length = 256)
    private String description;
    @Basic(optional = false)
    @Column(name = "price", nullable = false)
    private int price;
    @Basic(optional = false)
    @Column(name = "quantity", nullable = false)
    private int quantity;
    @Basic(optional = false)
    @Column(name = "is_active", nullable = false)
    private boolean isActive;
    @Basic(optional = false)
    @Column(name = "create_date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Basic(optional = false)
    @Column(name = "expiration_date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date expirationDate;
    @Column(name = "updated_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate;
    @JoinColumn(name = "category_id", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Categories categoryId;
    @JoinColumn(name = "create_user", referencedColumnName = "username", nullable = false)
    @ManyToOne(optional = false)
    private Users createUser;
    @JoinColumn(name = "update_user", referencedColumnName = "username")
    @ManyToOne
    private Users updateUser;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cakeId")
    private Collection<OrderDetails> orderDetailsCollection;

    public Cakes() {
    }

    public Cakes(Integer id) {
        this.id = id;
    }

    public Cakes(Integer id, String name, String imageUrl, String description, int price, int quantity, boolean isActive, Date createDate, Date expirationDate) {
        this.id = id;
        this.name = name;
        this.imageUrl = imageUrl;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.isActive = isActive;
        this.createDate = createDate;
        this.expirationDate = expirationDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public Categories getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Categories categoryId) {
        this.categoryId = categoryId;
    }

    public Users getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Users createUser) {
        this.createUser = createUser;
    }

    public Users getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(Users updateUser) {
        this.updateUser = updateUser;
    }

    @XmlTransient
    public Collection<OrderDetails> getOrderDetailsCollection() {
        return orderDetailsCollection;
    }

    public void setOrderDetailsCollection(Collection<OrderDetails> orderDetailsCollection) {
        this.orderDetailsCollection = orderDetailsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cakes)) {
            return false;
        }
        Cakes other = (Cakes) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "trihk.moonshop.entity.Cakes[ id=" + id + " ]";
    }

}
