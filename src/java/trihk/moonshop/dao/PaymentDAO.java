/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.dao;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import trihk.moonshop.entity.Payments;
import trihk.moonshop.helper.DBHelper;

/**
 *
 * @author TriHuynh
 */
public class PaymentDAO {

    public Payments getOne(int id) {
        EntityManager em = DBHelper.getEntityManager();
        Payments payment = null;
        try {
            em.getTransaction().begin();
            payment = em.find(Payments.class, id);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return payment;
    }
}
