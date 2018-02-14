/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Product;
import java.util.ArrayList;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

/**
 *
 * @author USER
 */
public class ProductDao {

    public static Product findProduct(int pid) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    SessionFactory factory = HibernateUtil.getSessionFactory();
    public  boolean save(Product p){
    
        try{
        Session session = factory.openSession();
        session.beginTransaction();
        session.save(p);
        session.getTransaction().commit();
        session.close();
        return true;
        }catch(Exception e){
          return false;
        }
      
    }
    public static ArrayList getAllProduct(){
    SessionFactory factory = HibernateUtil.getSessionFactory();
    Session session = factory.openSession();
    
   ArrayList<Product> plist = (ArrayList<Product>) session.createQuery("SELECT al FROM Product al").list();
    plist.toString();
    session.close();
    
    return plist;
    }
    
     public boolean update(Product p) {
        try {
            SessionFactory factory = HibernateUtil.getSessionFactory();
            Session session = factory.openSession();
            session.beginTransaction();

            session.update(p);

            session.getTransaction().commit();

            session.close();

            return true;
        } catch (Exception e) {
            return false;
        }
    }
     public boolean delete(Product p) {
        try {
            SessionFactory factory = HibernateUtil.getSessionFactory();
            Session session = factory.openSession();
            session.beginTransaction();

            session.delete(p);

            session.getTransaction().commit();

            session.close();

            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public static ArrayList<Product> findProduct(String pid){
     SessionFactory factory = HibernateUtil.getSessionFactory();
    Session session = factory.openSession();
    
   ArrayList<Product> plist =  (ArrayList<Product>)session.createQuery
        ("SELECT al FROM Product al where lower(pid)= '" + pid.toLowerCase() +"'").list();
   
   plist.toString();
   session.close();
   
   return plist;
    }
}
