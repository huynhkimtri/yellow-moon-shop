/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.bean;

import java.util.HashMap;
import java.util.Iterator;

/**
 *
 * @author TriHuynh
 */
public class CartBean {

    private int totalAmount;
    private HashMap cart;

    public CartBean() {
    }

    public void addItem(CartItemBean item) {
        if (this.cart.containsKey(item)) {
            CartItemBean oldItem = (CartItemBean) this.cart.get(item);
            int quantity = oldItem.getQuantity();
            oldItem.setQuantity(quantity + 1);
        } else {
            this.cart.put(item, 1);
        }
    }

    public boolean removeItem(CartItemBean item) {
        if (this.cart.containsKey(item)) {
            this.cart.remove(item);
            return true;
        }
        return false;
    }

    public void setTotalAmount() {
        Iterator<String> itr = this.cart.keySet().iterator();
        while (itr.hasNext()) {
            CartItemBean item = (CartItemBean) this.cart.get(itr.next());
            totalAmount += item.getPrice() * item.getQuantity();
        }
    }
}
