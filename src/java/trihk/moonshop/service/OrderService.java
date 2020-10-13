/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.service;

import java.util.List;
import trihk.moonshop.dao.OrderDAO;
import trihk.moonshop.dao.OrderDetailDAO;
import trihk.moonshop.entity.OrderDetails;
import trihk.moonshop.entity.Orders;

/**
 *
 * @author TriHuynh
 */
public class OrderService {

    private final OrderDAO orderDao = new OrderDAO();
    private final OrderDetailDAO detailDao = new OrderDetailDAO();

    public List<Orders> getListOrdersByUser(String username) {
        List<Orders> listOfOrders = orderDao.getListOrdersByUser(username);
        return listOfOrders;
    }

    public Orders getOrderById(int orderId) {
        Orders order = orderDao.getOne(orderId);
        return order;
    }

    public List<OrderDetails> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetails> listOfOrderDetails = detailDao.getListOrderDetailsByOrderId(orderId);
        return listOfOrderDetails;
    }
}
