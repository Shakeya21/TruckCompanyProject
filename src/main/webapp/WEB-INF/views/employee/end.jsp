<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 13.07.2023
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerDriver.jsp" %>
<div class="container-fluid">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Delete Confirmation</h1>
        <a href="<c:url value="/driver/list/active"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='fas fa-list' style="color:white"></i>Active orders list</a>
    </div>
<h2>Jesteś pewny/a, że chcesz zakończyć zlecenie dla firmy ${ordersActive.contractors.name}
    o id ${ordersActive.contractors.id} z dnia ${ordersActive.date}</h2>
<form:form modelAttribute="ordersActive">
    <input type="button" value="Cancel" onclick="window.location.href='/driver/list/active'" class="btn btn-danger">
    <input type="submit" value="Confirm" class="btn btn-primary">
</form:form>
</div>
<%@ include file="../resources/footer.jsp" %>
