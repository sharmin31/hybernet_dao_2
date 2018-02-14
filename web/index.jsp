<%-- 
    Document   : index
    Created on : Feb 8, 2018, 9:53:03 AM
    Author     : USER
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
<%@page import="dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style.css"/>
    </head>
    <body>
        <table border="1" style="border-collapse: collapse;" width = "70%">
            <thead>
                <tr>
                    <th colspan="6">Product List Table</th>
                </tr>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th colspan="2">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                ArrayList<Product> list = ProductDao.getAllProduct();
                for(Product p: list){
                %>
                <tr style="text-align: center;">
                    <td><%= p.getPid() %></td>
                    <td><%= p.getPname()%></td>
                    
                    <td><%= p.getPrice()%></td>
                    <td><%= p.getQty()%></td>
                    <td><a href="edit.jsp?pid=<%= p.getPid() %>"><button>Edit</button></a></td>
                    <td><a href="ProductControler?pid=<%= p.getPid()%>&&for=delete" onclick="return confirm('are u sure?')"><button>Delete</button></a></td>
                </tr>
                <%
                }
                %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="6">
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
            </tfoot>
        </table>
    </body>
</html>
