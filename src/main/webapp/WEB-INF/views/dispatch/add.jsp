<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerDispatch.jsp" %>
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Orders</h1>
        <a href="<c:url value="/dispatch/list"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class='fas fa-list' style="color:white"></i>Orders list</a>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Orders Details</h6>
        </div>
        <div class="card-body">
            <form:form modelAttribute="transportOrder">
                <form:hidden path="id"/>
                <form:errors path="id"/>
                <div class="form-group">
                    <label for="trailerNum" class="form-label">Trailer Num:</label>
                    <form:input path="trailerNum" id="trailerNum" class="form-control"
                                placeholder="Input trailer number"/>
                    <form:errors path="trailerNum"/>
                </div>
                <div class="form-group">
                    <label for="destCity" class="form-label">Dest City:</label>
                    <form:input path="destCity" id="destCity" class="form-control"
                                placeholder="Input Destination City"/>
                    <form:errors path="destCity"/>
                </div>
                <div class="form-group">
                    <label for="destState" class="form-label">State:</label>
                    <form:input path="destState" id="destState" class="form-control"
                                placeholder="Input Destination State"/>
                    <form:errors path="destState"/>
                </div>
                <div class="form-group">
                    <label for="employees" class="form-label">Driver Number:</label>
                    <form:select path="employees"
                                 itemLabel="driverNumber"
                                 itemValue="id"
                                 items="${employees}" id="employees" class="form-control"/>
                    <form:errors path="employees"/>
                </div>
                <div class="form-group">
                    <label for="contractors" class="form-label">Contractor:</label>
                    <form:select path="contractors"
                                 itemLabel="name"
                                 itemValue="id"
                                 items="${contractors}" id="contractors" class="form-control"/>
                    <form:errors path="contractors"/>
                </div>
                <div class="form-group">
                    <label for="packages" class="form-label">Package:</label>
                    <form:select path="packages"
                                 itemLabel="loadType"
                                 itemValue="id"
                                 items="${packages}" id="packages" class="form-control"/>
                    <form:errors path="packages"/>
                </div>
                <input type="button" value="Cancel" onclick="window.location.href='/dispatch/list'"
                       class="btn btn-danger">
                <input type="submit" value="Confirm" class="btn btn-primary">
            </form:form>
        </div>
        <%@ include file="../resources/footer.jsp" %>

