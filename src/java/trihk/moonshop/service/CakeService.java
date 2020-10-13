/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.service;

import java.util.List;
import trihk.moonshop.dao.CakeDAO;
import trihk.moonshop.dao.CategoryDAO;
import trihk.moonshop.entity.Cakes;
import trihk.moonshop.entity.Categories;

/**
 *
 * @author TriHuynh
 */
public class CakeService {

    private final String ID = "txtId";
    private final String NAME = "txtName";
    private final String DES = "txtDescription";
    private final String QUANTITY = "txtId";
    private final String PRICE = "txtId";
    private final String CRE_DATE = "txtId";
    private final String EXP_DATE = "txtId";
    private final String ROLE_ID = "txtId";
    private final String CATE_ID = "txtId";

    private final CakeDAO cakeDao = new CakeDAO();
    private final CategoryDAO categoryDao = new CategoryDAO();

    public List<Categories> getListCategories() {
        List<Categories> list = categoryDao.getListCategories();
        return list;
    }

    public List<Cakes> getListAll() {
        List<Cakes> cakes = cakeDao.getListCake(10, 1);
        return cakes;
    }

    public List<Cakes> getListAll(String likeName, int minPrice, int maxPrice, int categoryId, int limit, int page) {
        List<Cakes> cakes = cakeDao.getListCake(likeName, minPrice, maxPrice, categoryId, limit, page);
        return cakes;
    }

    public Cakes updateCake(int id, String name, String description,
            boolean status, String createDate, String expirationDate,
            int quantity, int price, int categoryId, String updateUser) {
        Cakes updatedCake = new Cakes();
        return updatedCake;
    }

    public Cakes getOne(int id) {
        return cakeDao.getOne(id);
    }

}
