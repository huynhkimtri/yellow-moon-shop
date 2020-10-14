/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import trihk.moonshop.bean.CartBean;
import trihk.moonshop.bean.CartItemBean;
import trihk.moonshop.dao.CakeDAO;
import trihk.moonshop.dao.OrderDAO;
import trihk.moonshop.dao.OrderDetailDAO;
import trihk.moonshop.dao.PaymentDAO;
import trihk.moonshop.dao.UserDAO;
import trihk.moonshop.entity.Cakes;
import trihk.moonshop.entity.OrderDetails;
import trihk.moonshop.entity.Orders;

/**
 *
 * @author TriHuynh
 */
public class OrderService {

    private final OrderDAO orderDao = new OrderDAO();
    private final OrderDetailDAO detailDao = new OrderDetailDAO();
    private final PaymentDAO paymentDao = new PaymentDAO();
    private final UserDAO userDao = new UserDAO();
    private final CakeDAO cakeDao = new CakeDAO();

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

    public Orders saveOrder(CartBean cart, String username, String name, String phone, String email, String address, String payment) {
        Orders order = new Orders();
        order.setCreateDate(new Date());
        order.setShippingName(name);
        order.setShippingPhone(phone);
        order.setShippingEmail(email);
        order.setShippingAddress(address);
        int paymentId = 0;
        try {
            paymentId = Integer.parseInt(payment.trim());
        } catch (NumberFormatException e) {
            paymentId = 2;
        }
        order.setPaymentId(paymentDao.getOne(paymentId));
        order.setAmount(cart.getTotalAmount());
        if (username != null) {
            order.setUserId(userDao.getByUsername(username));
        }
        order = orderDao.insert(order);
        for (Map.Entry<CartItemBean, Integer> en : cart.getItems().entrySet()) {
            CartItemBean item = en.getKey();
            int val = en.getValue();
            OrderDetails detail = new OrderDetails();
            detail.setCakeId(cakeDao.getOne(item.getId()));
            detail.setCreateDate(new Date());
            detail.setOrderId(order);
            detail.setSinglePrice(item.getPrice());
            detail.setQuantity(val);
            detailDao.insert(detail);
            Cakes cake = cakeDao.getOne(item.getId());
            if (cake.getQuantity() > val) {
                cake.setQuantity(cake.getQuantity() - val);
                cakeDao.update(cake);
            }
        }
        return order;
    }
}
