/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineshopping.Models;

import com.onlineshopping.POJO.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Corncob
 */
public class RegisterService {

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
        }
        return user;
    }

    public boolean registerUser(User user) {
        boolean result = false;
        if (isUserExists(user)) {
            result = false;
            return result;
        }

        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();

        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            session.save(user);
            tx.commit();
            
            result = true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
                result = false;
                e.printStackTrace();
            }
        }
        return result;
    }

    public boolean isUserExists(User user) {
        boolean result = false;
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from User where username='" + user.getUsername() + "'");
            User u = (User) query.uniqueResult();
            tx.commit();
            if (u != null) {
                result = true;
            }
        } catch (Exception ex) {
            if (tx != null) {
                tx.rollback();
            }
        }
        return result;
    }
}
