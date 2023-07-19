<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerAdmin.jsp" %>
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Orders</h1>
        <a href="<c:url value="/admin/list"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='fas fa-list' style="color:white"></i>Employees list</a>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Account Details</h6>
        </div>
        <div class="card-body">
            <form:form modelAttribute="userAcc">
            <form:hidden path="id"/>
            <div class="form-group">
                <label for="username" class="form-label">Username</label>
                <form:input path="username" id="username" class="form-control"
                            placeholder="Enter new Username"/>
                <form:errors path="username"/>
            </div>
            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <form:input path="password" id="password" class="form-control"
                            placeholder="Enter new password"/>
                <form:errors path="password"/>
            </div>
            <div class="form-group">
                <label for="email" class="form-label">Email address</label>
                <form:input path="email" id="email" class="form-control"
                            placeholder="Enter new email address"/>
                <form:errors path="email"/>
            </div>
            <div class="form-group">
                <label for="role" class="form-label">Roles</label>
                <form:select path="roles"
                             itemLabel="roleName"
                             itemValue="id"
                             items="${role}"
                             id="role" class="form-control"/>
                <form:errors path="roles"/>
                <input type="submit" value="Save" class="btn btn-primary"/>
                </form:form>
            </div>
        </div>
    <%@ include file="../resources/footer.jsp" %>
