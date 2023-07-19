<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 13.07.2023
  Time: 08:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../resources/headerDispatch.jsp" %>
<div class="container-fluid">
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Orders</h1>
    <a href="<c:url value="/dispatch/list"/>"
       class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
      <i class='far fa-address-card' style="color:white"></i> Back to orders list</a>
  </div>
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Details List</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table">
          <tr>
            <%--        <th>ID</th>--%>
            <th>Mileage</th>
            <th>Place</th>
            <th>State</th>
            <th>Action</th>
            <th>Quantity</th>
            <th>Sum</th>
            <th>Actions</th>
          </tr>
          <c:forEach items="${orderDetails}" var="orderDetails">
            <tr>
              <td>${orderDetails.mileage}</td>
              <td>${orderDetails.place}</td>
              <td>${orderDetails.state}</td>
              <td>${orderDetails.action}</td>
              <td>${orderDetails.quantity}</td>
              <td>${orderDetails.sum}</td>
              <td>
                <a href="/driver/list/details/edit/${orderDetails.id}">edit</a>
              </td>
            </tr>
          </c:forEach>
        </table>
      </div>
    </div>
<%@ include file="../resources/footer.jsp" %>