<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 09.07.2023
  Time: 09:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerDispatch.jsp" %>
<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Orders</h1>
        <a href="<c:url value="/dispatch/add"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='far fa-address-card' style="color:white"></i> Add Order</a>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Orders List</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table">
                    <tr>
                        <th>ID</th>
                        <th>Trailer Number</th>
                        <th>Destination City</th>
                        <th>Destination State</th>
                        <th>Contractor</th>
                        <th>Driver</th>
                        <th>Package</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach items="${transportOrder}" var="transportOrder">
                        <tr>
                            <td>${transportOrder.id}</td>
                            <td>${transportOrder.trailerNum}</td>
                            <td>${transportOrder.destCity}</td>
                            <td>${transportOrder.destState}</td>
                            <td>${transportOrder.contractors.name}</td>
                            <td>${transportOrder.employees.driverNumber}</td>
                            <td>${transportOrder.packages.trailerType}</td>
                            <td>
                                <a href="delete/${transportOrder.id}" class="delete-link">delete</a>
                                <a href="edit/${transportOrder.id}">edit</a>
                                <a href="details/${transportOrder.id}">details</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
<%@ include file="../resources/footer.jsp" %>