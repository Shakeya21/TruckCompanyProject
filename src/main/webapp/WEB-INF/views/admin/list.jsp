<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 09.07.2023
  Time: 09:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerAdmin.jsp" %>
<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Employees</h1>
        <a href="<c:url value="/admin/add"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='far fa-address-card' style="color:white"></i> Add Employee</a>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Drivers List</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table">
                    <tr>
                        <th>id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>E-mail Address</th>
                        <th>Driver Number</th>
                        <th>Date of Birth</th>
                        <th>Driver License</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach items="${employees}" var="employees">
                        <tr>
                            <td>${employees.id}</td>
                            <td>${employees.firstName}</td>
                            <td>${employees.lastName}</td>
                            <td>${employees.email}</td>
                            <td>${employees.driverNumber}</td>
                            <td>${employees.dateOfBirth}</td>
                            <td>${employees.licenseNumber}</td>

                            <td>
                                <a href="delete/${employees.id}">delete</a> |
                                <a href="edit/${employees.id}">edit</a> |
                                <a href="account/edit/${employees.id}">account</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
<%@ include file="../resources/footer.jsp" %>