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
        <h1 class="h3 mb-0 text-gray-800">Contractors</h1>
        <a href="<c:url value="/admin/contractor/list"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='fas fa-list' style="color:white"></i> Contractor list</a>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Contractor Details</h6>
        </div>
        <div class="card-body">
            <form:form modelAttribute="contractors">
                <form:hidden path="id"/>
                <div class="form-group">
                    <label for="name" class="form-label">Name</label>
                    <form:input path="name" id="name" class="form-control"
                                placeholder="Insert name"/>
                    <form:errors path="name"/>
                </div>
                <div class="form-group">
                    <label for="nip" class="form-label">NIP</label>
                    <form:input path="nip" id="nip" class="form-control"
                                placeholder="Insert nip number"/>
                    <form:errors path="nip"/>
                </div>
                <div class="form-group">
                    <label for="regon" class="form-label">REGON</label>
                    <form:input path="regon" id="regon" class="form-control"
                                placeholder="Insert regon number"/>
                    <form:errors path="regon"/>
                </div>
                <input type="button" value="Cancel"
                       onclick="window.location.href='/admin/contractor/list'" class="btn btn-danger">
                <input type="submit" value="Send" class="btn btn-primary">
            </form:form>
        </div>
        <%@ include file="../resources/footer.jsp" %>
