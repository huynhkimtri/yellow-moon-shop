/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.helper;

import java.io.Serializable;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author TriHuynh
 */
public class DBHelper implements Serializable {

    private static EntityManagerFactory managerFactory;
    private static final String PU = "YellowMoonShopPU";

    public static EntityManager getEntityManager() {
        if (managerFactory == null) {
            managerFactory = Persistence.createEntityManagerFactory(PU);
        }
        return managerFactory.createEntityManager();
    }
}
