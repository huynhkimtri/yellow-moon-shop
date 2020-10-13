/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.bean;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author TriHuynh
 */
public class CartBean {

    private int totalAmount;
    private Map<CartItemBean, Integer> items;

    public Map<CartItemBean, Integer> getItems() {
        return items;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void addItem(CartItemBean item) {
        if (items == null) {
            items = new HashMap<>();
        }
        int quantity = 1;
        if (items.containsKey(item)) {
            quantity = items.get(item) + 1;
        }
        items.put(item, quantity);
        setTotalAmount();
    }

    public boolean removeItem(CartItemBean item) {
        if (items == null) {
            return false;
        }
        if (items.containsKey(item)) {
            items.remove(item);
            if (items.isEmpty()) {
                items = null;
            } else {
                setTotalAmount();
            }
            return true;
        }
        return false;
    }

    public void updateItem(CartItemBean item, int quantity) {
        if (items == null) {
            return;
        }
        if (items.containsKey(item)) {
            items.put(item, quantity);
            setTotalAmount();
        }
    }

    private void setTotalAmount() {
        totalAmount = 0;
        for (Map.Entry<CartItemBean, Integer> entry : items.entrySet()) {
            CartItemBean key = entry.getKey();
            totalAmount += entry.getValue() * key.getPrice();
        }
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("CartBean{cart=").append(items.size());
        sb.append('}');
        return sb.toString();
    }

}
