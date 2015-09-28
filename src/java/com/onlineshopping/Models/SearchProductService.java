/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineshopping.Models;

import com.onlineshopping.POJO.Product;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Corncob
 */
public class SearchProductService {
    
    public List<Product> searchProduct(int manufactureId, int osId, int screenSize, int price, String color)
    {
        int minScreenSize = 0;
        int maxScreenSize = 0;
        int minPrice = 0;
        int maxPrice = 0;
        
        //Get screen query size
        switch (screenSize)
        {
            case 4:
            {
                minScreenSize = 0;
                maxScreenSize = 4;
                break;
            }
            case 5:
            {
                minScreenSize = 4;
                maxScreenSize = 5;
                break;
            }
            case 6:
            {
                minScreenSize = 5;
                maxScreenSize = 6;
                break;
            }
            case 7:
            {
                minScreenSize = 6;
                maxScreenSize = 99;
                break;
            }
            default:
            {
                minScreenSize = 0;
                maxScreenSize = 99;
                break;
            }
        }
        
        //Get price query range
        switch (price)
        {
            case 3:
            {
                minPrice = 0;
                maxPrice = 3000000;
                break;
            }
            case 5:
            {
                minPrice = 3000000;
                maxPrice = 5000000;
                break;
            }
            case 10:
            {
                minPrice = 5000000;
                maxPrice = 10000000;
                break;
            }
            case 20:
            {
                minPrice = 10000000;
                maxPrice = 20000000;
                break;
            }
            case 100:
            {
                minPrice = 20000000;
                maxPrice = 100000000;
                break;
            }
            default:
            {
                minPrice = 0;
                maxPrice = 100000000;
                break;
            }
        }
        
        String strQuery = "from Product where 1=1";
        if (manufactureId != -1)
        {
            strQuery += " and manufacture='" + manufactureId + "'";
        }
        if (osId != -1)
        {
            strQuery += " and os='" + osId + "'";
        }
        if (screenSize != -1)
        {
            strQuery += " and screensize between '" + minScreenSize + "' and '" + maxScreenSize + "'";
        }
        if (price != -1)
        {
            strQuery += " and price between '" + minPrice + "' and '" + maxPrice + "'";
            
        }
        if (!color.isEmpty())
        {
            strQuery += " and color like '%" + color + "%'";
        }
        
        List<Product> list = new ArrayList<Product>();
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery(strQuery).list();
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
