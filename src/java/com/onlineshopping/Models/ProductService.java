/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineshopping.Models;

import com.onlineshopping.POJO.Product;
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
public class ProductService {
    
    
    public List<Product> getProductByManufactureId(int manufactureId)
    {
        List<Product> list = new ArrayList<Product>();
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Product where manufacture='" + manufactureId + "'").list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Product> getProductByOsId(int osId)
    {
        List<Product> list = new ArrayList<Product>();
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Product where os='" + osId + "'").list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
        return list;
    }
    
    public Product getProductById(int id) {
        SessionFactory factory = HibernateUtil.getSessionFactory();

        Session session = factory.getCurrentSession();
        Transaction tx = null;
        Product product = new Product();
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("select p from Product p where id='" + id + "'");
            product = (Product) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            product = null;
            e.printStackTrace();
        }
        return product;
    }
}
