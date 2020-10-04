/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.service;

import java.util.Date;
import trihk.moonshop.dao.UserDAO;
import trihk.moonshop.dao.UserRoleDAO;
import trihk.moonshop.entity.UserRoles;
import trihk.moonshop.entity.Users;
import trihk.moonshop.helper.PasswordHelper;

/**
 *
 * @author TriHuynh
 */
public class UserService {

    public Users signIn(String username, String password) {
        UserDAO dao = new UserDAO();
        String pwsEncrypt = PasswordHelper.encryptSHA256(password);
        Users user = dao.getByUsernameAndPassword(username, pwsEncrypt);
        return user;
    }

    public Users signUp(Users user, int roleId) {
        UserDAO dao = new UserDAO();
        String pwsEncrypt = PasswordHelper.encryptSHA256(user.getPassword());
        user.setPassword(pwsEncrypt);
        UserRoleDAO roleDao = new UserRoleDAO();
        UserRoles role = roleDao.getById(roleId);
        user.setRoleId(role);
        return dao.insert(user);
    }

    public Users activeUsers(Users user) {
        UserDAO dao = new UserDAO();
        user.setIsActive(Boolean.TRUE);
        user.setUpdateDate(new Date());
        return dao.update(user);
    }

    public Users changeRole(Users user, int roleId) {
        UserDAO userDao = new UserDAO();
        UserRoleDAO roleDao = new UserRoleDAO();
        UserRoles role = roleDao.getById(roleId);
        user.setRoleId(role);
        user.setUpdateDate(new Date());
        return userDao.update(user);
    }
}
