<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 16.07.2023
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerAdmin.jsp" %>
<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Contractors</h1>
        <a href="<c:url value="/admin/contractor/add"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='far fa-address-card' style="color:white"></i> Add Contractor</a>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Contractors List</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table">
                    <tr>
                        <th>id</th>
                        <th>Name</th>
                        <th>NIP</th>
                        <th>REGON</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach items="${contractors}" var="contractors">
                        <tr>
                            <td>${contractors.id}</td>
                            <td>${contractors.name}</td>
                            <td>${contractors.nip}</td>
                            <td>${contractors.regon}</td>
                            <td>
                                <a href="edit/${contractors.id}">edit</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
<%@ include file="../resources/footer.jsp" %>