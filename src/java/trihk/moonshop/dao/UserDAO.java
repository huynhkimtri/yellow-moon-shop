/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.dao;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import trihk.moonshop.entity.Users;
import trihk.moonshop.helper.DBHelper;

/**
 *
 * @author TriHuynh
 */
public class UserDAO {

    public Users insert(Users user) {
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return user;
    }

    public Users update(Users user) {
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return user;
    }

    public Users getByUsernameAndPassword(String username, String password) {
        EntityManager em = DBHelper.getEntityManager();
        Users user = null;
        try {
            em.getTransaction().begin();
            List<Users> list  = em.createNamedQuery("Users.findByUsernameAndPassword")
                    .setParameter("username", username)
                    .setParameter("password", password)
                    .getResultList();
            if(!list.isEmpty()) {
                user = list.get(0);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return user;
    }

    public boolean checkByUsername(String username) {
        boolean isFound = false;
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            Users user = (Users) em.createNamedQuery("Users.findByUsername")
                    .setParameter("username", username)
                    .getSingleResult();
            if (user != null) {
                isFound = true;
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return isFound;
    }

    public Users getByUsername(String username) {
        Users user = null;
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            user = (Users) em.createNamedQuery("Users.findByUsername")
                    .setParameter("username", username)
                    .getSingleResult();

            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return user;
    }

}
