<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 12.07.2023
  Time: 09:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerAdmin.jsp" %>
<div class="container-fluid">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Delete Confirmation</h1>
        <a href="<c:url value="/admin/contractor/list"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='fas fa-list' style="color:white"></i> Contractor list</a>
    </div>
<h2>Jesteś pewny/a, że chcesz usunąć pracownika ${employees.firstName} ${employees.lastName}
o numerze ${employees.driverNumber}</h2>
<form action="/admin/delete/${employees.id}" method="post">
    <input type="button" value="Cancel" onclick="window.location.href='/admin/list'" class="btn btn-danger">
    <input type="submit" value="Confirm" class="btn btn-primary">
</form>
</div>
<%@ include file="../resources/footer.jsp" %>