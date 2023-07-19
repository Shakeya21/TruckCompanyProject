<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 18.07.2023
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerMain.jsp" %>
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Login page</h1>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Please Sign In!</h6>
        </div>
        <div class="card-body">
            <form method="post">
                <div class="form-group">
                    <label for="username" class="form-label"> User Name :</label>
                    <input type="text" name="username" id="username" class="form-control"/>
                </div>
                <div><label for="password" class="form-label"> Password: </label>
                    <input type="password" name="password" id="password" class="form-control"/>
                </div>

                <input type="button" value="Cancel" onclick="window.location.href='/'" class="btn btn-danger">
                <input type="submit" value="Sign In" class="btn btn-primary"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </div>
        <%@ include file="../resources/footer.jsp" %>
