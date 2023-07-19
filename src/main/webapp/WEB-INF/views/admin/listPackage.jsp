<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 16.07.2023
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerAdmin.jsp" %>
<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Packages</h1>
        <a href="<c:url value="/admin/packages/add"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='far fa-address-card' style="color:white"></i> Add Package</a>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Packages List</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table">
                    <tr>
                        <th>id</th>
                        <th>Trailer Type</th>
                        <th>Load Type</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach items="${packages}" var="packages">
                        <tr>
                            <td>${packages.id}</td>
                            <td>${packages.trailerType}</td>
                            <td>${packages.loadType}</td>
                            <td>
                                <a href="edit/${packages.id}">edit</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
<%@ include file="../resources/footer.jsp" %>