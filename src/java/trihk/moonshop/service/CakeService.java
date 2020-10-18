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
import trihk.moonshop.helper.Constants;

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

    public List<Cakes> getListAll(boolean isActive) {
        List<Cakes> cakes = cakeDao.getListCake(isActive, Constants.SIZE_OF_PAGE, 0);
        return cakes;
    }

    public List<Cakes> getListAll() {
        List<Cakes> cakes = cakeDao.getListCake(Constants.SIZE_OF_PAGE, 0);
        return cakes;
    }

    public List<Cakes> getListAll(String likeName, int minPrice, int maxPrice, int categoryId, boolean isActive, int limit, int page) {
        List<Cakes> cakes;
        if (categoryId > 0) {
            cakes = cakeDao.getListCake(likeName, minPrice, maxPrice, categoryId, isActive, limit, page);
        } else {
            cakes = cakeDao.getListCake(likeName, minPrice, maxPrice, isActive, limit, page);
        }
        return cakes;
    }

    public Cakes updateCake(int id, String name,
            boolean status, String createDate, String expirationDate,
            int quantity, int price, int categoryId, String updateUser) {
        Cakes updatedCake = new Cakes();
        return updatedCake;
    }

    public Cakes getOne(int id) {
        return cakeDao.getOne(id);
    }

    public int countForDashboard() {
        return cakeDao.getCount();
    }

    public int countForHome(boolean isActive) {
        return cakeDao.getCount(isActive);
    }

    public int countForSearch(String likeName, int minPrice, int maxPrice, int categoryId, boolean isActive) {
        if (categoryId > 0) {
            return cakeDao.getCount(likeName, minPrice, maxPrice, categoryId, isActive);
        } else {
            return cakeDao.getCount(likeName, minPrice, maxPrice, isActive);
        }
    }

}
