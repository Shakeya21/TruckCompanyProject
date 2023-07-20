<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 12.07.2023
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerDispatch.jsp" %>
<div class="container-fluid">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Delete Confirmation</h1>
        <a href="<c:url value="/dispatch/list"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='fas fa-list' style="color:white"></i> Orders list</a>
    </div>
    <h2>Jesteś pewny/a, że chcesz usunąć zlecenie dla firmy ${transportOrder.contractors.name}
        o id ${transportOrder.id}</h2>
    <form:form modelAttribute="transportOrder">
        <input type="button" value="Cancel" onclick="window.location.href='/dispatch/list'" class="btn btn-danger">
        <input type="submit" value="Confirm" class="btn btn-primary">
    </form:form>
</div>
<%@ include file="../resources/footer.jsp" %>

