/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.bean;

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

}
