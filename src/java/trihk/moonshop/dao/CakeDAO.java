/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import trihk.moonshop.entity.Cakes;
import trihk.moonshop.helper.DBHelper;

/**
 *
 * @author TriHuynh
 */
public class CakeDAO implements Serializable {

    public Cakes insert(Cakes cake) {
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(cake);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return cake;
    }

    public Cakes update(Cakes cake) {
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(cake);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return cake;
    }

    public Cakes getOne(int id) {
        EntityManager em = DBHelper.getEntityManager();
        Cakes cake = null;
        try {
            em.getTransaction().begin();
            cake = em.find(Cakes.class, id);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return cake;
    }

    public List<Cakes> getListCake() {
        List<Cakes> list = new ArrayList<>();
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            list = em.createNamedQuery("Cakes.findAll")
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

    public List<Cakes> getListCake(int limit, int page) {
        List<Cakes> list = new ArrayList<>();
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            list = em.createNamedQuery("Cakes.findAll")
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

    public List<Cakes> getListCake(String likeName, int minPrice, int maxPrice, int categoryId) {
        List<Cakes> list = new ArrayList<>();
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            list = em.createNamedQuery("Cakes.findByNameAndPriceAndCategory")
                    .setParameter("name", "N'%" + likeName + "%")
                    .setParameter("minPrice", minPrice)
                    .setParameter("maxPrice", maxPrice)
                    .setParameter("cateId", categoryId)
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

    public List<Cakes> getListCake(String likeName, int minPrice, int maxPrice, int categoryId, int limit, int index) {
        List<Cakes> list = new ArrayList<>();
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            list = em.createNamedQuery("Cakes.findByNameAndPriceAndCategory")
                    .setParameter("name", "%" + likeName + "%")
                    .setParameter("minPrice", minPrice)
                    .setParameter("maxPrice", maxPrice)
                    .setParameter("cateId", categoryId)
                    .setFirstResult(index - 1)
                    .setMaxResults((index - 1) * limit)
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

    public int getCount() {
        int count = 0;
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            count = em.createNamedQuery("Cakes.findAll").getMaxResults();
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return count;
    }

    public int getCount(int status) {
        int count = 0;
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            count = em.createNamedQuery("Cakes.findAllByIsActive")
                    .setParameter("isActivie", status)
                    .getMaxResults();
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return count;
    }

}
