/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.bean;

import java.util.Objects;
import trihk.moonshop.entity.Cakes;

/**
 *
 * @author TriHuynh
 */
public class CartItemBean {

    private Cakes cake;
    private int quantity;
    private int price;
    private int amount;

    public CartItemBean() {
    }

    public CartItemBean(Cakes cake, int quantity, int price, int amount) {
        this.cake = cake;
        this.quantity = quantity;
        this.price = price;
        this.amount = amount;
    }

    /**
     * @return the cake
     */
    public Cakes getCake() {
        return cake;
    }

    /**
     * @param cake the cake to set
     */
    public void setCake(Cakes cake) {
        this.cake = cake;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the price
     */
    public int getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(int price) {
        this.price = price;
    }

    /**
     * @return the amount
     */
    public int getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 79 * hash + Objects.hashCode(this.cake);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final CartItemBean other = (CartItemBean) obj;
        if (!Objects.equals(this.cake, other.cake)) {
            return false;
        }
        return true;
    }

}
