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

    public List<Cakes> getListCake(int limit, int index) {
        List<Cakes> list = new ArrayList<>();
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            list = em.createNamedQuery("Cakes.findAll")
                    .setFirstResult(limit * index)
                    .setMaxResults(limit)
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

    public List<Cakes> getListCake(boolean isActive, int limit, int index) {
        List<Cakes> list = new ArrayList<>();
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            list = em.createNamedQuery("Cakes.findAllByIsActive")
                    .setParameter("isActive", isActive)
                    .setFirstResult(limit * index)
                    .setMaxResults(limit)
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

    public List<Cakes> getListCake(String likeName, int minPrice, int maxPrice, boolean isActive, int limit, int index) {
        List<Cakes> list = new ArrayList<>();
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            list = em.createNamedQuery("Cakes.findByNameAndPrice")
                    .setParameter("name", "%" + likeName + "%")
                    .setParameter("minPrice", minPrice)
                    .setParameter("maxPrice", maxPrice)
                    .setParameter("isActive", isActive)
                    .setFirstResult(limit * index)
                    .setMaxResults(limit)
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

    public List<Cakes> getListCake(String likeName, int minPrice, int maxPrice, int categoryId, boolean isActive, int limit, int index) {
        List<Cakes> list = new ArrayList<>();
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            list = em.createNamedQuery("Cakes.findByNameAndPriceAndCategory")
                    .setParameter("name", "%" + likeName + "%")
                    .setParameter("minPrice", minPrice)
                    .setParameter("maxPrice", maxPrice)
                    .setParameter("cateId", categoryId)
                    .setParameter("isActive", isActive)
                    .setFirstResult(limit * index)
                    .setMaxResults(limit)
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
            List<Cakes> list = em.createNamedQuery("Cakes.findAll").getResultList();
            count = list.size();
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return count;
    }

    public int getCount(boolean isActive) {
        int count = 0;
        EntityManager em = DBHelper.getEntityManager();
        try {
            em.getTransaction().begin();
            List<Cakes> list = em.createNamedQuery("Cakes.findAllByIsActive")
                    .setParameter("isActive", isActive)
                    .getResultList();
            count = list.size();
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        return count;
    }

    public int getCount(String likeName, int minPrice, int maxPrice, int categoryId, boolean isActive) {
        int count = 0;
        EntityManager entityManager = DBHelper.getEntityManager();
        try {
            entityManager.getTransaction().begin();
            List<Cakes> list = entityManager.createNamedQuery("Cakes.findByNameAndPriceAndCategory")
                    .setParameter("name", "%" + likeName + "%")
                    .setParameter("minPrice", minPrice)
                    .setParameter("maxPrice", maxPrice)
                    .setParameter("cateId", categoryId)
                    .setParameter("isActive", isActive)
                    .getResultList();
            count = list.size();
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
        return count;
    }

    public int getCount(String likeName, int minPrice, int maxPrice, boolean isActive) {
        int count = 0;
        EntityManager entityManager = DBHelper.getEntityManager();
        try {
            entityManager.getTransaction().begin();
            List<Cakes> list = entityManager.createNamedQuery("Cakes.findByNameAndPrice")
                    .setParameter("name", "%" + likeName + "%")
                    .setParameter("minPrice", minPrice)
                    .setParameter("maxPrice", maxPrice)
                    .setParameter("isActive", isActive)
                    .getResultList();
            count = list.size();
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
        return count;
    }
}
