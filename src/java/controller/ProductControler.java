/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDao;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
public class ProductControler extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       PrintWriter out = response.getWriter();
       
       if(request.getParameter("insert") != null){
          String pname = request.getParameter("pname");
          int qty = Integer.parseInt(request.getParameter("qty"));
          int price = Integer.parseInt(request.getParameter("price"));
          
          Product product = new Product();
          product.setPname(pname);
          product.setQty(qty);
          product.setPrice(price);
          
          boolean status =  new ProductDao().save(product);
          if(status){
              request.getSession().setAttribute("sm", "product saved successfully");
          }else{
           request.getSession().setAttribute("em", "product not saved ");
          }
          
          request.getRequestDispatcher("/insert.jsp").forward(request, response);
          
       }else if(request.getParameter("update") != null){
            String pname = request.getParameter("pname");
            int price = Integer.parseInt(request.getParameter("price"));
            int qty = Integer.parseInt(request.getParameter("qty"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            

            Product product = new Product();
            product.setPname(pname);
            product.setPrice(price);
            product.setQty(qty);
            product.setPid(pid);
            
            boolean status = new ProductDao().update(product);
            if (status) {
                request.getSession().setAttribute("sm", "product Update successfully");
            } else {
                request.getSession().setAttribute("em", "product not Update");
            }
            
            request.getRequestDispatcher("/edit.jsp?pid= " + pid).forward(request, response);
        }
       else if(request.getParameter("for").equalsIgnoreCase("delete")){
       
          int pid = Integer.parseInt(request.getParameter("pid"));
           ArrayList<Product> product = ProductDao.findProduct(String.valueOf("pid"));
         Product pr = new Product();
         for(Product p: product){
                pr.setPid(p.getPid());
                pr.setPname(p.getPname());
                pr.setQty(p.getQty());
                pr.setPrice(p.getPrice());
         }
         boolean status = new ProductDao().delete(pr);
         
         if(status){
              request.getSession().setAttribute("sm", "product delete successfully");
          }else{
           request.getSession().setAttribute("em", "product not deleted ");
          }
          
          request.getRequestDispatcher("/index.jsp").forward(request, response);
          
       }
       }
        
                
    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    

}
