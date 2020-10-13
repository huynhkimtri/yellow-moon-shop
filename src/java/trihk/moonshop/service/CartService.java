/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.service;

import java.util.List;
import trihk.moonshop.bean.CartBean;
import trihk.moonshop.bean.CartItemBean;
import trihk.moonshop.entity.Cakes;

/**
 *
 * @author TriHuynh
 */
public class CartService {
    
    public CartBean addItemToCart(CartItemBean item, CartBean cart) {
        if (cart == null) {
            cart = new CartBean();
        }
        cart.addItem(item);
        return cart;
    }
    
    public CartBean addItemToCart(int itemId, CartBean cart) {
        if (cart == null) {
            cart = new CartBean();
        }
        CartItemBean item = new CartItemBean();
        CakeService service = new CakeService();
        Cakes cake = service.getOne(itemId);
        item.setId(itemId);
        item.setImg(cake.getImageUrl());
        item.setName(cake.getName());
        item.setPrice(cake.getPrice());
        cart.addItem(item);
        return cart;
    }
    
    public CartBean removeItemFromCart(CartItemBean item, CartBean cart) {
        if (cart != null) {
            cart.removeItem(item);
        }
        return cart;
    }
    
    public CartBean removeItemFromCart(int itemId, CartBean cart) {
        if (cart != null) {
            CartItemBean item = new CartItemBean();
            item.setId(itemId);
            cart.removeItem(item);
        }
        return cart;
    }
    
    public CartBean updateItemFromCart(int itemId, CartBean cart, int quantity) {
        if (cart != null) {
            CartItemBean item = new CartItemBean();
            item.setId(itemId);
            cart.updateItem(item, quantity);
        }
        return cart;
    }
    
    public CartBean removeItemsFromCart(CartBean cart, List<CartItemBean> items) {
        if (cart != null) {
            int size = items.size();
            for (int i = 0; i < size; i++) {
                cart.removeItem(items.get(i));
            }
        }
        return cart;
    }
}
