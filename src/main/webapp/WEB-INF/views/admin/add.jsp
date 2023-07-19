<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Employees</h1>
        <a href="<c:url value="/admin/list"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='fas fa-list' style="color:white"></i> User list</a>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Employee Details</h6>
        </div>
        <div class="card-body">
            <form:form modelAttribute="employees">
                <form:hidden path="id"/>
                <div class="form-group">
                    <label for="firstName" class="form-label">Firstname</label>
                    <form:input path="firstName" id="firstName" class="form-control"
                                placeholder="Input Employee Firstname"/>
                    <form:errors path="firstName"/>
                </div>
                <div class="form-group">
                    <label for="lastName">Lastname</label>
                    <form:input path="lastName" id="lastName" class="form-control"
                                placeholder="Input Employee Lastname"/>
                    <form:errors path="lastName"/>
                </div>
                <div class="form-group">
                    <label for="email">E-mail</label>
                    <form:input path="email" id="email" class="form-control"
                                placeholder="Input Employee email address"/>
                    <form:errors path="email"/>
                </div>
                <div class="form-group">
                    <label for="driverNumber">Driver Number:</label>
                    <form:input path="driverNumber" id="driverNumber" class="form-control"
                                placeholder="Give the driver number"/>
                    <form:errors path="driverNumber"/>
                </div>
                <div class="form-group">
                    <label for="dateOfBirth">Date of birth:</label>
                    <form:input path="dateOfBirth" id="dateOfBirth" class="form-control"
                                placeholder="Input Employee Date Of Birth"/>
                    <form:errors path="dateOfBirth"/>
                </div>
                <div class="form-group">
                    <label for="licenseNumber">License Number:</label>
                    <form:input path="licenseNumber" id="licenseNumber" class="form-control"
                                placeholder="Input Employee License Number"/>
                    <form:errors path="licenseNumber"/>
                </div>

                <input type="button" value="Cancel" onclick="window.location.href='/admin/list'" class="btn btn-danger">
                <input type="submit" value="Send" class="btn btn-primary">
            </form:form>
        </div>
        <%@ include file="../resources/footer.jsp" %>
