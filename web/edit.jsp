<%-- 
    Document   : insert
    Created on : Feb 8, 2018, 10:37:35 AM
    Author     : USER
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
<%@page import="dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form name="update_form" action="ProductControler" method="post">
              <%
               ArrayList<Product> list = ProductDao.findProduct(request.getParameter("pid"));
               Iterator iter = list.iterator();
               for(Product p: list){
                %>
            
            <table>
           
                <tr>
                    <th colspan="3">Update Product</th>
                </tr>
           
               
                <tr>
                    <td>Product Name</td>
                    <td>:</td>
                    <td>
                        <input type="hidden" name="pid" value="<%= p.getPid()%>"/>
                       <input type="text" name="pname" value="<%= p.getPname()%>"/>
                    </td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>:</td>
                    <td><input type="text" name="price" value="<%= p.getPrice()%>"/></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td>:</td>
                    <td><input type="text" name="qty" value="<%= p.getQty() %>"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><input type="submit" name="update" value="Update"/></td>
                </tr>
                
            
                <tr>
                    <td colspan="3">
                        <font color ="green">
                        <c:if test="${sessionScope.sm != null}">
                            <c:out value="${sessionScope.sm}"/>
                            <c:remove scope="session" var="sm"/>
                        </c:if>
                        </font>
                        <font color ="red">
                        <c:if test="${sessionScope.em != null}">
                            <c:out value="${sessionScope.em}"/>
                            <c:remove scope="session" var="em"/>
                        </c:if>
                        </font>
                    </td>
                </tr>
            
            <tr>
                <td colspan="3"><a href="index.jsp">Home Page</a>
                    
                </td>
            </tr>
        </table>
                    <% } %>
        </form>
    </body>
</html>
