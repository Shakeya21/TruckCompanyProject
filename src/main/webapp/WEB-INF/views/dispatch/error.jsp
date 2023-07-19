<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 16.07.2023
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerDispatch.jsp" %>
<div class="container-fluid">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Delete Confirmation</h1>
        <a href="<c:url value="/dispatch/list"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='fas fa-list' style="color:white"></i> Orders list</a>
    </div>
<h2>Nie można usunąć zlecenia, do którego zostały dodane detale!</h2>
<input type="button" value="Back to list" onclick="window.location.href='/dispatch/list'" class="btn btn-primary">
</div>
<%@ include file="../resources/footer.jsp" %>