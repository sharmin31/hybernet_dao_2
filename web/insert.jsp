<%-- 
    Document   : insert
    Created on : Feb 8, 2018, 10:37:35 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style.css"/>
    </head>
    <body>
        <form name="insert_form" action="ProductControler" method="post">
             <table>
            <thead>
                <tr>
                    <th colspan="3">Insert Product</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Product Name</td>
                    <td>:</td>
                    <td><input type="text" name="pname"/></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>:</td>
                    <td><input type="text" name="price"/></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td>:</td>
                    <td><input type="text" name="qty"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><input type="submit" name="insert" value="Insert"/></td>
                </tr>
            </tbody>
            <tfoot>
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
            </tfoot>
        </table>
        </form>
    </body>
</html>
