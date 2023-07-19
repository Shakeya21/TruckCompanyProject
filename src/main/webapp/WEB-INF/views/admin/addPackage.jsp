<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 16.07.2023
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerAdmin.jsp" %>
<div class="container-fluid">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Packages</h1>
        <a href="<c:url value="/admin/packages/list"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='fas fa-list' style="color:white"></i> Packages list</a>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Package Details</h6>
        </div>
        <div class="card-body">
            <form:form modelAttribute="packages">
                <form:hidden path="id"/>
                <div class="form-group">
                    <label for="trailerType" class="form-label">Trailer type:</label>
                    <form:input path="trailerType" id="trailerType" class="form-control"
                                placeholder="Insert Trailer Type"/>
                    <form:errors path="trailerType"/>
                </div>
                <div class="form-group">
                    <label for="loadType" class="form-label"> Load Type:</label>
                    <form:input path="loadType" id="loadType" class="form-control" placeholder="Insert Load Type"/>
                    <form:errors path="loadType"/>
                </div>
                <input type="button" value="Cancel" onclick="window.location.href='/admin/packages/list'"
                       class="btn btn-danger">
                <input type="submit" value="Send" class="btn btn-primary">
            </form:form>
        </div>
        <%@ include file="../resources/footer.jsp" %>
