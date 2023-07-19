<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 12.07.2023
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerDriver.jsp" %>
<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Orders</h1>
        <a href="<c:url value="/driver/list/ended"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='far fa-address-card' style="color:white"></i> Show ended orders list</a>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Active Orders List</h6>
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
                    <c:forEach items="${ordersActive}" var="ordersActive">
                        <tr>
                            <td>${ordersActive.id}</td>
                            <td>${ordersActive.trailerNum}</td>
                            <td>${ordersActive.destCity}</td>
                            <td>${ordersActive.destState}</td>
                            <td>${ordersActive.contractors.name}</td>
                            <td>${ordersActive.employees.driverNumber}</td>
                            <td>${ordersActive.packages.trailerType}</td>
                            <td>
                                <a href="add/${ordersActive.id}">Add Detail</a>
                                <a href="details/${ordersActive.id}">Show Details</a>
                                <a href="end/${ordersActive.id}">End Order</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
<%@ include file="../resources/footer.jsp" %>