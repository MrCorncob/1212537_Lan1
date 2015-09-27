/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineshopping.Models;

import com.onlineshopping.POJO.User;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Corncob
 */
public class LoginService {
    
    public User takeLogin(String username, String password)
    {
        User user = getUserByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        } else {
            return null;
        }
    }
    
    public User getUserByUsername(String username) {
        SessionFactory factory = HibernateUtil.getSessionFactory();

        Session session = factory.getCurrentSession();
        Transaction tx = null;
        User user = new User();
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("select u from User u where username='" + username + "'");
            user = (User) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            user = null;
            e.printStackTrace();
        }
        return user;
    }

    public List<User> getListOfUsers() {
        List<User> list = new ArrayList<User>();
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from User").list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
        return list;
    }
}
