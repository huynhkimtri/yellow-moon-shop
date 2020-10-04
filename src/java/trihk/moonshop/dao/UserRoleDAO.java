/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.dao;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import trihk.moonshop.entity.UserRoles;
import trihk.moonshop.helper.DBHelper;

/**
 *
 * @author TriHuynh
 */
public class UserRoleDAO {

    public UserRoles insert(UserRoles role) {
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(role);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return role;
    }

    public UserRoles update(UserRoles role) {
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(role);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return role;
    }

    public UserRoles getById(int roleId) {
        EntityManager em = DBHelper.getEntityManager();
        UserRoles role = null;
        try {
            em.getTransaction().begin();
            role = (UserRoles) em.createNamedQuery("UserRoles.findById")
                    .setParameter("id", roleId)
                    .getSingleResult();
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return role;
    }

}
