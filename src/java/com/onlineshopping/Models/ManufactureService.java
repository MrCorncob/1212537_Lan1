/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineshopping.Models;

import com.onlineshopping.POJO.Manufacture;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Corncob
 */
public class ManufactureService {
    
    public static List<Manufacture> getManufactureList()
    {
        List<Manufacture> list = new ArrayList<Manufacture>();
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Manufacture").list();
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
