<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerDriver.jsp" %>
<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Orders</h1>
        <a href="<c:url value="/driver/list/active"/>"
           class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='far fa-address-card' style="color:white"></i> Back to active orders list</a>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Ended Orders List</h6>
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
                    <c:forEach items="${ordersEnded}" var="ordersEnded">
                        <tr>
                            <td>${ordersEnded.id}</td>
                            <td>${ordersEnded.trailerNum}</td>
                            <td>${ordersEnded.destCity}</td>
                            <td>${ordersEnded.destState}</td>
                            <td>${ordersEnded.contractors.name}</td>
                            <td>${ordersEnded.employees.driverNumber}</td>
                            <td>${ordersEnded.packages.trailerType}</td>
                            <td>
                                <a href="details/${ordersEnded.id}">Show details</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
<%@ include file="../resources/footer.jsp" %>