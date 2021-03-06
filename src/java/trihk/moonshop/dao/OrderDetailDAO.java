/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import trihk.moonshop.entity.OrderDetails;
import trihk.moonshop.helper.DBHelper;

/**
 *
 * @author TriHuynh
 */
public class OrderDetailDAO {

    public OrderDetails insert(OrderDetails orderDetail) {
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(orderDetail);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return orderDetail;
    }

    public OrderDetails update(OrderDetails orderDetail) {
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(orderDetail);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return orderDetail;
    }

    public OrderDetails remove(OrderDetails orderDetail) {
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            if (!em.contains(orderDetail)) {
                orderDetail = em.merge(orderDetail);
            }
            em.remove(orderDetail);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return orderDetail;
    }

    public OrderDetails getOne(int id) {
        EntityManager em = DBHelper.getEntityManager();
        OrderDetails orderDetail = null;
        try {
            em.getTransaction().begin();
            orderDetail = em.find(OrderDetails.class, id);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return orderDetail;
    }

    public List<OrderDetails> getListOrderDetailsByOrderId(int orderId) {
        List<OrderDetails> list = new ArrayList<>();
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            list = em.createNamedQuery("OrderDetails.findByOrderId")
                    .setParameter("id", orderId)
                    .getResultList();
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return list;
    }
}
