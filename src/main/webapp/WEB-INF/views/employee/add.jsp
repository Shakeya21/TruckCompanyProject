<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 09.07.2023
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerDriver.jsp" %>
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Drivers</h1>
        <a href="<c:url value="/driver/list/active"/>"
           class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='fas fa-list' style="color:white"></i>Active Orders list</a>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Orders Details</h6>
        </div>
        <div class="card-body">
            <form:form modelAttribute="orderDetails">
                <form:hidden path="id"/>
                <form:errors path="id"/><br/>
                <div class="form-group">
                    <label for="mileage" class="form-label">Mileage</label>
                    <form:input path="mileage" id="mileage" class="form-control" placeholder="Enter mileage"/>
                    <form:errors path="mileage"/>
                </div>
                <div class="form-group">
                    <label for="place" class="form-label">Place</label>
                    <form:input path="place" id="place" class="form-control" placeholder="Enter place"/>
                    <form:errors path="place"/>
                </div>
                <div class="form-group">
                    <label for="place" class="form-label">State</label>
                    <form:input path="state" id="state" class="form-control" placeholder="Enter state"/>
                    <form:errors path="state"/>
                </div>
                <div class="form-group">
                    <label for="action" class="form-label">Action</label>
                    <form:input path="action" id="action" class="form-control"
                                placeholder="Enter the action that you performed"/>
                    <form:errors path="action"/>
                </div>
                <div class="form-group">
                    <label for="quantity" class="form-label">Quantity</label>
                    <form:input path="quantity" id="quantity" class="form-control" placeholder="Enter quantity"/>
                    <form:errors path="quantity"/>
                </div>
                <div class="form-group">
                    <label for="sum" class="form-label">Sum</label>
                    <form:input path="sum" id="sum" class="form-control" placeholder="Enter sum"/>
                    <form:errors path="sum"/>
                </div>
                <input type="button" value="Cancel" onclick="window.location.href='/driver/list/active'"
                       class="btn btn-danger">
                <input type="submit" value="Send" class="btn btn-primary">
            </form:form>
        </div>
<%@ include file="../resources/footer.jsp" %>